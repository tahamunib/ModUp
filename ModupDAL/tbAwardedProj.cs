//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ModupDAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbAwardedProj
    {
        public tbAwardedProj()
        {
            this.tbProjWorkrooms = new HashSet<tbProjWorkroom>();
        }
    
        public int projID { get; set; }
        public int raID { get; set; }
        public int prjpropID { get; set; }
    
        public virtual tbProject tbProject { get; set; }
        public virtual tbProjProposal tbProjProposal { get; set; }
        public virtual tbRequirementEngineer tbRequirementEngineer { get; set; }
        public virtual ICollection<tbProjWorkroom> tbProjWorkrooms { get; set; }
    }
}