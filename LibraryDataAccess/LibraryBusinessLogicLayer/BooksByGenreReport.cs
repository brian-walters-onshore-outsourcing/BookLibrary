using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibraryCommon;

namespace LibraryBusinessLogicLayer
{

    // this is the line items for the count of the number of books in each Genre
    // as well as the actual list of books in each genre
   public class BooksByGenreReportItem
    {
        public string GenreName { get; set; }
        public int Count { get; set; }
        public List<Book> Books { get; set; }
    }

    // this class generates the list of reportitems that can be displayed
    // in MVC in a variety of ways
    // this class follows the usage pattern below:
    //     1. construct the BooksByGenreReport object passing the list of books
    //         to be processed to the constructor
    //     2. Invoke the Compute Method to return the list of report line items
   public class BooksByGenreReport
    {
        public BooksByGenreReport(List<Book> data)
        {
            _data = data;
        }
        private List<Book> _data { get; set; }

        public List<BooksByGenreReportItem> Compute()
        {
            var GenreCountQ = from b in _data
                             group b by b.GenreName into g
                             select new BooksByGenreReportItem()
                             {
                                 GenreName = g.Key,
                                 Books = g.ToList(),
                                 Count = g.Count()
                             };
           return GenreCountQ.ToList();


        }

    }
}
