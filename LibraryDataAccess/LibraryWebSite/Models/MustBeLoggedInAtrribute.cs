using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryWebSite.Models
{
    public class MustBeLoggedInAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                // base.OnAuthorization(filterContext);
                return;
            }
            else
            {
                string ReturnURL = filterContext.RequestContext.HttpContext.Request.Path.ToString();
                string message = filterContext.Controller.TempData["Message"] as string;
                if (message == null)
                {
                    message = "you must be logged into any account to access this resource, you are not currently logged in at all";
                }
                else
                {
                    message += $"<p>you must be logged into any account to access this resource, you are not currently logged in at all</p>";
                    filterContext.Controller.TempData.Remove("Message");

                }
                filterContext.Controller.TempData.Add("Message",message);
                filterContext.Controller.TempData.Remove("ReturnURL");
                filterContext.Controller.TempData.Add("ReturnURL", ReturnURL);
                System.Web.Routing.RouteValueDictionary dict = new System.Web.Routing.RouteValueDictionary();
                dict.Add("Controller", "Home");
                dict.Add("Action", "Login");
                filterContext.Result = new RedirectToRouteResult(dict);
            }
        }
    }
}