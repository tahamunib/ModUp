using ModupDAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModupBLL.ModupModels
{
    public class RegisterModel
    {
        public tbUser User { get; set; }
        public tbUserCredential UserCredentials { get; set; }

        public RegisterModel()
        {
            User = new tbUser();
            UserCredentials = new tbUserCredential();
        }
        
    }
}
