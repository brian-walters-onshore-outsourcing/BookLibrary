using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibraryCommon;
using System.Data;
using Logging;

namespace LibraryDataAccess
{
   public  class LogItemMapper: MapperBase
    {
        public LogItemMapper(IDataReader reader)
           : base(reader, "LogID","Message","Layer","Trace","Time")

        {

        }

        public LogItem ToLogItem(IDataReader reader)
        {
            LogItem rv = new LogItem();
            rv.LogId = reader.GetInt32(0);
            rv.Message = reader.GetNullableString(1);
            rv.Layer = reader.GetNullableString(2);
            rv.Trace = reader.GetNullableString(3);
            rv.Time = reader.GetNullableDateTime(4);
            return rv;
        }
    }

    public class LogItemDAL : DALBase
    {
        public LogItemDAL(IDbConnection connection)
        {
            _connection = connection;
        }

        public List<LogItem> LogItemsGetAll(int Skip = 0, int Take = 0)
        {
            List<LogItem> rv = new List<LogItem>();
            // a default return value is an empty list
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "LogItemsGetAll";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@Skip";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Skip;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Take";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Take;
                    command.Parameters.Add(p);
                    // load the data from the database
                    using (IDataReader reader = command.ExecuteReader())
                    {
                        // the mapper is constructed, and this is where the shape
                        // is validated to insure it is correct
                        // if the database structure changes, 
                        // an exception will be thrown
                        // the less efficient Get Ordinal methods are only 
                        // invoked one time per command
                        // this less efficient (but required) code 
                        // is outside the loop
                        LogItemMapper mapper = new LogItemMapper(reader);

                        while (reader.Read())
                        {
                            LogItem a = mapper.ToLogItem(reader);
                            // the mapper uses the much more efficient getXXX 
                            // methods internally to avoid boxing and 
                            // string manipulation.  this more efficient code is 
                            // inside the loop
                            if (a != null)
                            // if the mapper returns null for some reason it will
                            // be ignored
                            {
                                rv.Add(a);
                            }
                        }
                        // when the flow gets here, all the records have been processed
                        // this time there is not any post processing that needs to happen

                    }
                }
            }
            catch (Exception ex) when (Logger.Log(ex, "DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
            return rv;
        }

        public LogItem LogItemFindByID(int LogItemID)
        {
            LogItem rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "LogItemFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@LogID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = LogItemID;

                    command.Parameters.Add(p);

                    // load the data from the database
                    using (IDataReader reader = command.ExecuteReader())
                    {
                        // the mapper is constructed, and this is where the shape
                        // is validated to insure it is correct
                        // if the database structure changes, 
                        // an exception will be thrown
                        // the less efficient Get Ordinal methods are only 
                        // invoked one time per command
                        // this less efficient (but required) code 
                        // is outside the loop
                        LogItemMapper mapper = new LogItemMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToLogItem(reader);
                            // the mapper uses the much more efficient getXXX 
                            // methods internally to avoid boxing and 
                            // string manipulation.  this more efficient code is 
                            // inside the loop
                            count++;
                        }
                        // this method is expecting a single record to be returned
                        // check to see if more than one record was returned
                        // this probably means that a where clause is incorrect in the SQL layer
                        if (count > 1)
                        {
                            throw new Exception($"Multiple reccords found with id: {LogItemID}");
                        }
                    }
                }

            }
            catch (Exception ex) when (Logger.Log(ex, "DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
            return rv;
        }


    }
}
