using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
    public class Role
    {
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public string CreateOperation { get; set; }
        public string UpdateOperation { get; set; }
        public string DeleteOperation { get; set; }
        public string ListOperation { get; set; }
        public string ViewOperation {get; set;}
    }
}
