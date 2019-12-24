using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryCommon
{
    public class LogItem
    {
        public int LogId { get; set; }
        public string Message { get; set; }
        public string Layer { get; set; }
        public string Trace { get; set; }
        public DateTime Time { get; set; }
    }
}
