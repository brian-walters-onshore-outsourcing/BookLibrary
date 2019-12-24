using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
    public class TypeDRatedBorrowing
    {
        public int BorrowingID { get; set; }
        public int BookID { get; set; }
        public int BorrowerID { get; set; }

        public DateTime? DueDate { get; set; }
        public DateTime? ReturnedDate { get; set; }
        public decimal? Rating { get; set; }

        // book related items

        public string ISBN { get; set; }
        public string BookName { get; set; }

        public int Pages { get; set; }
        public decimal Price { get; set; }
        public int GenreID { get; set; }

        public string GenreName { get; set; }

        // borrower related items

        public string BorrowerName { get; set; }
        public string BorrowerEMail { get; set; }
        public DateTime ? BorrowerDOB { get; set; }
        public int RoleID { get; set; }

        public string RoleName { get; set; }

        // the following are computed fields

        public bool isCheckedOut
        {
            get
            {
               return DueDate.HasValue && !(ReturnedDate.HasValue);
            }
        }

        // if this is negative, then the book is overdue
        public int DaysLeft
        {
            get
            {
                if (!isCheckedOut) { return 0; }
                DateTime today = DateTime.Now;
                return ( DueDate.Value - today).Days;
            }
        }

        // this logic has been deprecated... here just in case needed again
        // the logic below insures that theBook and theAuthor
        // can only be set one time.  all other attempts to
        // set will throw an exception
        //Book _thebook;
        //public Book theBook
        //{
        //    get { return _thebook; }
        //    set
        //    {
        //        if (_thebook == null)
        //        {
        //            _thebook = value;
        //        }
        //        else
        //        {
        //            throw new Exception($"the book portion of the TypeDBorrowing object can only be set one time.  It was attempting to be set with the book '{value}' but it already contained the book '{_thebook}'");
        //        }
        //    }

        //}
        //Borrower _theBorrower;
        //public Borrower theBorrower
        //{
        //    get { return _theBorrower; }
        //    set
        //    {
        //        if (_theBorrower == null)
        //        {
        //            _theBorrower = value;
        //        }
        //        else
        //        {
        //            throw new Exception($"the borrower portion of the TypeDBorrowing object can only be set one time.  It was attempting to be set with the author '{value}' but it already contained the author '{_theBorrower}'");
        //        }
        //    }
        //}

        //public override string ToString()
        //{
        //   // string borrower = theBorrower?.ToString() ?? "NULL";
        //   // string book = theBook?.ToString() ?? "NULL";
        //    string duedate = DueDate.HasValue ? DueDate.Value.ToString("mmm dd yyyy") : "NULL";
        //    string returneddate = ReturnedDate.HasValue ? ReturnedDate.Value.ToString("mmm dd yyyy") : "NULL";

        //    return $"Rated Borrowing: ID={BorrowingID,5} borrowerid:{BorrowerID,5} bookid:{BookID,5} Due: {DueDate} Returned: {ReturnedDate}\nborrower: {borrower}\nbook: {book}";
        //}


    }
}
