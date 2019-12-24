using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryWebSite.Models
{
    public class Message
    {
        public string TheMessage { get; set; }
        public Message(string message)
        {
            TheMessage = message;
        }
    }
}