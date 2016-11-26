﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using DotNetOpenAuth.AspNet;
using Microsoft.Web.WebPages.OAuth;
using WebMatrix.WebData;
using Modupv1.Filters;
using Modupv1.Models;

namespace Modupv1.Controllers
{
    [Authorize]
    [InitializeSimpleMembership]
    public class AccountController : Controller
    {
        //private Guid GetUserID(string usrname)
        //{
        //    var currentUser = Membership.GetUser(usrname);
        //    var userID = (Guid)currentUser.ProviderUserKey;
        //    return userID;
        //}

        dbModupEntities db = new dbModupEntities();



        //
        // GET: /Account/Login

        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();

        }

        //
        // POST: /Account/Login

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(userViewModel model, string returnUrl)
        {
            if (ModelState.IsValid && WebSecurity.Login(model.LoginModel.UserName, model.LoginModel.Password, persistCookie: model.LoginModel.RememberMe))
            {
                string username = model.LoginModel.UserName;
                var query = from a in db.tbUserCredentials where a.username.Contains(username) select a.userID;
                tbUserCredential userCredential = db.tbUserCredentials.Where(uc => uc.username.Equals(username)).Single();
                var cUserID = userCredential.userID;

                //var queryaccType = from a in db.tbUsers where a.userID.Equals(cUserID) select a.accountType;
                //userCredential.tbUser.accountType;
                string accType = userCredential.tbUser.accountType;

                
                
                if (accType.Equals("PM"))
                {
                    Session["PM"] = model.LoginModel.UserName;
                    Session["pmID"] = cUserID;
                    Session["PMname"] = userCredential.tbUser.firstName + " " + userCredential.tbUser.lastName;
                    return RedirectToAction("Home", "PM");
                }
                else if (accType.Equals("Developer"))
                {
                    Session["dev"] = model.LoginModel.UserName;
                    Session["devID"] = cUserID;
                    Session["devname"] = userCredential.tbUser.firstName + " " + userCredential.tbUser.lastName;
                    var dev = from a in db.tbClients where a.userID.Equals(cUserID) select a;
                    string isComp = dev.FirstOrDefault().isProfileComplete;

                    if (isComp.Equals("Yes"))
                    {
                        return RedirectToAction("Home", "Developer");
                    }
                    else if (isComp.Equals("No"))
                    {
                        string action = dev.FirstOrDefault().actionCont;
                        try
                        {
                            int skillID = dev.FirstOrDefault().tbDevelopers.FirstOrDefault().tbSkills.FirstOrDefault().skillID;
                            return RedirectToAction(action, "Developer", new { id = skillID });
                        }
                        catch
                        {
                            return RedirectToAction(action, "Developer");
                        }
                    }

                }
                else if(accType.Equals("RA"))
                {
                    Session["RA"] = model.LoginModel.UserName;
                    Session["raID"] = cUserID;
                    Session["RAname"] = userCredential.tbUser.firstName + " " + userCredential.tbUser.lastName;
                    return RedirectToAction("Home", "RequirementEngineer");
                }
                else if (accType.Equals("QA"))
                {
                    Session["QA"] = model.LoginModel.UserName;
                    Session["qaID"] = cUserID;
                    Session["QAname"] = userCredential.tbUser.firstName + " " + userCredential.tbUser.lastName;
                    return RedirectToAction("Home", "QualityAssurance");
                }
            }

            // If we got this far, something failed, redisplay form
           
            ModelState.AddModelError("","The username or password is incorrect.");
            return View();
        }

        //
        // POST: /Account/LogOff


        [Authorize]
        public ActionResult LogOff(string id)
        {
            
            WebSecurity.Logout();

            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Account/Register

        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Register(userViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                try
                {

                    WebSecurity.CreateUserAndAccount(model.RegisterModel.UserName, model.RegisterModel.Password);
                    WebSecurity.Login(model.RegisterModel.UserName, model.RegisterModel.Password);


                    //UsersContext Udb = new UsersContext();

                    //model.UserProfile.UserName = model.RegisterModel.UserName;
                    //Udb.UserProfiles.Add(model.UserProfile);
                    //Udb.SaveChanges();



                    model.tbUser.accountType = model.RegisterModel.AccountType;
                    db.tbUsers.Add(model.tbUser);

                    db.SaveChanges();
                    //var query = from a in db.tbUsers where a.firstName.Contains(model.tbUser.firstName) select a.userID;
                    var cUserID = model.tbUser.userID;
                    Session["usID"] = cUserID;

                    string action = "";
                    string controller = "";

                    if (model.RegisterModel.AccountType.Equals("PM"))
                    {
                        tbPM PM = new tbPM();

                        PM.userID = cUserID;
                        PM.totalSpending = "0";
                        PM.awardedProj = "0";

                        db.tbPMs.Add(PM);
                        db.SaveChanges();

                        action = "Home";
                        controller = "PM";
                        Session["PM"] = model.RegisterModel.UserName;
                        Session["pmID"] = cUserID;
                        Session["PMname"] = model.tbUser.firstName + " " + model.tbUser.lastName;
                    }
                    else
                    {
                        tbClient client = new tbClient();

                        client.userID = cUserID;
                        client.totalEarning = "0";
                        client.awardedProjects = "0";
                        client.tagLine = "";
                        client.overview = "";
                        client.isProfileComplete = "No";
                        client.actionCont = "skillEnquiry";
                        client.completedTasks = 0;
                        db.tbClients.Add(client);
                        db.SaveChanges();
                        
                        if (model.RegisterModel.AccountType.Equals("Developer"))
                        {
                            tbDeveloper dev = new tbDeveloper();
                            int id = db.tbClients.Where(c => c.userID.Equals(cUserID)).FirstOrDefault().clientID;
                            dev.clientID = id;
                            dev.affiliation = "";
                            db.tbDevelopers.Add(dev);
                            action = "skillEnquiry";
                            controller = "Developer";
                            Session["dev"] = model.RegisterModel.UserName;
                            Session["devID"] = cUserID;
                            Session["devname"] = model.tbUser.firstName + " " + model.tbUser.lastName;
                        }
                        else if (model.RegisterModel.AccountType.Equals("QA"))
                        {
                            tbQualityAssurance QA = new tbQualityAssurance();
                            int id = Convert.ToInt16(from a in db.tbClients where a.clientID.Equals(cUserID) select a.clientID);
                            QA.clientID = id;
                            db.tbQualityAssurances.Add(QA);
                            action = "Home";
                            controller = "QualityAssurance";
                        }
                        else if (model.RegisterModel.AccountType.Equals("RA"))
                        {
                            tbRequirementEngineer QA = new tbRequirementEngineer();
                            int id = db.tbClients.Where(c => c.userID.Equals(cUserID)).FirstOrDefault().clientID;
                            QA.clientID = id;
                            db.tbRequirementEngineers.Add(QA);
                            action = "Home";
                            controller = "RequirementEngineer";
                            Session["RA"] = model.RegisterModel.UserName;
                            Session["raID"] = cUserID;
                            Session["RAname"] = model.tbUser.firstName + " " + model.tbUser.lastName;
                        }
                    }
                    tbUserCredential uc = new tbUserCredential();

                    uc.userID = cUserID;
                    uc.username = model.RegisterModel.UserName;
                    uc.password = model.RegisterModel.Password;
                    uc.email = model.RegisterModel.Email;
                    uc.secretQ = "None";
                    uc.secretA = "None";

                    db.tbUserCredentials.Add(uc);
                    db.SaveChanges();

                    return RedirectToAction(action, controller);
                }
                catch (MembershipCreateUserException e)
                {
                    ModelState.AddModelError("", ErrorCodeToString(e.StatusCode));
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // POST: /Account/Disassociate

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Disassociate(string provider, string providerUserId)
        {
            string ownerAccount = OAuthWebSecurity.GetUserName(provider, providerUserId);
            ManageMessageId? message = null;

            // Only disassociate the account if the currently logged in user is the owner
            if (ownerAccount == User.Identity.Name)
            {
                // Use a transaction to prevent the user from deleting their last login credential
                using (var scope = new TransactionScope(TransactionScopeOption.Required, new TransactionOptions { IsolationLevel = IsolationLevel.Serializable }))
                {
                    bool hasLocalAccount = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
                    if (hasLocalAccount || OAuthWebSecurity.GetAccountsFromUserName(User.Identity.Name).Count > 1)
                    {
                        OAuthWebSecurity.DeleteAccount(provider, providerUserId);
                        scope.Complete();
                        message = ManageMessageId.RemoveLoginSuccess;
                    }
                }
            }

            return RedirectToAction("Manage", new { Message = message });
        }

        //
        // GET: /Account/Manage

        public ActionResult Manage(ManageMessageId? message)
        {
            ViewBag.StatusMessage =
                message == ManageMessageId.ChangePasswordSuccess ? "Your password has been changed."
                : message == ManageMessageId.SetPasswordSuccess ? "Your password has been set."
                : message == ManageMessageId.RemoveLoginSuccess ? "The external login was removed."
                : "";
            ViewBag.HasLocalPassword = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
            ViewBag.ReturnUrl = Url.Action("Manage");
            return View();
        }

        //
        // POST: /Account/Manage

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Manage(LocalPasswordModel model)
        {
            bool hasLocalAccount = OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
            ViewBag.HasLocalPassword = hasLocalAccount;
            ViewBag.ReturnUrl = Url.Action("Manage");
            if (hasLocalAccount)
            {
                if (ModelState.IsValid)
                {
                    // ChangePassword will throw an exception rather than return false in certain failure scenarios.
                    bool changePasswordSucceeded;
                    try
                    {
                        changePasswordSucceeded = WebSecurity.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword);
                    }
                    catch (Exception)
                    {
                        changePasswordSucceeded = false;
                    }

                    if (changePasswordSucceeded)
                    {
                        return RedirectToAction("Manage", new { Message = ManageMessageId.ChangePasswordSuccess });
                    }
                    else
                    {
                        ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
                    }
                }
            }
            else
            {
                // User does not have a local password so remove any validation errors caused by a missing
                // OldPassword field
                ModelState state = ModelState["OldPassword"];
                if (state != null)
                {
                    state.Errors.Clear();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        WebSecurity.CreateAccount(User.Identity.Name, model.NewPassword);
                        return RedirectToAction("Manage", new { Message = ManageMessageId.SetPasswordSuccess });
                    }
                    catch (Exception)
                    {
                        ModelState.AddModelError("", String.Format("Unable to create local account. An account with the name \"{0}\" may already exist.", User.Identity.Name));
                    }
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // POST: /Account/ExternalLogin

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            return new ExternalLoginResult(provider, Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/ExternalLoginCallback

        [AllowAnonymous]
        public ActionResult ExternalLoginCallback(string returnUrl)
        {
            AuthenticationResult result = OAuthWebSecurity.VerifyAuthentication(Url.Action("ExternalLoginCallback", new { ReturnUrl = returnUrl }));
            if (!result.IsSuccessful)
            {
                return RedirectToAction("ExternalLoginFailure");
            }

            if (OAuthWebSecurity.Login(result.Provider, result.ProviderUserId, createPersistentCookie: false))
            {
                return RedirectToLocal(returnUrl);
            }

            if (User.Identity.IsAuthenticated)
            {
                // If the current user is logged in add the new account
                OAuthWebSecurity.CreateOrUpdateAccount(result.Provider, result.ProviderUserId, User.Identity.Name);
                return RedirectToLocal(returnUrl);
            }
            else
            {
                // User is new, ask for their desired membership name
                string loginData = OAuthWebSecurity.SerializeProviderUserId(result.Provider, result.ProviderUserId);
                ViewBag.ProviderDisplayName = OAuthWebSecurity.GetOAuthClientData(result.Provider).DisplayName;
                ViewBag.ReturnUrl = returnUrl;
                return View("ExternalLoginConfirmation", new RegisterExternalLoginModel { UserName = result.UserName, ExternalLoginData = loginData });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLoginConfirmation(RegisterExternalLoginModel model, string returnUrl)
        {
            string provider = null;
            string providerUserId = null;

            if (User.Identity.IsAuthenticated || !OAuthWebSecurity.TryDeserializeProviderUserId(model.ExternalLoginData, out provider, out providerUserId))
            {
                return RedirectToAction("Manage");
            }

            if (ModelState.IsValid)
            {
                // Insert a new user into the database
                using (UsersContext db = new UsersContext())
                {
                    UserProfile user = db.UserProfiles.FirstOrDefault(u => u.UserName.ToLower() == model.UserName.ToLower());
                    // Check if user already exists
                    if (user == null)
                    {
                        // Insert name into the profile table
                        db.UserProfiles.Add(new UserProfile { UserName = model.UserName });
                        db.SaveChanges();

                        OAuthWebSecurity.CreateOrUpdateAccount(provider, providerUserId, model.UserName);
                        OAuthWebSecurity.Login(provider, providerUserId, createPersistentCookie: false);

                        return RedirectToLocal(returnUrl);
                    }
                    else
                    {
                        ModelState.AddModelError("UserName", "User name already exists. Please enter a different user name.");
                    }
                }
            }

            ViewBag.ProviderDisplayName = OAuthWebSecurity.GetOAuthClientData(provider).DisplayName;
            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // GET: /Account/ExternalLoginFailure

        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        [AllowAnonymous]
        [ChildActionOnly]
        public ActionResult ExternalLoginsList(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return PartialView("_ExternalLoginsListPartial", OAuthWebSecurity.RegisteredClientData);
        }

        [ChildActionOnly]
        public ActionResult RemoveExternalLogins()
        {
            ICollection<OAuthAccount> accounts = OAuthWebSecurity.GetAccountsFromUserName(User.Identity.Name);
            List<ExternalLogin> externalLogins = new List<ExternalLogin>();
            foreach (OAuthAccount account in accounts)
            {
                AuthenticationClientData clientData = OAuthWebSecurity.GetOAuthClientData(account.Provider);

                externalLogins.Add(new ExternalLogin
                {
                    Provider = account.Provider,
                    ProviderDisplayName = clientData.DisplayName,
                    ProviderUserId = account.ProviderUserId,
                });
            }

            ViewBag.ShowRemoveButton = externalLogins.Count > 1 || OAuthWebSecurity.HasLocalAccount(WebSecurity.GetUserId(User.Identity.Name));
            return PartialView("_RemoveExternalLoginsPartial", externalLogins);
        }

        #region Helpers
        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public enum ManageMessageId
        {
            ChangePasswordSuccess,
            SetPasswordSuccess,
            RemoveLoginSuccess,
        }

        internal class ExternalLoginResult : ActionResult
        {
            public ExternalLoginResult(string provider, string returnUrl)
            {
                Provider = provider;
                ReturnUrl = returnUrl;
            }

            public string Provider { get; private set; }
            public string ReturnUrl { get; private set; }

            public override void ExecuteResult(ControllerContext context)
            {
                OAuthWebSecurity.RequestAuthentication(Provider, ReturnUrl);
            }
        }

        private static string ErrorCodeToString(MembershipCreateStatus createStatus)
        {
            // See http://go.microsoft.com/fwlink/?LinkID=177550 for
            // a full list of status codes.
            switch (createStatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "User name already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A user name for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }
        #endregion
    }
}