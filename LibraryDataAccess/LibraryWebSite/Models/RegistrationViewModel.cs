using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace LibraryWebSite.Models
{
    public class RegistrationViewModel
    {
        // This maps to the Borrower information except
        // for the ID  (which will be computed)
        // The ROLEID  (Which will be hard coded)
        // and the HASH and SALT (user doesnt know this)
        // additional informatin in the form of
        // password and passowrd again are need during registration

        [Required]
        [Display(Name = "User Name")]
        public string UserName { get; set; }
        [Required]
        [Display(Name = "EMail Address")]
        public string EMail { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [Display(Name ="Birth Date")]
        public DateTime DOB { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Compare("Password",ErrorMessage ="The Passwords do not Match")]
        [Display(Name ="Retype Password")]
        public string PasswordAgain { get; set; }



    }
}