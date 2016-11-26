using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class devViewModel
    {
        public tbUser tbUser { get; set; }
        public tbDeveloper tbDeveloper { get; set; }
        public tbSkill tbSkill { get; set; }
        public List<tbSkill> tbSkills { get; set; }
        public tbPortfolio tbPortfolio { get; set; }
        public tbExperience tbExperience { get; set; }
        public List<tbAwardedModule> tbAwardedModules { get; set; }
        public tbEducation tbEducation { get; set; }
        public tbEvaluation tbEvaluation { get; set; }
        public List<tbProposal> Proposals { get; set; }
    }
}