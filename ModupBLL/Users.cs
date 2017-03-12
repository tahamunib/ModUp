using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModupDAL;
using ModupBLL.ModupModels;
using ModupAuthorization;

namespace ModupBLL
{
    public class Users
    {
        private static ModupEntities db = new ModupEntities();

        public tbUser GetUser(string username)
        {
            if (isUserExist(username))
                return db.tbUsers.Where(x => x.tbUserCredential.username.Equals(username)).Single();
            else
                return null;
        }

        public bool isUserExist(string username)
        {
            if (db.tbUsers.Where(x => x.tbUserCredential.username.Equals(username)).Count() > 0)
                return true;
            else
                return false;
        }

        public static bool AddUser(RegisterModel user)
        {
            
            try
            {
                user.UserCredentials.password = ModupAuthorization.Hashing.HashUsernamePassword(user.UserCredentials.username, user.UserCredentials.password);
                db.tbUsers.Add(user.User);
                db.tbUserCredentials.Add(user.UserCredentials);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
    }
}
