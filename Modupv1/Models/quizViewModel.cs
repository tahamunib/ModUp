using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class quizViewModel
    {
        public tbDeveloper tbDeveloper { get; set; }
        public tbSkill tbSkill { get; set; }
        public List<tbQuestion> tbQuestion { get; set; }
        public List<tbAnswer> tbAnswer { get; set; }
        public tbEvaluation tbEvaluation { get; set; }
        public int i { get; set; }
        public string selectedAns { get; set; }
        public int score { get; set; }
    }
}