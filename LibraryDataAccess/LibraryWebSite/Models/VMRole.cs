using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using LibraryCommon;

namespace LibraryWebSite.Models
{
    public class VMRole 
    {
        // this role class represents an example of a Dynamic Role.  When the
        // role is changed from the web site, real changes occur in the site
        // and new roles can be added with different combinations of operations
        // without requiring changes to the web site code.
        // changing combinations of existing 'capabilities' does not require any changes
        // but adding new 'capabilities' does require modifying the attributes
        // to refer to the new 'capabilities'.  The set of prexisting operations
        // refer to types of manipulation.  The role is composed like follows:
        //  View:capability   or   Create:capability or List:capability
        //  generically:   operation:capability
        //   +adding new operations will be MUCH harder than adding new capabilities
        //   new operatios will require new columns to be added to the roles table
        //   and then would need to run up the layers, and the custom role provider
        //   will need to be changed
        //   +adding new capabilities is MUCH easier, since it is nothing more than a
        //   string stored in the database, and checked against the MustBeInRole
        //   attribute.  Any entry level programmer can add new controller actions
        //   and can lock the controller actions with the proper MustBeInRole
        //   attribute, and once the role is eddited to add the new capability, the 
        //   controller action will be locked to users in a role with the capability.

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



        public static VMRole MakeNew(Role theList)
        {
            if (theList == null)
            {
                return null;
            }
            return new VMRole(theList);
        }
        public static List<VMRole> ToList(List<Role> theList)
        {
            List<VMRole> rv = new List<VMRole>();
            foreach (var b in theList)
            {
                VMRole vm = new VMRole(b);
                rv.Add(vm);
            }
            return rv;
        }

        public static implicit operator Role(VMRole vm)
        {
            return vm.TheEmbeddedItem;
        }
        Role TheEmbeddedItem { get; set; }
        public VMRole() { TheEmbeddedItem = new Role(); }
        public VMRole(Role b)
        {

            TheEmbeddedItem = b;
        }
        [Key]
        public int RoleID
        {
            get { return TheEmbeddedItem.RoleID; }
            set { TheEmbeddedItem.RoleID = value; }
        }
        public string RoleName
        {
            get { return TheEmbeddedItem.RoleName; }
            set { TheEmbeddedItem.RoleName = value; }
        }
        public string CreateOperation
        {
            get { return TheEmbeddedItem.CreateOperation; }
            set { TheEmbeddedItem.CreateOperation = value; }
        }
        public string UpdateOperation
        {
            get { return TheEmbeddedItem.UpdateOperation; }
            set { TheEmbeddedItem.UpdateOperation = value; }
        }
        public string DeleteOperation
        {
            get { return TheEmbeddedItem.DeleteOperation; }
            set { TheEmbeddedItem.DeleteOperation = value; }
        }
        public string ListOperation
        {
            get { return TheEmbeddedItem.ListOperation; }
            set { TheEmbeddedItem.ListOperation = value; }
        }
        public string ViewOperation
        {
            get { return TheEmbeddedItem.ViewOperation; }
            set { TheEmbeddedItem.ViewOperation = value; }
        }


    }
}