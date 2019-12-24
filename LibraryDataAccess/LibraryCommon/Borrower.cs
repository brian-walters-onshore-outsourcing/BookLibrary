using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
   public class Borrower
    {
        public Borrower()
        {
        }
        public Borrower(string roleName)
        {
            this.RoleName = roleName;
        }
        public int BorrowerID { get; set; }
        public string BorrowerName { get; set; }
        public string BorrowerEMail { get; set; }
        public DateTime? BorrowerDOB { get; set; }
        // Foreign Key to Roles Table
        public int RoleID { get; set; }

        // because of the foreign Key RoleID
        // this field is brought in as well
        public string RoleName { get;}

        // age is computed from the Date of Birth
        public int Age  // measured in years
        {

            get
            {

                if (BorrowerDOB.HasValue)
                {
                    // if the Date of Birth is not null
                    // dependency on DateTime.NOW
                    // dependency injection may be needed
                    TimeSpan age = DateTime.Today - BorrowerDOB.Value;
                    // magic constant 365.2425 is number of days 
                    // in a year over 400 years
                    return (int)((age.TotalDays) / 365.2425);
                }
                else
                {
                    // default age if the DOB is null
                    return 0;
                }
            }

        }
    }

    // this data is sensitive, and should not be exposed to the end user
    public class BorrowerSecured : Borrower
    {
        public BorrowerSecured() { }
        public BorrowerSecured(string roleName)
            : base(roleName) { }
        public string Hash { get; set; }
        public string Salt { get; set; }
    }
}
