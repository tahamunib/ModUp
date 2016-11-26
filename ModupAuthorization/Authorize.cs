using ModupBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ModupAuthorization
{
    public class Authorize
    {

        Users user = new Users();

        public bool Login(string username,string password,bool rememberMe)
        {
            try
            {
                Hashing.ValidatePassword(username, password, user.GetUser(username).tbUserCredential.password);
                return true;
            }
            catch
            {
                return false;
            }
        }

        
    }
}
