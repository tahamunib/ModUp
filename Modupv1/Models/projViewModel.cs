using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class projViewModel
    {
        public List<tbProject> tbProjects { get; set; }
        public tbProject tbProject { get; set; }
        public List<tbModule> tbModules { get; set; }
        public tbModule tbModule { get; set; }
        public tbPM tbPM { get; set; }
        public tbUser tbUser { get; set; }
        public HttpPostedFileBase file { get; set; }
        public List<HttpPostedFileBase> files { get; set; }

    }
}