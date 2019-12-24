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
    public class RoleMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public RoleMapper(IDataReader reader)
            : base(reader, "RoleID", "RoleName", 
                  "CreateOperation","UpdateOperation",
                  "DeleteOperation", "ListOperation",
                  "ViewOperation"
                  
                  )

        {

        }

        public Role ToRole(IDataReader reader)
        {
            Role rv = new Role();
            // the values of the GetXXX have been validated by the constructor
            rv.RoleID = reader.GetInt32(0);
            rv.RoleName = reader.GetString(1);
            rv.CreateOperation = reader.GetString(2);
            rv.UpdateOperation = reader.GetString(3);
            rv.DeleteOperation = reader.GetString(4);
            rv.ListOperation = reader.GetString(5);
            rv.ViewOperation = reader.GetString(6);


            return rv;
        }

    }

    public class RoleDAL : DALBase
    {

        /// <summary>
        /// constructs a data access layer object granting access to the stored procedures relating to an Role
        /// </summary>
        /// <param name="connection">a connection to the database</param>
        public RoleDAL(IDbConnection connection)
        {
            _connection = connection;
        }
        public int RolesObtainCount()
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "obtainRolesCount";
                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        /// <summary>
        /// locates an Role record by its primary id
        /// </summary>
        /// <param name="RoleID">the primary key to the record to return</param>
        /// <returns>an Role record</returns>
        public Role RoleFindByID(int RoleID)
        {
            Role rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "RoleFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@RoleID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleID;
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
                        RoleMapper mapper = new RoleMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToRole(reader);
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
                            throw new Exception("Multiple reccords found with id: {RoleID}");
                        }
                    }
                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
            return rv;
        }
        /// <summary>
        /// returns a list of Roles, optionally skipping several for paging
        /// purposes and only returning the amount in the page
        /// </summary>
        /// <param name="Skip">the number of records to ignore</param>
        /// <param name="Take">the number of records to return</param>
        /// <returns></returns>
        public List<Role> RolesGetAll(int Skip = 0, int Take = 0)
        {
            List<Role> rv = new List<Role>();
            // a default return value is an empty list
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "RolesGetAll";

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
                        RoleMapper mapper = new RoleMapper(reader);

                        while (reader.Read())
                        {
                            Role a = mapper.ToRole(reader);
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
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
            return rv;
        }
        /// <summary>
        /// creates a new Role record and then returns the id to that record
        /// </summary>
        /// <param name="RoleName"></param>
        /// <param name="RoleDOB"></param>
        /// <param name="RoleLocation"></param>
        /// <returns>the id to the newly created record</returns>
        public int RoleCreate(string RoleName,string createOperation,
           string updateOperation, string deleteOperation,
           string listOperation, string viewOperation)
        
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "RoleCreate";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@RoleName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@CreateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = createOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@UpdateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = updateOperation;
                    command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@DeleteOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = deleteOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@ListOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = listOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@ViewOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = viewOperation;
                    command.Parameters.Add(p);
                   


                    // since this procedure returns a single row with 
                    // a single value in column 1
                    // we can retrieve it much more efficiently using
                    // execute scalar, avoiding all the reader overhead
                    rv = Convert.ToInt32(command.ExecuteScalar());
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
            return rv;
        }
        /// <summary>
        /// deletes the identified record
        /// </summary>
        /// <param name="RoleID"></param>
        public void RoleDelete(int RoleID)
        {
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "RoleDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@RoleID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleID;
                    command.Parameters.Add(p);


                    // since this procedure does not return anything we use
                    // execute non query, avoiding all the reader overhead
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
        }
        /// <summary>
        /// uses pessimistic concurrency to update a record.  If two sessions
        /// are editing the same record at the same time
        /// the last writer will overwrite any changes made by the first writer
        /// </summary>
        /// <param name="RoleID"></param>
        /// <param name="RoleName"></param>
        /// <param name="RoleDOB"></param>
        /// <param name="RoleLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int RoleUpdateJust(int RoleID, string RoleName, string createOperation,
           string updateOperation, string deleteOperation,
           string listOperation, string viewOperation)
        {
            int rv = 0;
            // a reasonable default value to return
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "RoleUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@RoleID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleID;
                    command.Parameters.Add(p);
                    p = command.CreateParameter();
                    p.ParameterName = "@RoleName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@CreateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = createOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@UpdateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = updateOperation;
                    command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@DeleteOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = deleteOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@ListOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = listOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@ViewOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = viewOperation;
                    command.Parameters.Add(p);
                    // since this procedure returns a single row with 
                    // a single value in column 1
                    // we can retrieve it much more efficiently using
                    // execute scalar, avoiding all the reader overhead
                    rv = Convert.ToInt32(command.ExecuteScalar());
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {
                // ALL exceptions are logged by the when clause
                // and then the exception is tossed to the next layer up.
                // the catch block is NEVER invoked because the 
                // when clause never evaluates to true since the 
                // Log method returns false
            }
            return rv;
        }


        /// <summary>
        /// uses optimistic concurrency to update a record.  If two sessions
        /// are editing the same record at the same time
        /// the last writer will not overwrite any changes made by the first writer
        /// instead the return value of 0 indicates that a conflict occured
        /// the return value of 1 indicates that no conflict occured
        /// </summary>
        /// <param name="RoleID"></param>
        /// <param name="RoleName"></param>
        /// <param name="RoleDOB"></param>
        /// <param name="RoleLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int RoleUpdateSafe(int RoleID,
            string oldRoleName, string oldcreateOperation,
           string oldupdateOperation, string olddeleteOperation,
           string oldlistOperation, string oldviewOperation,
           string newRoleName, string newcreateOperation,
           string newupdateOperation, string newdeleteOperation,
           string newlistOperation, string newviewOperation

           )
        {
            int rv = 0;
            // a reasonable default value to return
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "RoleUpdateSafe";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@RoleID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldRoleName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldRoleName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldCreateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldcreateOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldUpdateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldupdateOperation;
                    command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldDeleteOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = olddeleteOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldListOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldlistOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldViewOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldviewOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newRoleName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newRoleName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newCreateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newcreateOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newUpdateOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newupdateOperation;
                    command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newDeleteOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newdeleteOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newListOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newlistOperation;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newViewOperation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newviewOperation;
                    command.Parameters.Add(p);





                    // since this procedure returns a single row with 
                    // a single value in column 1
                    // we can retrieve it much more efficiently using
                    // execute scalar, avoiding all the reader overhead
                    rv = Convert.ToInt32(command.ExecuteScalar());
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
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
