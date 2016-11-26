using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Modupv1.Models
{
    public class userViewModel
    {
        public RegisterModel RegisterModel { get; set; }
        public LoginModel LoginModel { get; set; }
        public UserProfile UserProfile { get; set; }
        public tbUserCredential tbUserCredential { get; set; }
        public tbUser tbUser { get; set; }
    }
}