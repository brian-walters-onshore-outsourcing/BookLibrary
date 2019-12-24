using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace LibraryWebSite
{

    // this class provides a set of methods designed to hide links when a 
    // user is not in the correct role.  some are designed to be used in an
    // if statement (the ones returning bool) 
    // others are designed to be used directly (the ones return MvcHtmString)
    // all are designed for the Razor Pages
    public static class Hide
    {
   

        public static MvcHtmlString UnlessInTheRole(string Role, String data)
        {

            if (UnlessInAnyRole(Role))
            {
                return new MvcHtmlString(data);

            }
            else
            {
                return new MvcHtmlString("");
            }

        }

        public static MvcHtmlString UnlessInTheRole(string Role, MvcHtmlString data)
        {

            if (UnlessInAnyRole(Role))
            {
                return new MvcHtmlString(data.ToHtmlString());

            }
            else
            {
                return new MvcHtmlString("");
            }

        }

        public static MvcHtmlString UnlessInAnyRole(string Role, String data)
        {

            if (UnlessInAnyRole(Role))
            {
                return new MvcHtmlString(data);

            }
            else
            {
                return new MvcHtmlString("");
            }

        }

        public static MvcHtmlString UnlessInAnyRole(string Role, MvcHtmlString data)      {
            
            if (UnlessInAnyRole(Role))
            {
                return  new MvcHtmlString(data.ToHtmlString());
           
            }
            else
            {
                return new MvcHtmlString("");
            }

        }
        public static MvcHtmlString UnlessInAllRoles(string Role, String data)
        {

            if (UnlessInAllRoles(Role))
            {
                return new MvcHtmlString(data);

            }
            else
            {
                return new MvcHtmlString("");
            }

        }

        public static MvcHtmlString UnlessInAllRoles(string Role, MvcHtmlString data)
        {

            if (UnlessInAllRoles(Role))
            {
                return new MvcHtmlString(data.ToHtmlString());

            }
            else
            {
                return new MvcHtmlString("");
            }

        }

        public static bool UnlessInTheRole(string Role)
        {
            IPrincipal user = HttpContext.Current.User;

            if (user.IsInRole(Role))
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
        public static bool UnlessInAnyRole(string Role)
        {
           IPrincipal user = HttpContext.Current.User;
            string[] items = Role.Split(',');
            foreach(string item in items)
            {
                if (user.IsInRole(item))
                {
                    return true;
                }
            }
            return false;
        }
        public static bool UnlessInAllRoles(string Role)
        {
            IPrincipal user = HttpContext.Current.User;
            string[] items = Role.Split(',');
            foreach (string item in items)
            {
                if (!user.IsInRole(item))
                {
                    return false;
                }
            }
            return true;
        }
    }


    // this class is designed to help manufacture link menus for index pages
    // the class will be passed a variety of MvcHtmlStrings and will insure that
    // the "|" that surround the links are properly displayed.  The goal is to avoid
    // menus like   |details|delete    ---- when Edit is removed due to roles
    // or           Edit||delete       ---- when Delete is removed due to roles
    // or           Edit|Details|      ---- when delete is removed due to roles
    // or           Edit||             ---- when both details and delete are removed
    // ----------
    // implementation is to PREPEND the "|" on each iteration except for the first
    public static class Make
    {
        public static MvcHtmlString ActionLinks(params MvcHtmlString [] links)
        {
            System.Text.StringBuilder rv = new System.Text.StringBuilder();
            bool first = true;
            foreach(var item in links)
            {
                if (string.IsNullOrEmpty(item.ToHtmlString()))
                {
                    continue;
                }
                if (first)
                {
                    first = false;
                    
                }
                else
                {
                    rv.Append(" | ");
                }
                rv.Append(item.ToHtmlString());
            }
            return new MvcHtmlString(rv.ToString());

        }
    }


}