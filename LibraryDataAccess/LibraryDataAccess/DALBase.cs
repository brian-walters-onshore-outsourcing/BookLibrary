using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace LibraryDataAccess
{
   public class DALBase
    {
        protected System.Data.IDbConnection _connection { get; set; }
        protected void EnsureConnected()
        {
            switch(_connection.State )
            {
                case (System.Data.ConnectionState.Open): break;     
                // we are conneccted
                case (System.Data.ConnectionState.Fetching): break;
                // we are conneccted
                case (System.Data.ConnectionState.Executing): break;
                // we are conneccted
                case (System.Data.ConnectionState.Connecting): break;
                // we are conneccted
                case (System.Data.ConnectionState.Closed):
                    // we are not connected
                    _connection.Open();
                    break;
                case (System.Data.ConnectionState.Broken):
                    // we are in an inconsistent state
                    _connection.Close();
                    _connection.Open();
                    break;
                default:
                    throw new Exception($"Invalid Connection State:{_connection.State}");

            }
        }
    }

    public class MapperBase
    {
        // params keyword allows call like
        // MapperBase(reader,"a","b","c") and "a","b","c" are collected into the array
        public MapperBase(IDataReader reader, params string[] columns)
        {
            int index = 0;
            foreach (string name in columns)
            {
               
                string actual = reader.GetName(index);
               
                if (actual.ToLower() == name.ToLower())
                {
                    index++;
                }
                else
                {
                    throw new Exception($"'{name}' is not offset {index} as expected, '{actual}' is at that offset instead");
                }
            }
        }
    }
}
