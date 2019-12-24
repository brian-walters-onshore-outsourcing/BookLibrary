using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Logging
{
    static public class Logger
    {

        static string connectionstring;

        static Logger()
        {
            string fallbackconnectionstring = @"Data Source=.\sqlexpress;Initial Catalog=Library;Integrated Security=True";
            string actual = fallbackconnectionstring;
            // needed to add a reference to System.Configuration
            // in order to get access to ConfigurationManager
            var potential =
            System.Configuration.ConfigurationManager.ConnectionStrings["LibraryConnectionString"];
            if (potential == null)
            {
                connectionstring = fallbackconnectionstring;
            }
            else
            {
                connectionstring = potential.ConnectionString;
               
            }
        }

        // this is used for the when clause...  no need for id
        public static bool Log(Exception ex, string layer)
        {
            Log(ex, layer, 0);
            return false;
        }

        // this is used for actual logging.  returns id to exception record
        public static int Log(Exception ex, string layer,int i)
            // the int i is used to disambugate the calls to Log
        {
            object rv = null;
           try
            {
                using (SqlConnection connection = new SqlConnection(connectionstring))
                {
                    connection.Open();
                    using (SqlCommand command = connection.CreateCommand())
                    {
                        command.CommandText = "InsertLogItem";
                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@message", ex.Message);
                        command.Parameters.AddWithValue("@trace", 
                            ex.StackTrace.ToString());
                        command.Parameters.AddWithValue("@layer", layer);
                        rv = command.ExecuteScalar();
                    }
                }
            }
            catch (Exception exc)
            {
                // needed to add reference to System.Web in order to
                // get access to HttpContext
              var p = System.Web.HttpContext.Current.Server.MapPath("~");
                p += @"ErrorLog.log";
                System.IO.File.AppendAllText(p,
              $"At [{DateTime.Now.ToString("yyyy.MM.dd:hh.mm.ss")}] Layer: '{layer}'\r\n" +
              "while attempting to record the original exception to the database, this exception occured:\r\n" 
                + exc.Message 
                + "\r\n This is the original Exception that was attempting to be written to the database:\r\n"
                + ex.Message 
                + "\r\nThe stack trace for the original exception is:"
                + exc.StackTrace.ToString()
                + "\r\n\r\n and this is the stack trace for the exception that occured when the original was being written:\r\n"
                + ex.StackTrace.ToString()
                + "\r\n"
                + "**********************************************\r\n"
                ) ;

            }
            if (rv == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(rv);
            }
        }
    }
}
