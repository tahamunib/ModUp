//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Modupv1
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbQuestion
    {
        public tbQuestion()
        {
            this.tbAnswers = new HashSet<tbAnswer>();
            this.tbEvaluations = new HashSet<tbEvaluation>();
        }
    
        public int qID { get; set; }
        public string question { get; set; }
        public string skill { get; set; }
    
        public virtual ICollection<tbAnswer> tbAnswers { get; set; }
        public virtual ICollection<tbEvaluation> tbEvaluations { get; set; }
    }
}
