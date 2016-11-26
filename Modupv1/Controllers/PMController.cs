using Modupv1.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMatrix.WebData;
using PagedList;
using PagedList.Mvc;
using System.Web.Script.Serialization;
using Newtonsoft.Json;


namespace Modupv1.Controllers
{
    public class PMController : Controller
    {
        //
        // GET: /PM/
        private Guid GetUserID()
        {

            var currentUser = Membership.GetUser(User.Identity.Name);
            var userID = (Guid)currentUser.ProviderUserKey;
            return userID;
        }

        dbModupEntities db = new dbModupEntities();


        [System.Web.Mvc.Authorize]
        public ActionResult Home()
        {
            var uName = Session["PM"].ToString();

            var queryU = from a in db.tbUserCredentials where a.username.Contains(uName) select a.userID;
            var cUserID = queryU.FirstOrDefault();

            var query = from a in db.tbPMs where a.userID.Equals(cUserID) select a.pmID;
            var qpmID = query.FirstOrDefault();

            var queryM = from a in db.tbProjects where a.pmID.Equals(qpmID) select a.projID;
            var prID = queryM.FirstOrDefault();

            projViewModel model = new projViewModel();

            model.tbProjects = db.tbProjects.Where(i => i.pmID == qpmID).ToList();
            model.tbModules = db.tbModules.Where(i => i.projID == prID).ToList();
            model.tbUser = db.tbUsers.Where(i => i.userID == cUserID).FirstOrDefault();
            model.tbPM = db.tbPMs.Where(i => i.pmID == qpmID).FirstOrDefault();
            
            

            TempData["fName"] = model.tbUser.firstName;
            TempData["lName"] = model.tbUser.lastName;

            TempData["page"] = "Home";
            return View(model);
        }

        [HttpGet]
        [System.Web.Mvc.Authorize]
        public ActionResult initiateProj()
        {
            
            ViewBag.fname = TempData["fName"];
            ViewBag.lname = TempData["lName"];
            TempData["page"] = "initiateProj";
            return View();

        }

        [HttpPost]
        [System.Web.Mvc.Authorize]
        public ActionResult initiateProj(projViewModel model)
        {
            

            try{
                if (HttpContext.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Request.Files[0];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/ProjectFiles"), model.file.FileName+model.tbPM.pmID);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);
                        model.tbProject.fileName = model.file.FileName + model.tbPM.pmID;
                    }
                }
            }
            catch { model.tbProject.fileName = ""; }

            var uName = Session["PM"].ToString();

                var queryU = from a in db.tbUserCredentials where a.username.Contains(uName) select a.userID;
                var cUserID = queryU.FirstOrDefault();

                var query = from a in db.tbPMs where a.userID.Equals(cUserID) select a.pmID;
                var qpmID = query.FirstOrDefault();

                model.tbProject.pmID = Convert.ToInt16(qpmID);
                model.tbProject.moduleNo = "0";
                model.tbProject.postDate = DateTime.Today.ToString("dd-MM-yyyy");
               
                model.tbProject.status = "Open";
                db.tbProjects.Add(model.tbProject);
                TempData["noOfMod"] = model.tbProject.moduleNo;

                TempData["fName"] = ViewBag.fname;
                TempData["lName"] = ViewBag.lname;

                db.SaveChanges();
                int id = model.tbProject.projID;
                string sPID = Convert.ToString(id);

                TempData["projID"] = id;
                TempData["message"] = "Project Created Succesfully !";

               // return RedirectToAction("project", "PM", new { id = sPID });
                TempData["page"] = "initiateProj";
                return View();
                //Failed to initiate project


            

        }


        [HttpGet]
        [System.Web.Mvc.Authorize]
        public ActionResult modulesBreak()
        {
            ViewBag.no = Request.QueryString["no"];
            //ViewBag.projID = pr;
            ViewBag.projID = Request.QueryString["prj"];
            int prjID = Convert.ToInt16(ViewBag.projID);

            var queryM = from mod in db.tbModules where mod.projID == prjID select mod;
            int noMod = 0;
            foreach (tbModule module in queryM)
            {
                noMod++;
            }
            noMod = noMod + 1;
            ViewBag.noMod = noMod;
            return View();
        }

        [HttpPost]
        [System.Web.Mvc.Authorize]
        public ActionResult modulesBreak(projViewModel model, string count, string prj)
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

            foreach (HttpPostedFileBase file in model.files)
            {
                if (HttpContext.Request.Files.AllKeys.Any())
                {
                    // Get the uploaded image from the Files collection
                    var httpPostedFile = HttpContext.Request.Files[0];

                    if (httpPostedFile != null)
                    {
                        // Validate the uploaded image(optional)

                        // Get the complete file path
                        var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/ModuleFiles"), model.file.FileName);

                        // Save the uploaded file to "UploadedFiles" folder
                        httpPostedFile.SaveAs(fileSavePath);

                    }
                }
            }

        
            for (int i = 0; i < no; i++)
            {
                model.tbModules[i].projID = Convert.ToInt16(projID);
                model.tbModules[i].filename = model.files[i].FileName;
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

            return RedirectToAction("project", "PM", new { id = prj });


        }


        [HttpGet]
        [System.Web.Mvc.Authorize]
        public ActionResult prjModules(string id)
        {



            int prjID = Convert.ToInt16(id);
            moduleViewModel model = new moduleViewModel();
            model.tbModules = db.tbModules.Where(i => i.projID == prjID).ToList();
            return View(model);
        }

        [HttpPost]
        [System.Web.Mvc.Authorize]
        public ActionResult prjModules()
        {


            return View();
        }

        [HttpGet]
        [System.Web.Mvc.Authorize]
        public ActionResult project(string id)
        {



            int prjID = Convert.ToInt16(id);
            ViewBag.prjID = prjID;
            projViewModel model = new projViewModel();
            model.tbProject = db.tbProjects.Where(i => i.projID == prjID).FirstOrDefault();
            TempData["page"] = "projects";
            return View(model);
        }

        [HttpGet]
        [System.Web.Mvc.Authorize]
        public ActionResult projects()
        {

            var uName = Session["PM"].ToString();

            var user = db.tbUserCredentials.Where(u => u.username.Equals(uName)).FirstOrDefault();
            var pm = user.tbUser.tbPMs.FirstOrDefault();

            projViewModel model = new projViewModel();
            model.tbProjects = db.tbProjects.Where(i => i.pmID == pm.pmID).OrderByDescending(x=>x.postDate).ToList();
            TempData["page"] = "projects";
            return View(model);

        }

        [HttpPost]
        [System.Web.Mvc.Authorize]
        public ActionResult modules()
        {


            return View();
        }


        [HttpGet]
        [System.Web.Mvc.Authorize]
        public ActionResult proposals(string id)
        {



            int modID = Convert.ToInt16(id);
            moduleViewModel model = new moduleViewModel();
            model.tbModules = db.tbModules.Where(i => i.projID == modID).ToList();
            TempData["page"] = "projects";
            return View(model);
        }

        [HttpGet]
        [Authorize]
        public ActionResult viewBidsMod(string id, int? page)
        {

            int modID = Convert.ToInt16(id);
            int pageNo = page ?? 1;
            moduleViewModel model = new moduleViewModel();
            tbModule Module = db.tbModules.Where(m => m.modID.Equals(modID)).FirstOrDefault();
            model.tbMod = Module;
            model.tbProposals = Module.tbProposals.Reverse().ToPagedList<tbProposal>(pageNo, 8);
            TempData["page"] = "projects";
            return View(model);
        }
        [HttpGet]
        [Authorize]
        public ActionResult viewBidsProj(string id, int? page)
        {

            int projID = Convert.ToInt16(id);
            int pageNo = page ?? 1;
            proposalViewModel model = new proposalViewModel();
            tbProject Project = db.tbProjects.Where(m => m.projID.Equals(projID)).FirstOrDefault();
            model.tbProject = Project;
            model.tbProjProposals = Project.tbProjProposals.Reverse().ToPagedList<tbProjProposal>(pageNo, 8);
            TempData["page"] = "projects";
            return View(model);
        }
        [HttpGet]
        [Authorize]
        public ActionResult viewProposal(string id)
        {

            int prjpropID = Convert.ToInt16(id);
            
            proposalViewModel model = new proposalViewModel();
            tbProjProposal projProposal = db.tbProjProposals.Where(p => p.prjpropID == prjpropID).FirstOrDefault();
            model.tbProjProposal = projProposal;
            model.tbProject = projProposal.tbProject;
            TempData["page"] = "projects";
            return View(model);
        }
        [HttpGet]
        [Authorize]
        public ActionResult viewProposalWR(string id)
        {

            int wrID = Convert.ToInt16(id);

            tbProjWorkroom wr = db.tbProjWorkrooms.Where(w => w.wrID == wrID).FirstOrDefault();
            tbProjProposal model = wr.tbAwardedProj.tbProjProposal;
            
            TempData["page"] = "projects";
            ViewBag.wroomID = wrID;
            return View(model);
        }
        [HttpGet]
        [Authorize]
        public ActionResult viewProposalModule(string id)
        {

            int propID = Convert.ToInt16(id);

            proposalViewModel model = new proposalViewModel();
            tbProposal Proposal = db.tbProposals.Where(p => p.propID == propID).FirstOrDefault();
            model.tbProposal = Proposal;
            model.tbModule = Proposal.tbModule;
            TempData["page"] = "projects";
            return View(model);
        }

        public ActionResult acceptProposal(string id)
        {

            int prjpropID = Convert.ToInt16(id);
            
            
            tbProjProposal projProposal = db.tbProjProposals.Where(p => p.prjpropID == prjpropID).FirstOrDefault();
            tbProject proj = db.tbProjects.Where(p => p.projID == projProposal.projID).FirstOrDefault();

            tbProjWorkroom model = new tbProjWorkroom();
            

            model.projID = projProposal.projID;

            model.tbAwardedProj = new tbAwardedProj();
            model.tbAwardedProj.projID = model.projID;
            model.tbAwardedProj.raID = projProposal.raID;
            model.tbAwardedProj.prjpropID = projProposal.prjpropID;
            int awModCount = Convert.ToInt32(projProposal.tbRequirementEngineer.tbClient.awardedProjects);
            awModCount++;
            projProposal.tbRequirementEngineer.tbClient.awardedProjects = Convert.ToString(awModCount);
            proj.status = "Analysis";
            db.tbProjWorkrooms.Add(model);
            
            db.SaveChanges();
            int wrID = model.wrID;
            TempData["page"] = "messages";

            return RedirectToAction("Messages", new { id = wrID});
        }

        public ActionResult acceptProposalModule(string id)
        {

            int propID = Convert.ToInt16(id);


            tbProposal Proposal = db.tbProposals.Where(p => p.propID == propID).FirstOrDefault();
            tbModule mod = db.tbModules.Where(p => p.modID == Proposal.modID).FirstOrDefault();

            tbModuleWorkroom model = new tbModuleWorkroom();

            model.tbAwardedModule = new tbAwardedModule();
            model.tbAwardedModule.modID = Proposal.modID;
            model.tbAwardedModule.devID = Proposal.devID;
            model.tbAwardedModule.propID = Proposal.propID;
            int awModCount = Convert.ToInt32(Proposal.tbDeveloper.tbClient.awardedProjects);
            awModCount++;
            Proposal.tbDeveloper.tbClient.awardedProjects = Convert.ToString(awModCount);
            mod.status = "Working";
            db.tbModuleWorkrooms.Add(model);
            
            db.SaveChanges();
            int awID = model.modID;
            TempData["page"] = "messages";

            return RedirectToAction("MessagesMod", new { id = awID });
        }

        [HttpGet]
        public ActionResult Messages(string id)
        {

         
            int wrID = Convert.ToInt16(id);
            ViewBag.wroomID = wrID;
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
        public void Messages(string id,string message)
        {

            //return Json(new { id=id,msg=message});

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
                model.mfrom = wr.tbAwardedProj.tbProject.tbPM.tbUser.firstName + " " + wr.tbAwardedProj.tbProject.tbPM.tbUser.lastName;
                model.mto = wr.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName + " " + wr.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.lastName;
                model.dateTime = DateTime.Today.ToShortDateString();
                
                db.tbMessages.Add(model);
                db.SaveChanges();

                TempData["page"] = "messages";
                var context = Microsoft.AspNet.SignalR.GlobalHost.ConnectionManager.GetHubContext<MessageHub>();
                context.Clients.All.broadcast(model.mfrom,message,model.dateTime,model.attachment);
                return;
                //return Json(new { mfrom = model.mfrom, mTo = model.mto, msg = model.text, date = model.dateTime , success = true},JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return;
            }

        }

        [HttpGet]
        [Authorize]
        public ActionResult MessagesMod(string id)
        {
            try
            {
                int wrID = Convert.ToInt16(id);
                ViewBag.projID = wrID;
                tbModuleWorkroom wr = db.tbModules.Find(wrID).tbAwardedModule.tbModuleWorkrooms.FirstOrDefault();
                List<tbModMessage> messages = new List<tbModMessage>();
                messages = wr.tbModMessages.ToList();

                TempData["page"] = "messages";
                if (Request.IsAjaxRequest())
                {
                    var result = from x in wr.tbModMessages.Reverse().ToList()
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
            catch
            {
                return View();
            }
        }




        [HttpPost]
        public void MessagesMod(string id, string message)
        {

            //return Json(new { id=id,msg=message});

            int wrID = Convert.ToInt32(id);


            tbModuleWorkroom wr = db.tbModuleWorkrooms.Find(wrID);
            tbModMessage model = new tbModMessage();



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



                            bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id));
                            if (!IsExists)
                            { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id)); }
                            var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id), fileContent.FileName);
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
                model.mfrom = wr.tbAwardedModule.tbModule.tbProject.tbPM.tbUser.firstName + " " + wr.tbAwardedModule.tbModule.tbProject.tbPM.tbUser.lastName;
                model.mto = wr.tbAwardedModule.tbDeveloper.tbClient.tbUser.firstName + " " + wr.tbAwardedModule.tbDeveloper.tbClient.tbUser.lastName;
                model.dateTime = DateTime.Today.ToShortDateString();

                db.tbModMessages.Add(model);
                db.SaveChanges();

                TempData["page"] = "messages";
                ViewBag.projID = wrID;
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
        public FileResult Download(string id,string filename)
        {
            var filePath = Server.MapPath("~/App_Data/ProjectFiles/"+ id +"/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata,contentType,filename);
        }
        [Authorize]
        public FileResult DownloadWR(string id,string filename)
        {
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/" + id + "/"+ filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }
        [Authorize]
        public FileResult DownloadWRMod(string id, string filename)
        {
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id + "/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }
        [Authorize]
        public FileResult DownloadChk(string id, string filename)
        {
            var filePath = Server.MapPath("~/App_Data/CheckPointFiles/" + id + "/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }
        [Authorize]
        public FileResult DownloadTestLog(string id, string filename)
        {
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/" + id + "/TestLog/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }

        [Authorize]
        [HttpGet]
        public ActionResult Submission(string id)
        {
            int pID = Convert.ToInt16(id);
            tbProjWorkroom wroom = db.tbProjWorkrooms.Find(pID);
            projViewModel model = new projViewModel();
            
            model.tbProject = wroom.tbAwardedProj.tbProject;
            ViewBag.wroomID = pID;
            TempData["page"] = "Submission";
            return View(model);
        
        }

        [Authorize]
        [HttpPost]
        public ActionResult Submission(int id,string accept,String[] modIDs)
        {
            ViewBag.wroomID = id;
            int wID = Convert.ToInt16(id);
            int moduleID= 0;

            tbProjWorkroom wroom = db.tbProjWorkrooms.Where(p => p.wrID.Equals(wID)).FirstOrDefault();
            
            
            
            if (accept.Equals("true"))
            {
                for (int i = 0; i < modIDs.Count() ; i++)
                {
                   //module.status = "Open";
                    moduleID = Convert.ToInt16(modIDs[i]);
                    var mod = db.tbModules.Find(moduleID);
                    mod.status = "Open";
                    
                    db.SaveChanges();
                }
                int chk=0;
                foreach(tbModule module in wroom.tbAwardedProj.tbProject.tbModules){
                    if(module.status.Equals("Open")){
                        chk++;
                    }
                }
                if(wroom.tbAwardedProj.tbProject.tbModules.Count == chk){
                    wroom.tbAwardedProj.tbProject.status = "Closed";
                    wroom.tbAwardedProj.tbRequirementEngineer.tbClient.completedTasks++;
                    
                }
                db.SaveChanges();
                
                TempData["message"] = "Your Project Modules are now Live !";
                TempData["projID"] = wID;

            } else if (accept.Equals("false"))
            {
                for (int i = 0; i < modIDs.Count(); i++)
                {
                    //module.status = "Open";
                    moduleID = Convert.ToInt16(modIDs[i]);
                    var mod = db.tbModules.Find(moduleID);
                    mod.status = "Analysis";

                    db.SaveChanges();
                }
                
                TempData["message"] = "Modules Sent to " + wroom.tbAwardedProj.tbRequirementEngineer.tbClient.tbUser.firstName + " for review !";
                TempData["projID"] = wID;
            }
            if (wroom.tbAwardedProj.tbProject.status.Equals("Closed")) {
                return RedirectToAction("Project", new { id = wroom.projID });
            }
            else
            {
                return RedirectToAction("Submission", new { id = wID });
            }
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
                ViewBag.wroomID = id;
                return View(wrFiles);
            }
            catch {
                TempData["page"] = "filesProj";
                ViewBag.wroomID = id;
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
        [HttpGet]
        public ActionResult viewProfile(string id)
        {
            int uID = Convert.ToInt16(id);
            profileViewModel model = new profileViewModel();
            model.tbUser = db.tbUsers.Where(u => u.userID == uID).FirstOrDefault();
            model.tbClient = db.tbClients.Where(c => c.userID == uID).FirstOrDefault();
            
            return View(model);
        }

        [Authorize]
        [HttpGet]
        public ActionResult requestsMod(string id)
        {
            int modID = Convert.ToInt32(id);
            RequestModel model = new RequestModel();
            model.ChPRequests = db.tbCheckpointReqs.Where(r => r.tbModCheckpoint.tbModuleWorkroom.modID == modID).ToList();
            model.ModRequests = db.tbModRequests.Where(r => r.tbModuleWorkroom.modID == modID).ToList();
            TempData["page"] = "Request";
            ViewBag.projID = modID;
            return View(model);
        }

        [Authorize]
        [HttpPost]
        public ActionResult requestsHandler(string id, string req, string reqType)
        {
            try
            {

                int reqID = Convert.ToInt32(id);
                
                if (reqType.Equals("Checkpoint"))
                {
                    var request = db.tbCheckpointReqs.Where(chReq => chReq.reqID == reqID).FirstOrDefault();
                    if (req.Equals("Yes"))
                    {
                        request.status = "Approved";
                        request.tbModCheckpoint.status = "Completed";

                        request.tbModCheckpoint.tbModuleWorkroom.tbAwardedModule.tbDeveloper.tbClient.completedTasks++;
                        db.SaveChanges();
                        return Json(new { ChReq = "Accepted" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        request.status = "Rejected";
                        request.tbModCheckpoint.status = "Working";
                        db.SaveChanges();
                        return Json(new {ChReq = "Rejected" }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    var request = db.tbModRequests.Where(modReq => modReq.reqID == reqID).FirstOrDefault();
                    if (req.Equals("Yes"))
                    {
                        request.status = "Approved";
                        var module = db.tbModuleWorkrooms.Where(wr => wr.tbModRequests.FirstOrDefault().reqID == reqID).FirstOrDefault();
                        module.tbAwardedModule.tbModule.status = "Completed";
                        db.SaveChanges();
                        return Json(new { ChReq = "Accepted" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        request.status = "Rejected";
                        var module = db.tbModuleWorkrooms.Where(wr => wr.tbModRequests.FirstOrDefault().reqID == reqID).FirstOrDefault();
                        module.tbAwardedModule.tbModule.status = "Working";
                        db.SaveChanges();
                        return Json(new { ChReq = "Rejected" }, JsonRequestBehavior.AllowGet);
                    }
                    
                }
                
            }
            catch
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }


        [HttpGet]
        [Authorize]
        public ActionResult viewProposalModuleWR(string id)
        {
            

            int modID = Convert.ToInt16(id);

            proposalViewModel model = new proposalViewModel();
            tbProposal Proposal = db.tbModules.Find(modID).tbAwardedModule.tbProposal;
            model.tbProposal = Proposal;
            model.tbModule = Proposal.tbModule;
            TempData["page"] = "projects";
            ViewBag.projID = modID;
            return View("viewProposalModule","PMWorkroomModule", model);
        }


        [Authorize]
        [HttpGet]
        public ActionResult filesMod(string id)
        {
            
                int idI = Convert.ToInt32(id);
                var workroom = db.tbModules.Find(idI).tbAwardedModule.tbModuleWorkrooms.FirstOrDefault();
                var filePath = Server.MapPath("~/App_Data/WorkroomFiles/Module/" + workroom.wrID + "/");
                DirectoryInfo di = new DirectoryInfo(filePath);
                FileModel wrFiles = new FileModel();
                wrFiles.modFiles = new List<tbModWorkroomFile>();
                try
                {
                foreach (FileInfo file in di.GetFiles())
                {
                    tbModWorkroomFile f = new tbModWorkroomFile();

                    f.filename = file.Name;
                    f.size = file.Length.ToString();
                    f.date = file.CreationTime.ToString();
                    try { f.uploadedBy = workroom.tbModMessages.Where(wr => wr.attachment.Equals(f.filename)).FirstOrDefault().mfrom; }
                    catch { f.uploadedBy = workroom.tbModWorkroomFiles.Where(wrFile => wrFile.filename.Equals(f.filename)).FirstOrDefault().uploadedBy; }
                    wrFiles.modFiles.Add(f);

                }
                TempData["page"] = "filesProj";
                ViewBag.projID = id;
                ViewBag.wr = workroom.wrID;
                wrFiles.modFiles.Reverse();
                return View(wrFiles);
            }
            catch
            {
                TempData["page"] = "filesProj";
                ViewBag.projID = id;
                ViewBag.wr = workroom.wrID;
                wrFiles.modFiles.Reverse();
                return View(wrFiles);
            }
        }

        [Authorize]
        [HttpPost]
        public ActionResult filesMod(string wr,string test)
        {
            var temp = Request["wr"].ToString();
            int id = Convert.ToInt32(wr);
            var workroom = db.tbModuleWorkrooms.Find(id);
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/Module/" + workroom.wrID + "/");
            tbModWorkroomFile model = new tbModWorkroomFile();
            
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
                            bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id));
                            if (!IsExists)
                            { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id)); }
                            var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id), fileContent.FileName);
                            fileContent.SaveAs(fileSavePath);
                            model.wrID = id;
                            model.filename = fileContent.FileName;
                            model.size = Convert.ToString(fileContent.ContentLength);
                            model.date = DateTime.Today.ToShortDateString();
                            model.uploadedBy = workroom.tbAwardedModule.tbModule.tbProject.tbPM.tbUser.firstName + " " + workroom.tbAwardedModule.tbModule.tbProject.tbPM.tbUser.lastName;
                            db.tbModWorkroomFiles.Add(model);
                            
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
                ViewBag.projID = workroom.tbAwardedModule.modID;


                
                return Json(new { obj = filesAdded},JsonRequestBehavior.AllowGet);
                
            }
            catch
            {
                return Json(false);
            }

         
        }

        [Authorize]
        [HttpPost]
        public ActionResult remFileModWR(string id,string name)
        {
            try
            {
                FileInfo file = new FileInfo(Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id + "/" + name));
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

        [Authorize]
        [HttpGet]
        public ActionResult progressModWR(string id)
        {
            int modID = Convert.ToInt32(id);
            tbModule model = db.tbAwardedModules.Where(aw => aw.modID == modID).FirstOrDefault().tbModule;
            ViewBag.projID = id;
            TempData["page"] = "Submissions";
            return View(model);
        }
    }
}
