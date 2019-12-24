using Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace LibraryWebSite
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error(Object sender, EventArgs e)
        {
            var ex = Server.GetLastError();
            if (ex is ThreadAbortException)
            {
                return;
            }
            Logger.Log(ex, "Global.asax");
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            string Username = Session["AUTHUser"] as string;
            string Role = Session["AUTHRole"] as string;
            string Method = Session["AUTHMethod"] as string;
            // the previous data was placed into the Session 
            // by the Login POST Action in the Home controller
            if (string.IsNullOrEmpty(Username))
            {
                // if the Username is not set, then the user is not logged in
                // returning without setting the principle uses the default
                // principle of an Anonymous user
                return;
            }
            // the username is set to the value in session and the Method is also set
            // the method contains various chunks of identity information for internal
            // use.  See the Login Action in Home controller for how it is set
            GenericIdentity identity = new GenericIdentity(Username, Method);
            // the custom principal class has a custom implementation of IsInRole to
            // support the dynamic role mechanism. 
            Models.CustomPrincipal principle = new Models.CustomPrincipal(identity, Role);
            // the newly created principle is loaded into the User object
            // this allows the rest of the site to use the "User" object to check
            // for authentication instead of binding to the Session all over the place.
            // if we decide to change to something other than session, it only has to be
            // changed in three places:  Login, Logout and here
            HttpContext.Current.User = principle;
        }
    }
}
