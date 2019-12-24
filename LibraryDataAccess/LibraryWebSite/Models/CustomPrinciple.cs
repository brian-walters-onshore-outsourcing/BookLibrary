using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace LibraryWebSite.Models
{
    // helps support the special form of IsInRole for dynamic roles
    public class CustomPrincipal : IPrincipal
    {
        
        public CustomPrincipal(IIdentity identity, string Role)
        {
            Identity = identity;
            theRole = Role.Replace(" ", ""); ;
        }
        public string theRole;
        public IIdentity Identity { get; }

        public bool IsInRole(string role)
        {
            bool rv;
            rv = theRole.Contains(depluraltolowercase(role));
            return rv;
        }

        private  string depluraltolowercase(string s)
        {
            s = s.Replace(" ", "");
            if (s.Length > 0 && 's' == s[s.Length - 1])
            {
                return s.Substring(0, s.Length - 1).ToLower();
            }
            else
            {
                return s.ToLower();
            }
        }


    }
}