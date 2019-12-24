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
   public class AuthorMapper :MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public AuthorMapper(IDataReader reader)
            :base(reader,"AuthorID","AuthorName","AuthorDOB","AuthorLocation")

        {

        }

        public Author ToAuthor(IDataReader reader)
        {
            Author rv = new Author();
            // the values of the GetXXX have been validated by the constructor
            rv.AuthorID = reader.GetInt32(0);
            rv.AuthorName = reader.GetString(1);
            // get nullableXXX comes from readerhelper.cs
            rv.AuthorDOB = reader.GetNullableDateTime(2);
            rv.AuthorLocation = reader.GetNullableString(3);
            return rv;
        }
  
    }

   public class AuthorDAL : DALBase
    {
       
        /// <summary>
        /// constructs a data access layer object granting access to the stored procedures relating to an Author
        /// </summary>
        /// <param name="connection">a connection to the database</param>
        public AuthorDAL(IDbConnection connection)
        {
            _connection = connection;
        }
        /// <summary>
        /// locates an author record by its primary id
        /// </summary>
        /// <param name="AuthorID">the primary key to the record to return</param>
        /// <returns>an author record</returns>
        public Author AuthorFindByID(int AuthorID)
        {
            Author rv = null;
            // a default return value
            try
            {
                
              
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "AuthorFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@AuthorID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorID;
                    
                    command.Parameters.Add(p);

                    // load the data from the database
                    using(IDataReader reader = command.ExecuteReader())
                        {
                        // the mapper is constructed, and this is where the shape
                        // is validated to insure it is correct
                        // if the database structure changes, 
                        // an exception will be thrown
                        // the less efficient Get Ordinal methods are only 
                        // invoked one time per command
                        // this less efficient (but required) code 
                        // is outside the loop
                        AuthorMapper mapper = new AuthorMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToAuthor(reader);
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
                            throw new Exception($"Multiple reccords found with id: {AuthorID}");
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

        public int AuthorsObtainCount()
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "obtainAuthorsCount";
                    rv = Convert.ToInt32(command.ExecuteScalar());

                   
                    
                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        /// <summary>
        /// returns a list of authors, optionally skipping several for paging
        /// purposes and only returning the amount in the page
        /// </summary>
        /// <param name="Skip">the number of records to ignore</param>
        /// <param name="Take">the number of records to return</param>
        /// <returns></returns>
        public List<Author> AuthorsGetAll(int Skip = 0, int Take = 0)
        {
            List<Author> rv = new List<Author>();
            // a default return value is an empty list
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "AuthorsGetAll";

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
                        AuthorMapper mapper = new AuthorMapper(reader);

                        while (reader.Read())
                        {
                            Author a = mapper.ToAuthor(reader);
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
        /// creates a new author record and then returns the id to that record
        /// </summary>
        /// <param name="AuthorName"></param>
        /// <param name="AuthorDOB"></param>
        /// <param name="AuthorLocation"></param>
        /// <returns>the id to the newly created record</returns>
        public int AuthorCreate(string AuthorName, 
            DateTime ?AuthorDOB, 
            string AuthorLocation)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "AuthorCreate";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@AuthorName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@AuthorDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    if (AuthorDOB.HasValue)
                    {
                        p.Value = AuthorDOB;
                    }
                    else
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                 
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@AuthorLocation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    if (string.IsNullOrWhiteSpace(AuthorLocation))
                    {
                        p.Value = DBNull.Value;
                    }
                    else
                    {
                        p.Value = AuthorLocation;
                    }
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
        /// <param name="AuthorID"></param>
        public void AuthorDelete(int AuthorID)
        {
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "AuthorDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@AuthorID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorID;
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
        /// <param name="AuthorID"></param>
        /// <param name="AuthorName"></param>
        /// <param name="AuthorDOB"></param>
        /// <param name="AuthorLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int AuthorUpdateJust(int AuthorID, string AuthorName, DateTime? AuthorDOB, string AuthorLocation)
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
                    command.CommandText = "AuthorUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@AuthorID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@AuthorName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@AuthorDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    // if the value of the DOB is null, special processing must occur
                    if (AuthorDOB.HasValue)
                    {
                        p.Value = AuthorDOB;
                    }
                    else
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                  
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@AuthorLocation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorLocation;
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
        /// <param name="AuthorID"></param>
        /// <param name="AuthorName"></param>
        /// <param name="AuthorDOB"></param>
        /// <param name="AuthorLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int AuthorUpdateSafe(int AuthorID, 
            string oldAuthorName, 
                   DateTime? oldAuthorDOB, string oldAuthorLocation, 
            string newAuthorName, 
                   DateTime? newAuthorDOB, string newAuthorLocation)
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
                    command.CommandText = "AuthorUpdateSafe";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@AuthorID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = AuthorID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldAuthorName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldAuthorName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldAuthorDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    // if the value of the DOB is null, special processing must occur
                    if (oldAuthorDOB.HasValue)
                    {
                        p.Value = oldAuthorDOB;
                    }
                    else
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                 
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldAuthorLocation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldAuthorLocation;
                    command.Parameters.Add(p);


                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newAuthorName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newAuthorName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newAuthorDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    // if the value of the DOB is null, special processing must occur
                    if (newAuthorDOB.HasValue)
                    {
                        p.Value = newAuthorDOB;
                    }
                    else
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                 
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newAuthorLocation";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newAuthorLocation;
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
