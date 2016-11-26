using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class RAModel
    {
        public tbRequirementEngineer tbReqEngineer { get; set; }
        public List<tbProject> projects { get; set; }
        public List<tbProjProposal> proposals { get; set; }
        public List<tbAwardedProj> awardedProjects { get; set; }
        public List<tbProjWorkroom> workrooms { get; set; }
    }
}