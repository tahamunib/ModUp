using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;


namespace Modupv1.Models
{
    public class proposalViewModel
    {
        public IPagedList<tbProposal> tbProposals { get; set; }
        public tbModule tbModule { get; set; }
        public tbProposal tbProposal { get; set; }
        public IPagedList<tbDeveloper> tbDevelopers { get; set; }
        public IPagedList<tbProjProposal> tbProjProposals { get; set; }
        public tbProjProposal tbProjProposal { get; set; }
        public tbProject tbProject { get; set; }
    }
}