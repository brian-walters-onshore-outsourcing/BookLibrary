using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibraryCommon;

namespace LibraryBusinessLogicLayer
{

    // this is the line item for the count of the number of books in each category
    // of the number of days overdue
    public class OverdueReportItem
        {
            public int NotOverDue { get; set; }
            public int OverdueBy10orLess { get; set; }
            public int OverdueMoreThan10and30orless { get; set; }
            public int OverdueMoreThan30 { get; set; }
        }

    // this class generates the list of reportitems that can be displayed
    // in MVC in a variety of ways
    // this class follows the usage pattern below:
    //     1. construct the OverDueReport object passing the list of books
    //         to be processed to the constructor
    //     2. Invoke the Compute Method to return the  report line items
    public class OverDueReport
    {
       
        public OverDueReport(List<Book> data)
        {
            _data = data;
        }
        private List<Book> _data { get; set; }

        public OverdueReportItem Compute()
        {

            // demonstration of some simple LINQ to query the list for various forms of
            // overdue
            OverdueReportItem rv = new OverdueReportItem();
            var NotOverdue = from b in _data where b.DaysOverdue <= 0 select b;
            var OverdueBy10 = from b in _data where 
               (b.DaysOverdue <= 10) && (b.DaysOverdue>0)
                              select b;
            var OverDueby30 = from b in _data
                              where
               (b.DaysOverdue <= 30) && (b.DaysOverdue > 10)
                              select b;
            var GrosslyOverdue = from b in _data
                                 where
                 (b.DaysOverdue > 30)
                                 select b;

            rv.NotOverDue = NotOverdue.ToList().Count;
            rv.OverdueBy10orLess = OverdueBy10.ToList().Count;
            rv.OverdueMoreThan10and30orless = OverDueby30.ToList().Count;
            rv.OverdueMoreThan30 = GrosslyOverdue.ToList().Count();

            return rv;
        }
    }
}
