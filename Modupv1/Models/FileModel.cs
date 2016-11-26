using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class FileModel
    {

        public List<tbModWorkroomFile> modFiles { get; set; }
        public List<tbProjWorkroomFile> projFiles { get; set; }
    }
}