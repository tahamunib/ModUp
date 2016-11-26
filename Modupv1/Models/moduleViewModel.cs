using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace Modupv1.Models
{
    public class moduleViewModel
    {

        public List<tbModule> tbModules { get; set; }
        public List<tbModule> tbModule { get; set; }
        public tbModule tbMod { get; set; }
        
        public IPagedList<tbProposal> tbProposals { get; set; }
    }
}