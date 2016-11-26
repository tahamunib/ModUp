using Modupv1.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMatrix.Data;
using WebMatrix.WebData;


namespace Modupv1.Controllers
{
    public class RequirementEngineerController : Controller
    {
        //
        // GET: /RequirementEngineer/

        dbModupEntities db = new dbModupEntities();

        [Authorize]
        public ActionResult Home()
        {
            string username = Session["RA"].ToString();
            RAModel model = new RAModel();
            tbUserCredential uc  = db.tbUserCredentials.Where(u => u.username.Equals(username)).FirstOrDefault();
            tbClient client = db.tbClients.Where(c => c.userID.Equals(uc.userID)).FirstOrDefault();
            model.tbReqEngineer  =  client.tbRequirementEngineers.Where(c => c.clientID.Equals(client.clientID)).FirstOrDefault();
            model.proposals = model.tbReqEngineer.tbProjProposals.ToList();
            model.awardedProjects = db.tbAwardedProjs.Where(aw => aw.raID == model.tbReqEngineer.raID).ToList();
            model.workrooms = new List<tbProjWorkroom>();
            foreach (var proj in model.awardedProjects) { 
            tbProjWorkroom wr = db.tbProjWorkrooms.Where(w => w.projID.Equals(proj.projID)).First();
           
            model.workrooms.Add(wr);
            }
            return View(model);

        }

        

        [HttpGet]
        [Authorize]
        public ActionResult BrowseProj(int? page, int? budget, string q)
        {

            int pageNo = page ?? 1;
            int budgetAmt = budget ?? 0;
            string query = ViewBag.query;
            ViewBag.budget = budgetAmt;
            
           
            IQueryable<tbProject> projects;
            if (String.IsNullOrEmpty(q))
            {
                projects = db.tbProjects.ToList().AsQueryable();
                query = "";
            }
            else
            {
                ViewBag.query = q;
                query = Convert.ToString(ViewBag.query);
                projects = db.tbProjects.Where(m => m.title.Contains(query)).ToList().AsQueryable();
            }


            IQueryable<tbProject> projs;

            switch (budgetAmt)
            {
                case 1:
                    projs = projects.Where(m => m.estimatedAmt <= 50).ToList().AsQueryable();
                    break;
                case 2:
                    projs = projects.Where(m => m.estimatedAmt > 50 && m.estimatedAmt <= 100).ToList().AsQueryable();
                    break;
                case 3:
                    projs = projects.Where(m => m.estimatedAmt > 100 && m.estimatedAmt <= 150).ToList().AsQueryable();
                    break;
                case 4:
                    projs = projects.Where(m => m.estimatedAmt > 150).ToList().AsQueryable();
                    break;
                default:
                    projs = projects.ToList().AsQueryable();
                    break;
            }

            //switch (skl)
            //{
            //    case "C#":
            //        projs = projs.Where(m => m.skillReq.Equals("C#")).ToList().AsQueryable();
            //        break;
            //    case "PHP":
            //        projs = projs.Where(m => m.skillReq.Equals("PHP")).ToList().AsQueryable();
            //        break;
            //    case "ASP":
            //        projs = projs.Where(m => m.skillReq.Equals("ASP")).ToList().AsQueryable();
            //        break;
            //    case "VBA":
            //        projs = projs.Where(m => m.skillReq.Equals("VBA")).ToList().AsQueryable();
            //        break;
            //    default:
            //        projs = projs.ToList().AsQueryable();
            //        break;
            //}

            IPagedList<tbProject> onePage = projs.ToPagedList(pageNo, 8);

            return View(onePage);
        }

        [HttpGet]
        [Authorize]
        public ActionResult submitProposalProj(string id, int? page)
        {
            int pageNo = page ?? 1;
            int projID = Convert.ToInt16(id);

            string username = Session["RA"].ToString();
            var uName = WebSecurity.CurrentUserName;
            var raID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(username)).FirstOrDefault().tbRequirementEngineers.FirstOrDefault().raID; 

            proposalViewModel model = new proposalViewModel();
            tbProject proj = db.tbProjects.Find(projID);
            model.tbProject = proj;
            model.tbProjProposals = proj.tbProjProposals.ToPagedList(pageNo, 5);
            var prop = proj.tbProjProposals.Where(p=>p.raID == raID).FirstOrDefault();
            if (prop == null)
            {
                return View(model);
            }
            else
            {
                return RedirectToAction("viewProposal", new { id = prop.projID });
            }
        }
        [HttpPost]
        [Authorize]
        public ActionResult submitProposalProj(proposalViewModel model, string id)
        {

            string username = Session["RA"].ToString();
            var uName = WebSecurity.CurrentUserName;
            // var queryU = db.tbDevelopers.Where(u => u.tbUser.tbUserCredential.username.Equals(uName)).FirstOrDefault().devID;
            int pID = Convert.ToInt16(id);
            model.tbProjProposal.raID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(username)).FirstOrDefault().tbRequirementEngineers.FirstOrDefault().raID;
            model.tbProjProposal.projID = pID;
            db.tbProjProposals.Add(model.tbProjProposal);
            db.SaveChanges();
            TempData["message"] = "Proposal Submitted!";
            return RedirectToAction("BrowseProj");
           // return View(pID);
        }

        [Authorize]
        public ActionResult viewProposal(string id)
        {
            string username = Session["RA"].ToString();
            int wrID = Convert.ToInt16(id);
            int raID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(username)).FirstOrDefault().tbRequirementEngineers.FirstOrDefault().raID;
            proposalViewModel model = new proposalViewModel();
            tbProjProposal projProposal = db.tbProjProposals.Where(p => p.projID == wrID && p.raID == raID).FirstOrDefault();
            model.tbProjProposal = projProposal;
            model.tbProject = projProposal.tbProject;
            TempData["page"] = "Proposal";
            return View(model);
        }

        [Authorize]
        public ActionResult viewProposalWR(string id)
        {
            string username = Session["RA"].ToString();
            ViewBag.wrID = Convert.ToInt16(id);
            int wrID = Convert.ToInt16(id);
            int raID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(username)).FirstOrDefault().tbRequirementEngineers.FirstOrDefault().raID;
            tbProjWorkroom wroom = db.tbProjWorkrooms.Find(wrID);
            proposalViewModel model = new proposalViewModel();
            tbProjProposal projProposal = wroom.tbAwardedProj.tbProjProposal;
            model.tbProjProposal = projProposal;
            model.tbProject = projProposal.tbProject;
            TempData["page"] = "Proposal";
            return View(model);
        }

        [HttpGet]
        [Authorize]
        public ActionResult modulesBreak(string id)
        {
            //ViewBag.no = Request.QueryString["no"];
            //ViewBag.projID = pr;
            //ViewBag.projID = Convert.ToInt16(id);
            int wrID = Convert.ToInt16(id);
            ViewBag.wrID = wrID;
            
            projViewModel model = new projViewModel();
            tbProjWorkroom wroom = db.tbProjWorkrooms.Find(wrID);
            model.tbProject = wroom.tbAwardedProj.tbProject;
            TempData["page"] = "modulesBreak";
            return View(model);
        }



        [HttpGet]
        [Authorize]
        public ActionResult submitModules(string count, string prj,string wr)
        {

            int prjID = Convert.ToInt16(prj);
            int countI = Convert.ToInt16(count);
            ViewBag.no = countI;
            var queryM = from mod in db.tbModules where mod.projID == prjID select mod;
            int noMod = 0;
            foreach (tbModule module in queryM)
            {
                noMod++;
            }
            noMod = noMod + 1;
            ViewBag.noMod = noMod;
            ViewBag.projID = prjID;
            ViewBag.wrID = wr;
            TempData["prjID"] = prjID;
            TempData["page"] = "modulesBreak";
            return View();

        }





        [HttpPost]
        [Authorize]
        public ActionResult submitModules(projViewModel model, string count, string prj, string wr)
        {

            int no;
            int fileNo;
            try
            {
                no = model.tbModules.Count;
                fileNo = model.files.Count;
            }
            catch
            {
                no = 1;
            }
            int projID = Convert.ToInt16(prj);
            if (model.files.Count > 0)
            {

                foreach (HttpPostedFileBase file in model.files)
                {
                    if (file == null)
                    {
                        continue;
                    }
                    else
                    {

                        if (HttpContext.Request.Files.AllKeys.Any())
                        {

                            var httpPostedFile = HttpContext.Request.Files[0];

                            if (httpPostedFile != null)
                            {
                                var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/ModuleFiles"), file.FileName);
                                httpPostedFile.SaveAs(fileSavePath);

                            }
                        }
                    }
                }

            }


            for (int i = 0; i < no; i++)
            {
                model.tbModules[i].projID = Convert.ToInt16(projID);
                if (model.files.Count > 0)
                {
                    if (model.files[i] != null)
                    {
                        model.tbModules[i].filename = model.files[i].FileName;
                    }
                    else
                    {
                        model.tbModules[i].filename = "N/A";
                    }
                }
                
                model.tbModules[i].status = "Analysis";
                db.tbModules.Add(model.tbModules[i]);
                db.SaveChanges();
            }



            var queryM = from mod in db.tbModules where mod.projID == projID select mod;
            int noMod = 0;
            foreach (tbModule module in queryM)
            {
                noMod++;
            }

            var query = from proj in db.tbProjects where proj.projID == projID select proj;

            foreach (tbProject project in query)
            {
                project.moduleNo = Convert.ToString(noMod);
                
            }
            
            db.SaveChanges();
           
            TempData["prjID"] = projID;
            return RedirectToAction("modulesBreak", "RequirementEngineer", new { id = wr});


        }

        [Authorize]
        public FileResult Download(string filename,string of)
        {
            
            var filePath = Server.MapPath("~/App_Data/"+of+"Files/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }


        [Authorize]
        [HttpGet]
        public ActionResult Messages(string id)
        {

            int wrID = Convert.ToInt16(id);
            ViewBag.wrID = wrID;
            tbProjWorkroom wr = db.tbProjWorkrooms.Find(wrID);
            List<tbMessage> messages = new List<tbMessage>();
            messages = wr.tbMessages.ToList();

            TempData["page"] = "messages";
            if (Request.IsAjaxRequest())
            {
                var result = from x in wr.tbMessages.Reverse().ToList()
                             select new
                             {
                                 x.mfrom,
                                 x.mto,
                                 x.text,
                                 x.dateTime,
                                 x.attachment,
                             };

                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return View(wr);
            }
           
        }

        [HttpPost]
        public void Messages(string id, string message)
        {
            int wrID = Convert.ToInt32(id);


            tbProjWorkroom wr = db.tbProjWorkrooms.Find(wrID);
            tbMessage model = new tbMessage();



            try
            {
                if (Request.Files.Count > 0)
                {
                    foreach (string file in Request.Files)
                    {
                        var fileContent = Request.Files[file];
                        if (fileContent != null && fileContent.ContentLength > 0)
                        {

                            // and optionally write the file to disk
                            //var fileName = Path.GetFileName(file);
                            //var path = Path.Combine(Server.MapPath("~/App_Data/Images"), fileName);
                            //fileContent.SaveAs();



                            bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/WorkroomFiles/" + id));
                            if (!IsExists)
                            { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/WorkroomFiles/" + id)); }
                            var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/WorkroomFiles/" + id), fileContent.FileName);
                            fileContent.SaveAs(fileSavePath);
                            model.attachment = fileContent.FileName;

                        }

                    } 
                }
                else
                {
                    model.attachment = "No Attachment";
                }
                model.wrID = wrID;
                model.text = message;
                model.mfrom = wr.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName + " " + wr.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.lastName;
                model.mto = wr.tbAwardedProj.tbProject.tbPM.tbUser.firstName + " " + wr.tbAwardedProj.tbProject.tbPM.tbUser.lastName;
                model.dateTime = DateTime.Today.ToShortDateString();

                db.tbMessages.Add(model);
                db.SaveChanges();

                TempData["page"] = "messages";
                var context = Microsoft.AspNet.SignalR.GlobalHost.ConnectionManager.GetHubContext<MessageHub>();
                context.Clients.All.broadcast(model.mfrom, message, model.dateTime, model.attachment);
                return;
                //return Json(new { mfrom = model.mfrom, mTo = model.mto, msg = model.text, date = model.dateTime , success = true},JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return;
            }
        }


       
        
        [Authorize]
        [HttpGet]
        public ActionResult Submission(string id)
        {
            string mess;
            try
            {
                mess = TempData["message"].ToString();
                TempData["message"] = mess;
            }
            catch
            {
                mess = "";
            }
            ViewBag.wrID = id;
            int wrID = Convert.ToInt16(id);
            tbProjWorkroom wroom = db.tbProjWorkrooms.Find(wrID);
            projViewModel model = new projViewModel();
            model.tbProject = wroom.tbAwardedProj.tbProject;
            
            TempData["page"] = "Submission";
            return View(model);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Submission(int id, String[] modIds)
        {
            ViewBag.wrID = id;
            int count = modIds.Count();
            int wrID = Convert.ToInt16(id);
            int moduleID = 0;
            String name = "Modules";
            tbProjWorkroom wroom = db.tbProjWorkrooms.Find(wrID);
            tbProject project = wroom.tbAwardedProj.tbProject;
            
               

                for (int i = 0; i < count;i++ )
                {
                    moduleID = Convert.ToInt16(modIds[i]);
                    var mod = db.tbModules.Find(moduleID);
                    mod.status = "Analyzed";
                    name = mod.title;
                    db.SaveChanges();
                }

                int chk = 0;
                foreach (tbModule module in project.tbModules)
                {
                    if (module.status.Equals("Analyzed"))
                    {
                        chk++;
                    }
                }
                if (project.tbModules.Count == chk)
                {
                    project.status = "Analyzed";
                }
                db.SaveChanges();

                
                
                if (modIds.Count() > 1)
                {
                    TempData["message"] = "Modules are Submitted to " + project.tbPM.tbUser.firstName + " for review.";
                }
                else if (modIds.Count() == 1)
                {
                    TempData["message"] = name+" is Submitted to " + project.tbPM.tbUser.firstName + " for review.";
                }
           
                
            return RedirectToAction("Submission", new { id = wrID});
        }

        [HttpGet]
        [Authorize]
        public ActionResult editMod(int id,int wrID)
        {
            int modID = Convert.ToInt32(id);
            projViewModel model = new projViewModel();
            model.tbModule = db.tbModules.Find(modID);
            ViewBag.wrID = wrID;
            TempData["page"] = "Submission";
            return View(model);
        }

        [HttpPost]
        [Authorize]
        public ActionResult editMod(int id,int wrID,projViewModel model)
        {

            tbModule module = db.tbModules.Find(id);
            
            module.description = model.tbModule.description;
            module.closeDate = model.tbModule.closeDate;
            module.devSkillLevel = model.tbModule.devSkillLevel;
            module.devType = model.tbModule.devType;
            module.category = model.tbModule.category;
            module.budget = model.tbModule.budget;
            module.skillReq = model.tbModule.skillReq;
            if (model.file != null)
            {

                foreach (HttpPostedFileBase file in model.files)
                {
                    if (file == null)
                    {
                        continue;
                    }
                    else
                    {

                        if (HttpContext.Request.Files.AllKeys.Any())
                        {

                            var httpPostedFile = HttpContext.Request.Files[0];

                            if (httpPostedFile != null)
                            {
                                var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/ModuleFiles"), file.FileName);
                                httpPostedFile.SaveAs(fileSavePath);
                                module.filename = file.FileName;
                            }
                        }
                    }
                }

            }
            
            db.SaveChanges();

            return RedirectToAction("Submission", "RequirementEngineer", new {id= wrID });
        }


        [Authorize]
        [HttpGet]
        public ActionResult filesProj(string id)
        {
            int idI = Convert.ToInt32(id);
            var workroom = db.tbProjWorkrooms.Find(idI);
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/" + id + "/");
            DirectoryInfo di = new DirectoryInfo(filePath);
            FileModel wrFiles = new FileModel();
            wrFiles.projFiles = new List<tbProjWorkroomFile>();
            try
            {
                foreach (FileInfo file in di.GetFiles())
                {
                    tbProjWorkroomFile f = new tbProjWorkroomFile();
                    f.filename = file.Name;
                    f.size = file.Length.ToString();
                    f.date = file.CreationTime.ToString();
                    try { f.uploadedBy = workroom.tbMessages.Where(wr => wr.attachment.Equals(f.filename)).FirstOrDefault().mfrom; }
                    catch { f.uploadedBy = workroom.tbProjWorkroomFiles.Where(wrFile => wrFile.filename.Equals(f.filename)).FirstOrDefault().uploadedBy; }
                    wrFiles.projFiles.Add(f);

                }
                TempData["page"] = "filesProj";
                ViewBag.wrID = id;
                return View(wrFiles);
            }
            catch
            {
                TempData["page"] = "filesProj";
                ViewBag.wrID = id;
                return View(wrFiles);
            }

        }

        [Authorize]
        [HttpPost]
        public ActionResult filesProj(string wr, string filename)
        {
            var temp = Request["wr"].ToString();
            int id = Convert.ToInt32(wr);
            var workroom = db.tbProjWorkrooms.Find(id);
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/" + workroom.wrID + "/");
            tbProjWorkroomFile model = new tbProjWorkroomFile();

            List<SerializeFileModel> filesAdded = new List<SerializeFileModel>();
            try
            {
                if (Request.Files.Count > 0)
                {
                    foreach (string file in Request.Files)
                    {
                        var fileContent = Request.Files[file];
                        if (fileContent != null && fileContent.ContentLength > 0)
                        {
                            SerializeFileModel sFile = new SerializeFileModel();
                            bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/WorkroomFiles/" + id));
                            if (!IsExists)
                            { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/WorkroomFiles/" + id)); }
                            var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/WorkroomFiles/" + id), fileContent.FileName);
                            fileContent.SaveAs(fileSavePath);
                            model.wrID = id;
                            model.filename = fileContent.FileName;
                            model.size = Convert.ToString(fileContent.ContentLength);
                            model.date = DateTime.Today.ToShortDateString();
                            model.uploadedBy = workroom.tbAwardedProj.tbProject.tbPM.tbUser.firstName + " " + workroom.tbAwardedProj.tbProject.tbPM.tbUser.lastName;
                            db.tbProjWorkroomFiles.Add(model);

                            sFile.filename = model.filename;
                            sFile.size = model.size;
                            sFile.date = model.date;
                            sFile.uploadedBy = model.uploadedBy;
                            filesAdded.Add(sFile);
                            db.SaveChanges();
                        }

                    }
                }
                else
                {
                    return Json(false);
                }



                TempData["page"] = "filesProj";
                ViewBag.wrID = workroom.wrID;



                return Json(new { obj = filesAdded }, JsonRequestBehavior.AllowGet);

            }
            catch
            {
                TempData["page"] = "filesProj";
                ViewBag.wrID = workroom.wrID;
                return Json(false);
            }

        }


        [Authorize]
        [HttpPost]
        public ActionResult remFileProjWR(string id, string name)
        {
            try
            {
                FileInfo file = new FileInfo(Server.MapPath("~/App_Data/WorkroomFiles/" + id + "/" + name));
                file.Delete();
                int wrID = Convert.ToInt32(id);
                tbModWorkroomFile f = db.tbModWorkroomFiles.Where(wr => wr.filename.Equals(name)).FirstOrDefault();
                db.tbModWorkroomFiles.Remove(f);
                db.SaveChanges();
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }


    }
}
