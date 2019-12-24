using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryWebSite.Models
{
    public class MustBeInTheRoleAttribute : AuthorizeAttribute
    {
       public MustBeInTheRoleAttribute(string Role)

        {
            this.Roles = Role;
        }
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            bool allowed = true;
            string expression = this.Roles;
            
            allowed = filterContext.HttpContext.User.IsInRole(expression);

            if (allowed)
            {
                //base.OnAuthorization(filterContext);
                return;
            }
            else
            {
                string ReturnURL = filterContext.RequestContext.HttpContext.Request.Path.ToString();
                string message = filterContext.Controller.TempData["Message"] as string;
                string[] operations = expression.Split(':');
                string operation = "None";
                string resource = "None";
                if (2 == operations.Length)
                {
                    operation = operations[0];
                    resource = operations[1];
                }
                if (message == null)
                {
                    message = $"you must be logged into an account that can {operation} a {resource} resource and you are not currently logged into such an account";
                }
                else
                {
                    message += $"<p>you must be logged into an account that can {operation} a {resource} resource and you are not currently logged into such an account</p>";
                    filterContext.Controller.TempData.Remove("Message");
                    
                }
                filterContext.Controller.TempData.Add("Message",
                        message);
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