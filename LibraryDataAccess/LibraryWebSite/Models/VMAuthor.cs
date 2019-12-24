using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using LibraryCommon;

namespace LibraryWebSite.Models
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


    public class VMAuthor
    {

        public static VMAuthor MakeNew(Author theList)
        {
            if (theList == null)
            {
                return null;
            }
            return new VMAuthor(theList);
        }
        public static List<VMAuthor> ToList(List<Author> theList)
        {
            List<VMAuthor> rv = new List<VMAuthor>();
            foreach (var b in theList)
            {
                VMAuthor vm = new VMAuthor(b);
                rv.Add(vm);
            }
            return rv;
        }

        public static implicit operator Author(VMAuthor vm)
        {
            return vm.TheEmbeddedItem;
        }
        Author TheEmbeddedItem { get; set; }
        public VMAuthor() { TheEmbeddedItem = new Author(); }
        public VMAuthor(Author b)
        {

            TheEmbeddedItem = b;
        }

        [Key]
        public int AuthorID
        {
            get { return TheEmbeddedItem.AuthorID; }
            set { TheEmbeddedItem.AuthorID = value; }
        }
        public string AuthorName
        {
            get { return TheEmbeddedItem.AuthorName; }
            set { TheEmbeddedItem.AuthorName = value; }
        }

        // AuthorDOB is nullable in the database, so use c# nullable
        [DataType(DataType.Date)]

        [Display(Name = "Birth Date")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime? AuthorDOB
        {
            get { return TheEmbeddedItem.AuthorDOB; }
            set { TheEmbeddedItem.AuthorDOB = value; }
        }
        public string AuthorLocation
        {
            get { return TheEmbeddedItem.AuthorLocation; }
            set { TheEmbeddedItem.AuthorLocation = value; }
        }

        // age is computed from the Date of Birth
        public int Age  // measured in years
        {


            get { return TheEmbeddedItem.Age; }



        }



    }
}