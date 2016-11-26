using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;

namespace Modupv1.Controllers
{
    public class QualityAssuranceController : Controller
    {
        //
        // GET: /QualityAssurance/
        dbModupEntities db = new dbModupEntities();

        public ActionResult Home()
        {
            tbUserCredential model = db.tbUserCredentials.Where(u => u.username.Equals(WebSecurity.CurrentUserName)).FirstOrDefault();
            return View(model.tbUser);
        }

    }
}
