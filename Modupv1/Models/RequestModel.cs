using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class RequestModel
    {
        public List<tbCheckpointReq> ChPRequests { get; set; }
        public List<tbModRequest> ModRequests { get; set; }
    }
}