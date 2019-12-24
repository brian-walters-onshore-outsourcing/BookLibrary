using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
    public class Author
    {


        
        public int AuthorID { get; set; }
        public string AuthorName { get; set; }

        // AuthorDOB is nullable in the database, so use c# nullable
        public DateTime? AuthorDOB { get; set; }
        public string AuthorLocation { get; set; }

        // age is computed from the Date of Birth
        public int Age  // measured in years
        {

            get
            {
                
                if (AuthorDOB.HasValue)
                {
                    // if the Date of Birth is not null
                    // dependency on DateTime.NOW
                    // dependency injection may be needed
                    TimeSpan age = DateTime.Today - AuthorDOB.Value;
                    // magic constant 365.2425 is number of days 
                    // in a year over 400 years
                    return (int) ((age.TotalDays) / 365.2425);
                }
                else
                {
                    // default age if the DOB is null
                    return 0;
                }
            }

        }
        
        // this method is for .NET string support
        // and is used in the console application for testing
        public override string ToString()
        {
            string DOB = (AuthorDOB.HasValue) ? AuthorDOB.Value.ToString("MMM dd yyyy") : "NULL";
            return $"Author: {AuthorID,5} {DOB,15} {Age,3} {AuthorLocation}";
        }
    }
}
