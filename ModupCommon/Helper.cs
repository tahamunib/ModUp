using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModupCommon
{
    public class Helper
    {
        public static byte[] GetBytes(string String)
        {
            byte[] byteArray = Encoding.ASCII.GetBytes(String);
            return byteArray;
        }

        public enum UserType
        {
            Developer = 1,
            QA = 2,
            DevelopmentManager = 3,
            RequirementAnalyzer = 4
        }
    }
}
