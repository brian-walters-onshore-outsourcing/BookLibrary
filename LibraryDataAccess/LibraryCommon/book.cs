using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
    public class Book
    {
        
        public int BookID { get; set; }
        public string ISBN { get; set; }
        public string BookName { get; set; }
        public int Pages { get; set; }

        public decimal Price { get; set; }
        // Foreign Key to the Genres Table
        public int GenreID { get; set; }

        // because of the foreign Key GenreID
        // this field is brought in as well
        public string GenreName { get; set; }

        // this method is for .NET string support
        // and is used in the console application for testing

        // the following fields are extra computed data from the sql layer

        public int CheckOuts { get; set; }
        public int DaysOverdue { get; set; }
        public decimal AvgRating { get; set; }

        public override string ToString()
        {
            return $"{BookID,5} {ISBN,15} {BookName,25} {Pages,5} {Price,7} {GenreID,5} {GenreName}";
        }
    }
}
