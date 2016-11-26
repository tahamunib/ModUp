using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Modupv1.Models;
using WebMatrix.WebData;
using PagedList.Mvc;
using PagedList;
using System.IO;

namespace Modupv1.Controllers
{
    public class DeveloperController : Controller
    {
        //
        // GET: /Developer/

        public dbModupEntities db = new dbModupEntities();



        public ActionResult Home()
        {
            var uName = Session["dev"].ToString();
            var dId = Convert.ToInt32(Session["devID"]);
            tbUserCredential user = db.tbUserCredentials.Where(uc => uc.username.Equals(uName)).Single();
            devViewModel model = new devViewModel();
            model.tbUser = user.tbUser;
            model.tbDeveloper = db.tbDevelopers.Where(d => d.tbClient.tbUser.userID == user.userID).FirstOrDefault();
            model.Proposals = model.tbDeveloper.tbProposals.ToList();
            model.tbAwardedModules = db.tbAwardedModules.Where(aw => aw.devID == dId).ToList();

            return View(model);
        }

        [HttpGet]
        [Authorize]
        public ActionResult skillEnquiry(string id)
        {
            var uName = Session["dev"].ToString();

            var queryU = from a in db.tbUserCredentials where a.username.Contains(uName) select a.userID;
            var cUserID = queryU.FirstOrDefault();

            devViewModel model = new devViewModel();
            model.tbUser = db.tbUsers.Where(i => i.userID == cUserID).FirstOrDefault();

            return View(model);
        }


        [HttpPost]
        [Authorize]
        public ActionResult skillEnquiry(profileViewModel model, string usID)
        {

            int uID = Convert.ToInt16(usID);


            tbClient client = db.tbClients.Where(c => c.userID.Equals(uID)).Single();
            model.tbSkill.devID = client.tbDevelopers.FirstOrDefault().devID;

            db.tbSkills.Add(model.tbSkill);
            db.SaveChanges();
            int skID = model.tbSkill.skillID;
            var action = from dev in db.tbClients where dev.userID == uID select dev;

            string actionUpdated = "skillEnquiry";
            foreach (tbClient d in action)
            {
                d.actionCont = "quizVerify";
                actionUpdated = d.actionCont;
            }
            db.SaveChanges();
            TempData["skill"] = skID;

            return RedirectToAction(actionUpdated, "Developer", new { id = skID });
        }

        [HttpGet]
        public ActionResult quizVerify(string id)
        {

            ViewData["skillID"] = id;
            int sID = Convert.ToInt16(id);
            tbSkill model = db.tbSkills.Where(sk => sk.skillID.Equals(sID)).Single();

            return View(model);
        }


        //[HttpPost]
        //public ActionResult quizVerify()
        //{
        //    return View();
        //}


        [HttpGet]
        public ActionResult quiz(string id)
        {
            int sklID = Convert.ToInt16(Session["sklID"].ToString());

            quizViewModel model = new quizViewModel();
            string username = Session["dev"].ToString();
            tbUserCredential userCredential = db.tbUserCredentials.Where(uc => uc.username.Equals(username)).Single();
            int Uid = userCredential.tbUser.userID;
            tbClient client = db.tbClients.Where(uc => uc.userID.Equals(Uid)).Single();
            int devID = client.tbDevelopers.FirstOrDefault().devID;
            tbSkill skl = db.tbSkills.Where(uc => uc.devID.Equals(devID) && uc.skillID.Equals(sklID)).Single();

            int i = Convert.ToInt16(id);

            List<tbQuestion> questions = db.tbQuestions.Where(q => q.skill.Equals(skl.name)).ToList();
            if (i < questions.Count)
            {
                ViewBag.count = questions.Count;

                int Qid = questions[i].qID;
                List<tbAnswer> answers = db.tbAnswers.Where(a => a.qID == Qid).ToList();



                model.tbSkill = skl;
                model.tbQuestion = questions;
                model.tbAnswer = answers;
                model.tbDeveloper = client.tbDevelopers.FirstOrDefault();
                model.i = i;
                model.score = 0;

            }
            else
            {
                //quiz completed
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult quiz(quizViewModel model, string id, string skill, string dev, string skills, string scr)
        {

            int i = Convert.ToInt16(id);
            int did = Convert.ToInt16(dev);
            int skid = Convert.ToInt16(skills);
            int score = Convert.ToInt16(scr);

            string ans = model.selectedAns;



            List<tbQuestion> questions = db.tbQuestions.Where(q => q.skill.Equals(skill)).ToList();
            int total = questions.Count;
            int QidPrev = questions[i - 1].qID;
            List<tbAnswer> answersPrev = db.tbAnswers.Where(a => a.qID == QidPrev).ToList();
            string corrAns = answersPrev.Find(item => item.isCorrect.Equals("Yes")).answer;
            if (ans.Equals(corrAns))
            {
                score = score + 1;

            }

            model.tbDeveloper = db.tbDevelopers.Where(d => d.devID.Equals(did)).Single();
            model.tbSkill = db.tbSkills.Where(uc => uc.devID.Equals(did) && uc.skillID.Equals(skid)).Single();
            model.score = score;
            if (i < questions.Count)
            {
                ViewBag.count = questions.Count;

                int Qid = questions[i].qID;

                List<tbAnswer> answers = db.tbAnswers.Where(a => a.qID == Qid).ToList();

                model.tbQuestion = questions;
                model.tbAnswer = answers;

                model.i = i;

            }
            else
            {
                tbEvaluation eval = new tbEvaluation();
                eval.devID = did;
                eval.skill = skill;
                eval.date = System.DateTime.Today.ToString("yyyy-MM-dd");
                eval.score = score;
                model.tbEvaluation = eval;

                //int perc = (score / total) ;
                //model.tbEvaluation.devID = did;
                //model.tbEvaluation.skill = skill;
                //model.tbEvaluation.date = System.DateTime.Today.ToString("yyyy-MM-dd");
                //model.tbEvaluation.score = score;
                string hourlyR;
                if (score < 7 && score >= 5)
                {
                    model.tbEvaluation.result = "Beginner";
                    hourlyR = "$10";
                }
                else if (score <= 8 && score >= 7)
                {
                    model.tbEvaluation.result = "Intermediate";
                    hourlyR = "$15";
                }
                else if (score <= 10 && score > 8)
                {
                    model.tbEvaluation.result = "Expert";
                    hourlyR = "$20";
                }
                else
                {
                    model.tbEvaluation.result = "Fail";
                    hourlyR = "Needs Re-evaluation";
                }

                db.tbEvaluations.Add(eval);
                db.SaveChanges();
                int evalid = model.tbEvaluation.evalID;
                string evalRes = model.tbEvaluation.result;

                var query = from proj in db.tbDevelopers where proj.devID == did select proj;

                foreach (tbDeveloper developer in query)
                {
                    developer.tbClient.isProfileComplete = "No";
                    developer.tbClient.actionCont = "locDetails";
                }
                db.SaveChanges();

                var query1 = from proj in db.tbSkills where proj.skillID == skid && proj.devID == did select proj;

                foreach (tbSkill skl in query1)
                {
                    skl.skillLevel = evalRes;
                    skl.hourlyRate = hourlyR;
                }

                db.SaveChanges();

                return RedirectToAction("evalRes", "Developer", new { id = skid });
            }


            return View(model);
        }




        [HttpGet]
        [Authorize]
        public ActionResult locDetails(string id)
        {
            var uName = Session["dev"].ToString();

            var queryU = from a in db.tbUserCredentials where a.username.Contains(uName) select a.userID;
            var cUserID = queryU.FirstOrDefault();

            devViewModel model = new devViewModel();
            model.tbUser = db.tbUsers.Where(i => i.userID == cUserID).FirstOrDefault();

            return View(model);
        }


        [HttpPost]
        [Authorize]
        public ActionResult locDetails(devViewModel model, string usID)
        {

            int uID = Convert.ToInt16(usID);
            var query = from user in db.tbUsers where user.userID == uID select user;

            foreach (tbUser u in query)
            {
                u.country = model.tbUser.country;
                u.state = model.tbUser.state;
                u.city = model.tbUser.city;
                u.postalCode = model.tbUser.postalCode;
                u.contactNumber = model.tbUser.contactNumber;
                u.address = model.tbUser.address;
            }

            db.SaveChanges();

            var action = from dev in db.tbClients where dev.userID == uID select dev;
            string actionUpdated = action.FirstOrDefault().actionCont;
            foreach (tbClient d in action)
            {
                d.actionCont = "profileDev";
                actionUpdated = d.actionCont;
            }
            db.SaveChanges();

            return RedirectToAction(actionUpdated, "Developer");
        }


        [HttpGet]
        [Authorize]
        public ActionResult profileDev()
        {
            var id = Convert.ToInt32(Session["devID"]);

            tbUserCredential user = db.tbUserCredentials.Where(u => u.userID.Equals(id)).FirstOrDefault();
            tbClient client = db.tbClients.Where(u => u.userID.Equals(user.userID)).FirstOrDefault();
            profileViewModel model = new profileViewModel();
            model.tbDeveloper = client.tbDevelopers.FirstOrDefault();
            model.tbSkills = client.tbDevelopers.FirstOrDefault().tbSkills.ToList();
            model.tbUser = client.tbUser;
            return View(model);
        }

        [HttpPost]
        public ActionResult profileDev(string id, string value, string type)
        {
            string opr = "";
            tbUser dev = new tbUser();
            int userID = Convert.ToInt32(id);
            dev = db.tbUsers.Find(userID);
            switch (type)
            {
                case "name":
                    int i = 2;
                    string[] names = value.Split(new char[] { ' ' }, i);
                    dev.firstName = names[0];
                    dev.lastName = names[1];
                    break;
                case "num":
                    value = value.Trim();
                    dev.contactNumber = value;
                    break;
                case "add":
                    dev.address = value;
                    break;
                case "loc":
                    int j = 2;
                    string[] address = value.Split(new char[] { '|' }, j);
                    dev.city = address[0];
                    dev.country = address[1];
                    break;
                case "over":
                    dev.tbClients.First().overview = value;
                    break;
            }
            try
            {
                db.SaveChanges();
                opr = "success";
            }
            catch
            {
                opr = "failed";
            }
            return Json(new { name = value, oper = opr });
        }

        [HttpGet]
        public ActionResult viewProfile(string id)
        {
            int ID = Convert.ToInt16(id);
            profileViewModel model = new profileViewModel();
            tbClient client = db.tbClients.Where(u => u.userID.Equals(ID)).FirstOrDefault();
            model.tbDeveloper = client.tbDevelopers.FirstOrDefault();
            model.tbEducations = client.tbEducations.ToList();
            model.tbSkills = client.tbDevelopers.FirstOrDefault().tbSkills.ToList();
            model.tbUser = client.tbUser;
            return View(model);
        }

        [HttpGet]
        public ActionResult evalRes(string id)
        {
            int skid = Convert.ToInt16(id);

            devViewModel model = new devViewModel();

            model.tbSkill = db.tbSkills.Where(s => s.skillID.Equals(skid)).Single();
            model.tbUser = model.tbSkill.tbDeveloper.tbClient.tbUser;
            List<tbEvaluation> evals = db.tbEvaluations.Where(e => e.devID.Equals(model.tbSkill.devID) && e.skill.Equals(model.tbSkill.name)).ToList();

            model.tbEvaluation = evals[evals.Count - 1];

            return View(model);
        }

        [HttpGet]
        [Authorize]
        public ActionResult Browse(int? page, int? budget, string skill, string q)
        {

            int pageNo = page ?? 1;
            int budgetAmt = budget ?? 0;
            string query = ViewBag.query;

            string skl = ViewBag.skill;
            ViewBag.budget = budgetAmt;
            if (!String.IsNullOrEmpty(skill))
            {
                ViewBag.skill = skill;
                skl = Convert.ToString(ViewBag.skill);
            }
            else { skl = ""; }
            IQueryable<tbModule> modules;
            if (String.IsNullOrEmpty(q))
            {
                modules = db.tbModules.Where(m => m.status.Equals("Open")).ToList().AsQueryable();
                query = "";

            }
            else
            {
                ViewBag.query = q;
                query = Convert.ToString(ViewBag.query);
                modules = db.tbModules.Where(m => m.title.Contains(query) && m.status.Equals("Open")).ToList().AsQueryable();
            }


            IQueryable<tbModule> mods;

            switch (budgetAmt)
            {
                case 1:
                    mods = modules.Where(m => m.budget <= 50).ToList().AsQueryable();
                    break;
                case 2:
                    mods = modules.Where(m => m.budget > 50 && m.budget <= 100).ToList().AsQueryable();
                    break;
                case 3:
                    mods = modules.Where(m => m.budget > 100 && m.budget <= 150).ToList().AsQueryable();
                    break;
                case 4:
                    mods = modules.Where(m => m.budget > 150).ToList().AsQueryable();
                    break;
                default:
                    mods = modules.ToList().AsQueryable();
                    break;
            }

            switch (skl)
            {
                case "C#":
                    mods = mods.Where(m => m.skillReq.Equals("C#")).ToList().AsQueryable();
                    break;
                case "PHP":
                    mods = mods.Where(m => m.skillReq.Equals("PHP")).ToList().AsQueryable();
                    break;
                case "ASP":
                    mods = mods.Where(m => m.skillReq.Equals("ASP")).ToList().AsQueryable();
                    break;
                case "VBA":
                    mods = mods.Where(m => m.skillReq.Equals("VBA")).ToList().AsQueryable();
                    break;
                default:
                    mods = mods.ToList().AsQueryable();
                    break;
            }

            IPagedList<tbModule> onePage = mods.Reverse().ToPagedList(pageNo, 8);

            return View(onePage);
        }







        [HttpGet]
        [Authorize]
        public ActionResult submitProposal(string id, int? page)
        {
            int pageNo = page ?? 1;
            int modId = Convert.ToInt16(id);

            var uName = Session["dev"].ToString();
            var devID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(uName)).FirstOrDefault().tbDevelopers.FirstOrDefault().devID;

            proposalViewModel model = new proposalViewModel();
            tbModule mod = db.tbModules.Find(modId);
            model.tbModule = mod;
            model.tbProposals = mod.tbProposals.ToPagedList(pageNo, 5);
            var prop = mod.tbProposals.Where(p => p.devID == devID).FirstOrDefault();
            if (prop == null)
            {
                return View(model);
            }
            else
            {
                return RedirectToAction("viewProposal", new { id = prop.modID });
            }

        }

        [Authorize]
        public ActionResult viewProposal(string id)
        {

            int modID = Convert.ToInt16(id);

            var uName = Session["dev"].ToString();

            int devID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(uName)).FirstOrDefault().tbDevelopers.FirstOrDefault().devID;
            proposalViewModel model = new proposalViewModel();
            tbProposal proposal = db.tbProposals.Where(p => p.modID == modID && p.devID == devID).FirstOrDefault();
            model.tbProposal = proposal;
            model.tbModule = proposal.tbModule;
            TempData["page"] = "Proposal";
            return View(model);
        }

        [HttpPost]
        [Authorize]
        public ActionResult submitProposal(string id, proposalViewModel model)
        {

            var uName = Session["dev"].ToString();

            // var queryU = db.tbDevelopers.Where(u => u.tbUser.tbUserCredential.username.Equals(uName)).FirstOrDefault().devID;

            model.tbProposal.devID = db.tbClients.Where(u => u.tbUser.tbUserCredential.username.Equals(uName)).FirstOrDefault().tbDevelopers.FirstOrDefault().devID;
            model.tbProposal.modID = Convert.ToInt16(id);
            db.tbProposals.Add(model.tbProposal);
            db.SaveChanges();
            return RedirectToAction("submitProposal", new { id = id });
        }

        [Authorize]
        public FileResult Download(string filename, string of)
        {

            var filePath = Server.MapPath("~/App_Data/" + of + "Files/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }

        [Authorize]
        [HttpGet]
        public ActionResult Checkpoints(string id)
        {
            int wrid = Convert.ToInt32(id);
            
            tbModuleWorkroom wr = db.tbModuleWorkrooms.Find(wrid);
            List<tbModCheckpoint> Checkpoints = wr.tbModCheckpoints.ToList();
           
            TempData["wrid"] = id;
            TempData["page"] = "Submission";
            ViewBag.wrID = id;
            return View(wr);
        }

        [Authorize]
        [HttpPost]
        public ActionResult Checkpoints(string id, string name, string date, string desc, string end)
        {
            try
            {
                tbModCheckpoint chkpoint = new tbModCheckpoint();
                chkpoint.wrID = Convert.ToInt32(id);
                chkpoint.title = name;
                chkpoint.dueDate = date;
                chkpoint.status = "Working";
                chkpoint.description = desc;

                db.tbModCheckpoints.Add(chkpoint);
                db.SaveChanges();
                TempData["page"] = "Submission";
                ViewBag.wrID = id;
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        [Authorize]
        [HttpPost]
        public JsonResult Requests()
        {
            String reqType = Request.Form["type"].ToString();
            if (reqType.Equals("Checkpoint"))
            { // Checkpoint Request
                
                    tbCheckpointReq req;

                    String workRID = Request.Form["wrID"].ToString();
                    String chkID = Request.Form["chkID"].ToString();
                    int chID = Convert.ToInt32(chkID);
                    // Updating old request
                        if (db.tbCheckpointReqs.Where(r => r.chkID.Equals(chID)).Count() > 0){
                        req = db.tbCheckpointReqs.Where(r => r.chkID.Equals(chID)).First();
                        if (Request.Files.Count > 0)
                        {
                            foreach (string file in Request.Files)
                            {
                                var _file = Request.Files[file];
                                if (_file != null)
                                {
                                    bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/CheckPointFiles/" + chkID));
                                    if (!IsExists)
                                    { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/CheckPointFiles/" + chkID)); }
                                    var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/CheckPointFiles/" + chkID), _file.FileName);
                                    _file.SaveAs(fileSavePath);
                                    req.files = _file.FileName;
                                }

                            }
                        }
                        else
                        {
                            req.files = "N/A";
                        }
                        int id = Convert.ToInt32(chkID);
                        req.date = DateTime.Today.ToShortDateString();
                        req.status = "Pending Approval";
                        req.title = db.tbModCheckpoints.Where(ch => ch.chkID == id).FirstOrDefault().title + " Completion";
                        req.chkID = Convert.ToInt32(id);

                        req.tbModCheckpoint.status = "Pending Approval";
                        db.SaveChanges();
                        ViewBag.wrID = workRID;
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }
                    else
                    { // Create new request
                        req = new tbCheckpointReq();
                        if (Request.Files.Count > 0)
                        {
                            foreach (string file in Request.Files)
                            {
                                var _file = Request.Files[file];
                                if (_file != null)
                                {
                                    bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/CheckPointFiles/" + chkID));
                                    if (!IsExists)
                                    { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/CheckPointFiles/" + chkID)); }
                                    var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/CheckPointFiles/" + chkID), _file.FileName);
                                    _file.SaveAs(fileSavePath);
                                    req.files = _file.FileName;
                                }

                            }
                        }
                        else
                        {
                            req.files = "N/A";
                        }
                        int id = Convert.ToInt32(chkID);
                        req.date = DateTime.Today.ToShortDateString();
                        req.status = "Pending Approval";
                        req.title = db.tbModCheckpoints.Where(ch => ch.chkID == id).FirstOrDefault().title + " Completion";
                        req.chkID = Convert.ToInt32(id);
                        db.tbCheckpointReqs.Add(req);
                        db.SaveChanges();
                        req.tbModCheckpoint.status = "Pending Approval";
                        db.SaveChanges();
                        ViewBag.wrID = workRID;
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }


                
               
            }
            else
            { // Module Request
               
                    tbModRequest Modreq;

                    String workRID = Request.Form["wrID"].ToString();
                   
                    int wrID = Convert.ToInt32(workRID);
                    if(db.tbModRequests.Where(r => r.wrID.Equals(wrID)).Count() > 0)
                    { // Updating old request
                        Modreq = db.tbModRequests.Where(r => r.wrID.Equals(wrID)).First();
                        if (Request.Files.Count > 0)
                        {
                            foreach (string file in Request.Files)
                            {
                                var _file = Request.Files[file];
                                if (_file != null)
                                {
                                    bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/WorkroomFiles/" + workRID + "/TestLog"));
                                    if (!IsExists)
                                    { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/WorkroomFiles/" + workRID + "/TestLog")); }
                                    var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/WorkroomFiles/" + workRID + "/TestLog"), _file.FileName);
                                    _file.SaveAs(fileSavePath);
                                    Modreq.filename = _file.FileName;
                                }

                            }
                        }
                        else
                        {
                            Modreq.filename = "N/A";
                        }
                        int id = Convert.ToInt32(workRID);
                        Modreq.date = DateTime.Today.ToShortDateString();
                        Modreq.status = "Pending Approval";
                        Modreq.title = db.tbModuleWorkrooms.Find(id).tbAwardedModule.tbModule.title + " Completion";
                        Modreq.wrID = Convert.ToInt32(id);

                        Modreq.tbModuleWorkroom.tbAwardedModule.tbModule.status = "Pending Approval";
                        db.SaveChanges();
                        ViewBag.wrID = workRID;
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }
                    else
                    { // Create new request
                        Modreq = new tbModRequest();
                        if (Request.Files.Count > 0)
                        {
                            foreach (string file in Request.Files)
                            {
                                var _file = Request.Files[file];
                                if (_file != null)
                                {
                                    bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/App_Data/WorkroomFiles/" + workRID + "/TestLog"));
                                    if (!IsExists)
                                    { System.IO.Directory.CreateDirectory(Server.MapPath("~/App_Data/WorkroomFiles/" + workRID + "/TestLog")); }
                                    var fileSavePath = Path.Combine(Server.MapPath("~/App_Data/WorkroomFiles/" + workRID + "/TestLog"), _file.FileName);
                                    _file.SaveAs(fileSavePath);
                                    Modreq.filename = _file.FileName;
                                }

                            }
                        }
                        else
                        {
                            Modreq.filename = "N/A";
                        }
                        int id = Convert.ToInt32(workRID);
                        Modreq.date = DateTime.Today.ToShortDateString();
                        Modreq.status = "Pending Approval";
                        Modreq.title = db.tbModuleWorkrooms.Find(id).tbAwardedModule.tbModule.title + " Completion";
                        Modreq.wrID = Convert.ToInt32(id);
                        db.tbModRequests.Add(Modreq);
                        
                        db.SaveChanges();
                        var module = db.tbModuleWorkrooms.Find(wrID);
                        module.tbAwardedModule.tbModule.status = "Pending Approval";
                        db.SaveChanges();
                        ViewBag.wrID = workRID;
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }


                
            }
        }

        [Authorize]
        [HttpPost]
        public JsonResult DelCheckpoint(string id)
        {
            try
            {
                
                var chkPoint = db.tbModCheckpoints.Find(Convert.ToInt32(id));
                db.tbModCheckpoints.Remove(chkPoint);
                db.SaveChanges();
                
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        [Authorize]
        [HttpGet]
        public ActionResult MessagesWR(string id)
        {
            try
            {
                int wrID = Convert.ToInt16(id);
                ViewBag.wrID = id;
                tbModuleWorkroom wr = db.tbModuleWorkrooms.Find(wrID);
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
                ViewBag.wrID = id;
                return View();
            }
            
            
        }

        [Authorize]
        [HttpPost]
        public void MessagesWR(string id,string message)
        {
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
                model.mfrom = wr.tbAwardedModule.tbDeveloper.tbClient.tbUser.firstName + " " + wr.tbAwardedModule.tbDeveloper.tbClient.tbUser.lastName;
                model.mto = wr.tbAwardedModule.tbModule.tbProject.tbPM.tbUser.firstName + " " + wr.tbAwardedModule.tbModule.tbProject.tbPM.tbUser.lastName; 
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
        public FileResult DownloadWRMod(string id, string filename)
        {
            var filePath = Server.MapPath("~/App_Data/WorkroomFiles/Module/" + id + "/" + filename);
            byte[] filedata = System.IO.File.ReadAllBytes(filePath);
            string contentType = MimeMapping.GetMimeMapping(filePath);

            return File(filedata, contentType, filename);
        }


        [Authorize]
        [HttpGet]
        public ActionResult filesMod(string id)
        {
            int idI = Convert.ToInt32(id);
            var workroom = db.tbModuleWorkrooms.Find(idI);
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
                ViewBag.wrID = id;
                ViewBag.wr = workroom.wrID;
                wrFiles.modFiles.Reverse();
                return View(wrFiles);
            }
            catch
            {
                TempData["page"] = "filesProj";
                ViewBag.wrID = id;
                ViewBag.wr = workroom.wrID;
                wrFiles.modFiles.Reverse();
                return View(wrFiles);
            }
            
            
        }

        [Authorize]
        [HttpPost]
        public ActionResult filesMod(string wr, string test)
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



                return Json(new { obj = filesAdded }, JsonRequestBehavior.AllowGet);

            }
            catch
            {
                return Json(false);
            }


        }

        [Authorize]
        [HttpPost]
        public ActionResult remFileModWR(string id, string name)
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

        [HttpGet]
        [Authorize]
        public ActionResult viewProposalModuleWR(string id)
        {


            int wrID = Convert.ToInt16(id);

            proposalViewModel model = new proposalViewModel();
            tbProposal Proposal = db.tbModuleWorkrooms.Find(wrID).tbAwardedModule.tbProposal;
            model.tbProposal = Proposal;
            model.tbModule = Proposal.tbModule;
            TempData["page"] = "projects";
            ViewBag.wrID = wrID;
            return View("viewProposal", "DevWorkroomModule", model);
        }

    }
}
