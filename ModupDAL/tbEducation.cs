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
    
    public partial class tbEducation
    {
        public int eduID { get; set; }
        public int clientID { get; set; }
        public string degree { get; set; }
        public string institute { get; set; }
        public string year { get; set; }
    
        public virtual tbClient tbClient { get; set; }
    }
}
