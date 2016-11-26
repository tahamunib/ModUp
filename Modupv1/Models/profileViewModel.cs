using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class profileViewModel
    {
        public tbUser tbUser { get; set; }
        public tbDeveloper tbDeveloper { get; set; }
        public tbQualityAssurance QA { get; set; }
        public tbRequirementEngineer RA { get; set; }
        public tbSkill tbSkill { get; set; }
        public tbClient tbClient { get; set; }
        public List<tbSkill> tbSkills { get; set; }
        public List<tbPortfolio> tbPortfolios { get; set; }
        public List<tbExperience> tbExperiences { get; set; }
        public List<tbEducation> tbEducations { get; set; }
        public tbEvaluation tbEvaluation { get; set; }
    }
}