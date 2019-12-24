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
    public class GenreMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public GenreMapper(IDataReader reader)
            : base(reader, "GenreID", "GenreName")

        {

        }

        public Genre ToGenre(IDataReader reader)
        {
            Genre rv = new Genre();
            // the values of the GetXXX have been validated by the constructor
            rv.GenreID = reader.GetInt32(0);
            rv.GenreName = reader.GetString(1);

          
            return rv;
        }

    }

    public class GenreDAL : DALBase
    {

        /// <summary>
        /// constructs a data access layer object granting access to the stored procedures relating to an Genre
        /// </summary>
        /// <param name="connection">a connection to the database</param>
        public GenreDAL(IDbConnection connection)
        {
            _connection = connection;
        }

        public int GenresObtainCount()
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "obtainGenresCount";
                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        /// <summary>
        /// locates an Genre record by its primary id
        /// </summary>
        /// <param name="GenreID">the primary key to the record to return</param>
        /// <returns>an Genre record</returns>
        public Genre GenreFindByID(int GenreID)
        {
            Genre rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "GenreFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@GenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreID;
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
                        GenreMapper mapper = new GenreMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToGenre(reader);
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
                            throw new Exception("Multiple reccords found with id: {GenreID}");
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
        /// returns a list of Genres, optionally skipping several for paging
        /// purposes and only returning the amount in the page
        /// </summary>
        /// <param name="Skip">the number of records to ignore</param>
        /// <param name="Take">the number of records to return</param>
        /// <returns></returns>
        public List<Genre> GenresGetAll(int Skip = 0, int Take = 0)
        {
            List<Genre> rv = new List<Genre>();
            // a default return value is an empty list
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "GenresGetAll";

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
                        GenreMapper mapper = new GenreMapper(reader);

                        while (reader.Read())
                        {
                            Genre a = mapper.ToGenre(reader);
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
        /// creates a new Genre record and then returns the id to that record
        /// </summary>
        /// <param name="GenreName"></param>
        /// <param name="GenreDOB"></param>
        /// <param name="GenreLocation"></param>
        /// <returns>the id to the newly created record</returns>
        public int GenreCreate(string GenreName)
        // GenreName is not part of the Genres table
        // it comes through the GenreID
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "GenreCreate";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@GenreName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreName;
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
        /// <param name="GenreID"></param>
        public void GenreDelete(int GenreID)
        {
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "GenreDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@GenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreID;
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
        /// <param name="GenreID"></param>
        /// <param name="GenreName"></param>
        /// <param name="GenreDOB"></param>
        /// <param name="GenreLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int GenreUpdateJust(int GenreID, string GenreName)
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
                    command.CommandText = "GenreUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@GenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@GenreName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreName;
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
        /// <param name="GenreID"></param>
        /// <param name="GenreName"></param>
        /// <param name="GenreDOB"></param>
        /// <param name="GenreLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int GenreUpdateSafe(int GenreID,
            string oldGenreName,
                   
            string newGenreName )
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
                    command.CommandText = "GenreUpdateSafe";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@GenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldGenreName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldGenreName;
                    command.Parameters.Add(p);
                   



                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newGenreName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newGenreName;
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
