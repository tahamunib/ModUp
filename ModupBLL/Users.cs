using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ModupDAL;
using ModupBLL.ModupModels;
using ModupAuthorization;
using ModupCommon;

namespace ModupBLL
{
    public class Users
    {
        private static ModupEntities db = new ModupEntities();

        public tbUser GetUser(string username)
        {
            if (isUserExist(username))
                return db.tbUsers.Where(x => x.username.Equals(username)).Single();
            else
                return null;
        }

        public bool isUserExist(string username)
        {
            if (db.tbUsers.Where(x => x.username.Equals(username)).Count() > 0)
                return true;
            else
                return false;
        }

        public static bool AddUser(RegisterModel user)
        {
            
            try
            {
                //user.User.password = Helper.GetBytes(ModupAuthorization.Hashing.HashUsernamePassword(user.User.username, user.User.password));
                db.tbUsers.Add(user.User);
                //db.tbUserCredentials.Add(user.UserCredentials);
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
