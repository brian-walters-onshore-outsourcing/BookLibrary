using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LibraryCommon;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace LibraryWebSite.Models
{


    public class VMBorrowing 
    {
        // this class wraps a (Type-D)  many to many junction table
        //     connecting books and borrowers
        //        a book can be borrowed by many users
        //        a user can borrow many books
        //     Type-d :  duplication
        //        a single book can be borrowed multiple times by the same user
        //     Type-d :  extra data
        //        The Due Date, Returned Date, and Rating is different for
        //        each borrowing.  This extra data is not stored with the user
        //        or the book, it is stored in the junction record.

        //  in addition, this is the ViewModel class, so here is the info about that

        // This class is a simple shim around an embedded common library class
        // This class may have PopulateXXXItems and XXXItems classes which are
        // helper functions to make it easy to work with drop down list box controls
        // containing friendly descriptions for Foreign Key IDs
        // This class does contain the following additional helper functions:
        // MakeNew -- acts as a special constructor for the viewModel layer.  The 
        //    Lower Layers may return NULL if the do not find an expected record
        //    the MakeNew method will pass this null on instead of createing an instance
        //    of the ViewModel Object.  A typical constructor would create a real VM 
        //    object that was wrapping null, it would not return null as the MakeNew
        //    method does.
        // ToList -- helps translate a List<XXX> to a List<VMXXX>.  Most of the 
        //    lowerlevel methods return a List<XXX> instead of a List<ViewModelXXX>
        // implicit operator XXX(VMXXX) -- this helps convert VMXXX to XXX whenever and
        //    whereever needed.  The conversion is simple, return the embedded object!
        // Two Constructors -- to allow the embedded items to be inserted as needed
        //
        //
        // This ViewModel class is intended to be used at the MVC layer without requiring
        // a reimplementation of the base XXX.  This class allows the properties to be
        // decorated with data annotations to be recognized at the MVC layer, and also 
        // allows additional MVC functionality to be inserted if required.  Inheritance 
        // from the common library class does not support an easy way to do data 
        // annotation, and this embedding mechanism avoids copying/remapping 
        // the data between layers
        // 
        // it is possible that a Generic Base Class can be devised to simplify this
        // model
        // -- followup:  After expirimenting with the generic behavior, I was able
        // to make a generic implementation, but I do not feel that it is
        // understandable or explainable to entry level programmers.
        //   The code is in the class VMBase if you want to see it.



        public static VMBorrowing MakeNew(TypeDRatedBorrowing theList)
        {
            if (theList == null)
            {
                return null;
            }
            var rv =  new VMBorrowing(theList);
          
            return rv;
        }
        public static List<VMBorrowing> ToList(List<TypeDRatedBorrowing> theList)
        {
            List<VMBorrowing> rv = new List<VMBorrowing>();
            foreach (var b in theList)
            {
                VMBorrowing vm = new VMBorrowing(b);
                rv.Add(vm);
            }
            return rv;
        }

        public static implicit operator TypeDRatedBorrowing(VMBorrowing vm)
        {
            return vm.TheEmbeddedItem;
        }
        TypeDRatedBorrowing TheEmbeddedItem { get; set; }
        public VMBorrowing() { TheEmbeddedItem = new TypeDRatedBorrowing(); }
        public VMBorrowing(TypeDRatedBorrowing b)
        {

            TheEmbeddedItem = b;
        }

        public VMBorrowing (Book theBook, Borrower theBorrower)
        {
            TheEmbeddedItem = new TypeDRatedBorrowing();
            TheEmbeddedItem.BookID = theBook.BookID;
            TheEmbeddedItem.BookName = theBook.BookName;
            TheEmbeddedItem.BorrowerDOB = theBorrower.BorrowerDOB;
            TheEmbeddedItem.BorrowerEMail = theBorrower.BorrowerEMail;
            TheEmbeddedItem.BorrowerID = theBorrower.BorrowerID;
            TheEmbeddedItem.BorrowerName = theBorrower.BorrowerName;
            TheEmbeddedItem.GenreID = theBook.GenreID;
            TheEmbeddedItem.GenreName = theBook.GenreName;
            TheEmbeddedItem.ISBN = theBook.ISBN;
            TheEmbeddedItem.Pages = theBook.Pages;
            TheEmbeddedItem.Price = theBook.Price;
            TheEmbeddedItem.RoleID = theBorrower.RoleID;
            TheEmbeddedItem.RoleName = theBorrower.RoleName;
        }

        [Key]
        public int BorrowingID
        {
            get { return TheEmbeddedItem.BorrowingID; }
            set { TheEmbeddedItem.BorrowingID = value; }
        }
        // Foreign Key to the Books Table
        [HiddenInput(DisplayValue = false)]
        public int BookID
        {
            get { return TheEmbeddedItem.BookID; }
            set { TheEmbeddedItem.BookID = value; }
        }

        public string BookName
        {
            get {
                   return TheEmbeddedItem.BookName;
                }
        }

        public string ISBN
        {
            get { return TheEmbeddedItem.ISBN; }
            set { TheEmbeddedItem.ISBN = value; }
        }

        public int Pages
        {
            get { return TheEmbeddedItem.Pages; }
            set { TheEmbeddedItem.Pages = value; }
        }

        public decimal Price
        {
            get { return TheEmbeddedItem.Price; }
            set { TheEmbeddedItem.Price = value; }
            
        }

        public int GenreID
        {
            get { return TheEmbeddedItem.GenreID;}
            set { TheEmbeddedItem.GenreID = value; }
        }

        public string GenreName
        {
            get { return TheEmbeddedItem.GenreName; }
        }


        // Foreign Key to the Borrowers Table
        [HiddenInput(DisplayValue = false)]
        public int BorrowerID
        {
            get { return TheEmbeddedItem.BorrowerID; }
            set { TheEmbeddedItem.BorrowerID = value; }
        }

        public string BorrowerName
        {
            get { return TheEmbeddedItem.BorrowerName; }
            set { TheEmbeddedItem.BorrowerName = value; }
        }

        public string BorrowerEMail
        {
            get { return TheEmbeddedItem.BorrowerEMail; }
            set { TheEmbeddedItem.BorrowerEMail = value; }
        }

        [DataType(DataType.Date)]

        [Display(Name = "Borrower DOB")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? BorrowerDOB
        {
            get { return TheEmbeddedItem.BorrowerDOB; }
            set { TheEmbeddedItem.BorrowerDOB = value; }
        }

        public int RoleID
        {
            get { return TheEmbeddedItem.RoleID; }
            set { TheEmbeddedItem.RoleID = value; }
        }

        public string RoleName
        {
            get { return TheEmbeddedItem.RoleName; }
        }


        [DataType(DataType.Date)]

        [Display(Name = "Due Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? DueDate
        {
            get { return TheEmbeddedItem.DueDate; }
            set { TheEmbeddedItem.DueDate = value; }
        }

        [DataType(DataType.Date)]

        [Display(Name = "Returned Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? ReturnedDate
        {
            get { return TheEmbeddedItem.ReturnedDate; }
            set { TheEmbeddedItem.ReturnedDate = value; }
        }
        public decimal? Rating
        {
            get { return TheEmbeddedItem.Rating; }
            set { TheEmbeddedItem.Rating = value; }
        }

        public bool isCheckedOut
        {
            get { return TheEmbeddedItem.isCheckedOut; }
           
        }
        public decimal DaysLeft
        {
            get { return TheEmbeddedItem.DaysLeft; }
           
        }





        // the logic below insures that theBook and theAuthor
        // can only be set one time.  all other attempts to
        // set will throw an exception
       
        //public Book theBook
        //{
        //    get { return TheEmbeddedItem.theBook; }
        //    set
        //    {
               
        //            TheEmbeddedItem.theBook = value;
                
        //    }

        //}
     
        //public Borrower theBorrower
        //{
        //    get { return TheEmbeddedItem.theBorrower; }
        //    set
        //    {

        //        TheEmbeddedItem.theBorrower = value;
                
        //    }
        //}

    }
}