using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibraryCommon;

namespace LibraryWebSite.Models
{
    public class VMBook 
    {

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
        

        public SelectList PopulateGenreItems(List<Genre> Genres)
        {

            GenreItems = new SelectList(Genres, "GenreID", "GenreName");
            return GenreItems;

        }

        public SelectList GenreItems { get; set; }




        public static VMBook MakeNew(Book theList)
        {
            if (theList == null)
            {
                return null;
            }
            return new VMBook(theList);
        }
        public static List<VMBook> ToList(List<Book> theList)
        {
            List<VMBook> rv = new List<VMBook>();
            foreach (var b in theList)
            {
                VMBook vm = new VMBook(b);
                rv.Add(vm);
            }
            return rv;
        }

        public static implicit operator Book(VMBook vm)
        {
            return vm.TheEmbeddedItem;
        }
        Book TheEmbeddedItem { get; set; }
        public VMBook() { TheEmbeddedItem = new Book(); }
        public VMBook(Book b)
        {

            TheEmbeddedItem = b;
        }

        [Key]
        public int BookID
        {
            get { return TheEmbeddedItem.BookID; }
            set { TheEmbeddedItem.BookID = value; }
        }

        public string ISBN
        {
            get { return TheEmbeddedItem.ISBN; }
            set { TheEmbeddedItem.ISBN = value; }
        }
        public string BookName
        {
            get { return TheEmbeddedItem.BookName; }
            set { TheEmbeddedItem.BookName = value; }
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
        // Foreign Key to the Genres Table
        [HiddenInput(DisplayValue = false)]
        public int GenreID
        {
            get { return TheEmbeddedItem.GenreID; }
            set { TheEmbeddedItem.GenreID = value; }
        }

        // because of the foreign Key GenreID
        // this field is brought in as well
        public string GenreName
        {
            get { return TheEmbeddedItem.GenreName; }
            
        }

        public int CheckOuts
        {
            get { return TheEmbeddedItem.CheckOuts; }
        }

        public int DaysOverdue
        {
            get { return TheEmbeddedItem.DaysOverdue; }
        }

        public decimal AvgRating
        {
            get { return TheEmbeddedItem.AvgRating; }
        }




    }
}