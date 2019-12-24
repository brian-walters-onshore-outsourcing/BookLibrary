using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
    public class TypeCBorrowing
    {
        public int BorrowingID { get; set; }
        public int BookID { get; set; }
        public int BorrowerID { get; set; }


        // the logic below insures that theBook and theAuthor
        // can only be set one time.  all other attempts to
        // set will throw an exception
        Book _thebook;
        public Book theBook
        {
            get { return _thebook; }
            set
            {
                if (_thebook == null)
                {
                    _thebook = value;
                }
                else
                {
                    throw new Exception($"the book portion of the TypeCBorrowing object can only be set one time.  It was attempting to be set with the book '{value}' but it already contained the book '{_thebook}'");
                }
            }

        }
        Borrower _theBorrower;
        public Borrower theBorrower
        {
            get { return _theBorrower; }
            set
            {
                if (_theBorrower == null)
                {
                    _theBorrower = value;
                }
                else
                {
                    throw new Exception($"the borrower portion of the TypeCBorrowing object can only be set one time.  It was attempting to be set with the author '{value}' but it already contained the author '{_theBorrower}'");
                }
            }
        }

        public override string ToString()
        {
            string borrower = theBorrower?.ToString() ?? "NULL";
            string book = theBook?.ToString() ?? "NULL";
            return $"Borrowing: ID={BorrowingID,5} borrowerid:{BorrowerID,5} bookid:{BookID,5}\nborrower: {borrower}\nbook: {book}";
        }


    }
}
