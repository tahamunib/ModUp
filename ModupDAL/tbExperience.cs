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
    
    public partial class tbExperience
    {
        public int expID { get; set; }
        public int clientID { get; set; }
        public string workedAs { get; set; }
        public string company { get; set; }
        public string duration { get; set; }
        public string startingYear { get; set; }
    
        public virtual tbClient tbClient { get; set; }
    }
}
