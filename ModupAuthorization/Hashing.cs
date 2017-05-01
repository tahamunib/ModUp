using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using BCrypt.Net;

namespace ModupAuthorization
{
    public class Hashing
    {
        private static int workFactor = 10;
        
        private static string GetRandomSalt() {
            return BCrypt.Net.BCrypt.GenerateSalt(workFactor);
        }

        public static string HashUsernamePassword(string username,byte[] password)
        {
            return BCrypt.Net.BCrypt.HashPassword(username+password, GetRandomSalt());
        }

        public static bool ValidatePassword(string username,string password, string correctHash)
        {
            return BCrypt.Net.BCrypt.Verify(username+password, correctHash);
        }
    }
}
