using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


// this  class is not being used - I was just testing generics
// used like


// class VMBook : VMBase(book,VMBook)  book is the embedded type    T
//                                 and VMBook is the derived type  DT
// the class provides a generic implementation of the helper methods 
//    MakeNew
//    ToList
//    implicit Operator XXX
//    adds the Embedded Field and implements two constructors
//    This solution does work, and the usage pattern is acceptable, but
//     understanding this may be above an entry level programmer, so I 
//     am not using it in the project.  Here it is for the adventurous

namespace LibraryWebSite.Models
{
    public class VMBase<T,DT> where DT : VMBase<T,DT>, new() 
                              where T  : new()
    {
        public static DT MakeNew(T theList)
        {
            if (theList == null)
            {
                return default(DT);
            }
            DT made = new DT();
            made.TheEmbeddedItem = theList;
            return made;
        }
        public static List<DT> ToList(List<T> theList)
        {
            List<DT> rv = new List<DT>();
            foreach (var b in theList)
            {
                DT vm = new DT();
                vm.TheEmbeddedItem = b;
                rv.Add(vm);
            }
            return rv;
        }

        public static implicit operator T(VMBase<T,DT> vm)
        {
            return vm.TheEmbeddedItem;
        }
        protected T TheEmbeddedItem { get; set; }
        public VMBase() { TheEmbeddedItem = new T(); }
        public VMBase(T b)
        {

            TheEmbeddedItem = b;
        }
    }
}