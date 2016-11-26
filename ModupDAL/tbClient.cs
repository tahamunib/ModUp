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
    
    public partial class tbClient
    {
        public tbClient()
        {
            this.tbDevelopers = new HashSet<tbDeveloper>();
            this.tbEducations = new HashSet<tbEducation>();
            this.tbExperiences = new HashSet<tbExperience>();
            this.tbQualityAssurances = new HashSet<tbQualityAssurance>();
            this.tbRequirementEngineers = new HashSet<tbRequirementEngineer>();
        }
    
        public int userID { get; set; }
        public int clientID { get; set; }
        public string awardedProjects { get; set; }
        public string totalEarning { get; set; }
        public string tagLine { get; set; }
        public string overview { get; set; }
        public string isProfileComplete { get; set; }
        public string actionCont { get; set; }
        public Nullable<int> completedTasks { get; set; }
    
        public virtual tbUser tbUser { get; set; }
        public virtual ICollection<tbDeveloper> tbDevelopers { get; set; }
        public virtual ICollection<tbEducation> tbEducations { get; set; }
        public virtual ICollection<tbExperience> tbExperiences { get; set; }
        public virtual ICollection<tbQualityAssurance> tbQualityAssurances { get; set; }
        public virtual ICollection<tbRequirementEngineer> tbRequirementEngineers { get; set; }
    }
}
