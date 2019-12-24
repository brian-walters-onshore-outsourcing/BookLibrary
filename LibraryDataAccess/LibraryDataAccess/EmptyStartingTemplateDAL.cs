using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
// these are the three usings needed in each DAL
using LibraryCommon;
using System.Data;
using Logging;


namespace LibraryDataAccess
{
   
   public class Empty  // this class is actually in the COMMON library
                 // but I put it here so this one would compile
    {
        // here are the basic properties from the database
        
        // also here will be any Foreign Key data from the database

        // and any computed data (like ages from birthdates)
    }

    public class EmptyMapper : MapperBase
    {
        public EmptyMapper(IDataReader reader)
            :base(reader,
                 "columnnameofcolumn0",
                 "columnnameofcolumn1",
                 "etc")
        {
            // 
        }

        public Empty ToEmpty(IDataReader reader)
        {
            Empty rv = new Empty();
            // set all the columns as identified above using GetXXX(offset)

            return rv;
        }
    }

    // this class is just to make this section compile.  ignore this class in your code
    // and it should not be there in your code
    public class returnvalue { }

    public class EmptyDAL : DALBase
    {
        // this constructor is a form of dependency injection.
        // the connection to this DAL is passed in as a
        // parameter at construction time
        // the parameter is an interface
        // so any implementation of a connection will work
       
        public EmptyDAL(IDbConnection connection)
        {
            _connection = connection;
        }



        // the basic CRUD is then created
        // EmptyFindByID    returns Empty
        // EmptyGetALL      returns List<Empty>
        // EmptyCreate      returns int
        // EmptyDelete      returns void
        // EmptyUpdateJust  returns int
        // EmptyUpdateSafe  returns int
        // ObtainEmptyCount returns int

        // all cruds follow the same pattern
        public returnvalue EmptyFindByID(int XXX /* all parameters go here */)
        {
            returnvalue rv = new returnvalue(); // or 0 for int or null if appropriate
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                // this insures the correct command is created.  We don't have
                // to know which type of connection is being used. 
                // remember that the connection is being injected from our caller
                // the using makes sure the command is cleaned up when the block is exited
                {
                    command.CommandText = "EmptyXXX"; // set to name of stored procedure
                    command.CommandType = CommandType.StoredProcedure;
                    IDataParameter p = command.CreateParameter();
                    // this insures that the correct parameter is created.  the type
                    // flows through the connection to the command to the parameter
                    // we used an interface, and can support any type of client
                    p.ParameterName = "@XXX";
                    p.DbType = DbType.Int32; // this is the type of the XXX parameter
                    p.Direction = ParameterDirection.Input;
                    p.Value = XXX;
                    command.Parameters.Add(p);

                    // additional parameters can reuse the p variable created above
                    // once added to the parameters of the command object p is 
                    // no longer needed and may be assigned a new parameter as follows
                    p = command.CreateParameter();
                    // and the five lines above can be used to configure this new param


                    // once all the parameters are configured, now invoke the appropriate
                    // execute-- NonQuery, Scalar, or Reader.

                    // using is not necessary when using ExecuteNonQuery or ExecuteScalar
                    // but be sure to use a using construct if you call ExecuteReader:
                    using (IDataReader reader = command.ExecuteReader() )
                    {
                        // do the work with the reader.  and it will be cleaned up when
                        // you leave this block
                    }
                }
            }
            catch (Exception ex) when (Logger.Log(ex))
            {
                // this area is never called since logger.log returns false
            }
            return rv;
        }
    }
}
