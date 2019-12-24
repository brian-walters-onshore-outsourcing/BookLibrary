using LibraryBusinessLogicLayer;
using LibraryCommon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryWebSite.Models
{
    // this class provides easy access to authentication data
    public static class Authentication
    {

        // this class extends the context class adding this function to it
        public static Borrower GetCurrentUser(this Context ctx)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated )
            {
                return null;
            }

            string username = HttpContext.Current.User.Identity.Name;
            var rv = ctx.BorrowerSecuredFindByName(username);
            if (null == rv)
            {
                throw new Exception($"Expected to find user with name '{username}");
            }
            return rv;
        }

        // this function returns true if the current user has hashed passwords
        // and false if their passwords are in cleartext
        // cleartext is told when the SALT contains "cleartext"
        public static bool isHashed()
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {

                return HttpContext.Current.User.Identity.AuthenticationType?.StartsWith("Hashed") ?? false;
            }
            else
            {
                return false;
            }
        }
    }

}