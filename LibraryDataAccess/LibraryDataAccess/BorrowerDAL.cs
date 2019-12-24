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
    public class BorrowerMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public BorrowerMapper(IDataReader reader)
            : base(reader, "BorrowerID", "BorrowerName", "BorrowerEMail", "BorrowerDOB", "RoleID","RoleName")

        {

        }

        public Borrower ToBorrower(IDataReader reader)
        {
            // the role name is read only, so it must be sent in at construction time
            Borrower rv = new Borrower(reader.GetString(5));
            // the values of the GetXXX have been validated by the constructor
            rv.BorrowerID = reader.GetInt32(0);
            rv.BorrowerName = reader.GetString(1);
            rv.BorrowerEMail = reader.GetString(2);
            // NullableXXX comes from readerhelper.cs
            rv.BorrowerDOB = reader.GetNullableDateTime(3);
           
            rv.RoleID = reader.GetInt32(4);
            
            return rv;
        }

    }

    public class BorrowerDAL : DALBase
    {

        /// <summary>
        /// constructs a data access layer object granting access to the stored procedures relating to an Borrower
        /// </summary>
        /// <param name="connection">a connection to the database</param>
        public BorrowerDAL(IDbConnection connection)
        {
            _connection = connection;
        }

        public int BorrowerObtainCount()
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "obtainBorrowersCount";
                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        /// <summary>
        /// locates an Borrower record by its primary id
        /// </summary>
        /// <param name="BorrowerID">the primary key to the record to return</param>
        /// <returns>an Borrower record</returns>
        public Borrower BorrowerFindByID(int BorrowerID)
        {
            Borrower rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerID;
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
                        BorrowerMapper mapper = new BorrowerMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBorrower(reader);
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
                            throw new Exception("Multiple reccords found with id: {BorrowerID}");
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

        public Borrower BorrowerFindByName(string Name)
        {
            Borrower rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerFindByName";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Name;
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
                        BorrowerMapper mapper = new BorrowerMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBorrower(reader);
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
                            throw new Exception("Multiple reccords found with id: {BorrowerID}");
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

        public Borrower BorrowerFindByEmail(string Email)
        {
            Borrower rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerFindByEmail";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerEMail";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Email;
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
                        BorrowerMapper mapper = new BorrowerMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBorrower(reader);
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
                            throw new Exception("Multiple reccords found with id: {BorrowerID}");
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
        /// returns a list of Borrowers, optionally skipping several for paging
        /// purposes and only returning the amount in the page
        /// </summary>
        /// <param name="Skip">the number of records to ignore</param>
        /// <param name="Take">the number of records to return</param>
        /// <returns></returns>
        public List<Borrower> BorrowersGetAll(int Skip = 0, int Take = 0)
        {
            List<Borrower> rv = new List<Borrower>();
            // a default return value is an empty list
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowersGetAll";

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
                        BorrowerMapper mapper = new BorrowerMapper(reader);

                        while (reader.Read())
                        {
                            Borrower a = mapper.ToBorrower(reader);
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
        /// creates a new Borrower record and then returns the id to that record
        /// </summary>
        /// <param name="BorrowerName"></param>
        /// <param name="BorrowerDOB"></param>
        /// <param name="BorrowerLocation"></param>
        /// <returns>the id to the newly created record</returns>
        public int BorrowerCreate(string BorrowerName,
            string BorrowerEMail,
            DateTime? BorrowerDOB,
            int RoleID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerCreate";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BorrowerEmail";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerEMail;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BorrowerDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    if (BorrowerDOB.HasValue)
                    {
                        p.Value = BorrowerDOB;
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
                    p.ParameterName = "@RoleID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleID;
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
        /// <param name="BorrowerID"></param>
        public void BorrowerDelete(int BorrowerID)
        {
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerID;
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
        /// <param name="BorrowerID"></param>
        /// <param name="BorrowerName"></param>
        /// <param name="BorrowerDOB"></param>
        /// <param name="BorrowerLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int BorrowerUpdateJust(int BorrowerID, string BorrowerName, string BorrowerEMail, DateTime? BorrowerDOB, int RoleID)
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
                    command.CommandText = "BorrowerUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BorrowerName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BorrowerEmail";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerEMail;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BorrowerDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    // if the value of the DOB is null, special processing must occur
                    if (BorrowerDOB.HasValue)
                    {
                        p.Value = BorrowerDOB;
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
                    p.ParameterName = "@RoleID";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = RoleID;
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
        /// <param name="BorrowerID"></param>
        /// <param name="BorrowerName"></param>
        /// <param name="BorrowerDOB"></param>
        /// <param name="BorrowerLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int BorrowerUpdateSafe(int BorrowerID,
            string oldBorrowerName,
            string oldBorrowerEMail,
                   DateTime? oldBorrowerDOB, int oldRoleID,
            string newBorrowerName,
            string newBorrowerEMail,
                   DateTime? newBorrowerDOB, int newRoleID)
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
                    command.CommandText = "BorrowerUpdateSafe";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldBorrowerName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldBorrowerName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@OldBorrowerEmail";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldBorrowerEMail;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldBorrowerDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    // if the value of the DOB is null, special processing must occur
                    if (oldBorrowerDOB.HasValue)
                    {
                        p.Value = oldBorrowerDOB;
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
                    p.ParameterName = "@oldRoleID";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldRoleID;
                    command.Parameters.Add(p);


                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newBorrowerName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newBorrowerName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@NewBorrowerEmail";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newBorrowerEMail;
                    command.Parameters.Add(p);
                    p = command.CreateParameter();
                    p.ParameterName = "@newBorrowerDOB";
                    p.DbType = DbType.DateTime;
                    p.Direction = ParameterDirection.Input;
                    // if the value of the DOB is null, special processing must occur
                    if (newBorrowerDOB.HasValue)
                    {
                        p.Value = newBorrowerDOB;
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
                    p.ParameterName = "@newRoleID";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newRoleID;
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

    public class BorrowerSecuredMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public BorrowerSecuredMapper(IDataReader reader)
            : base(reader, "BorrowerID", "BorrowerName", "BorrowerEMail", "BorrowerDOB", "RoleID", "RoleName","SecuredHash","SecuredSalt")

        {

        }

        public BorrowerSecured ToBorrowerSecured(IDataReader reader)
        {
            // rolename is read only so it must be constructed
            BorrowerSecured rv = new BorrowerSecured(reader.GetString(5));
            // the values of the GetXXX have been validated by the constructor
            // the GetNullableXXX are EXTENSION methods.  Look in class 
            // readerHelper.  these functions 'appear' in reader when the
            // readerHelper is in scope.  dot into reader and see the icon
            // in front of the GetNullableXXX methods.  This is the indicator
            // that the methods come from somewhere else.
            rv.BorrowerID = reader.GetInt32(0);
            rv.BorrowerName = reader.GetNullableString(1);
            rv.BorrowerEMail = reader.GetNullableString(2);
            rv.BorrowerDOB = reader.GetNullableDateTime(3);
           
            rv.RoleID = reader.GetInt32(4);
           
            rv.Hash = reader.GetNullableString(6);
            rv.Salt = reader.GetNullableString(7);
            return rv;
        }

    }

    public class BorrowerSecuredDAL : DALBase
    {
        /// <summary>
        /// constructs a data access layer object granting access to the stored procedures relating to an Borrower
        /// </summary>
        /// <param name="connection">a connection to the database</param>
        public BorrowerSecuredDAL(IDbConnection connection)
        {
            _connection = connection;
        }

        public BorrowerSecured BorrowerSecuredFindByID(int BorrowerID)
        {
            BorrowerSecured rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerSecuredFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerID;
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
                        BorrowerSecuredMapper mapper = new BorrowerSecuredMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBorrowerSecured(reader);
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
                            throw new Exception("Multiple reccords found with id: {BorrowerID}");
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

        public BorrowerSecured BorrowerSecuredFindByName(string Name)
        {
            BorrowerSecured rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerSecuredFindByName";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Name;
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
                        BorrowerSecuredMapper mapper = new BorrowerSecuredMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBorrowerSecured(reader);
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
                            throw new Exception("Multiple reccords found with id: {BorrowerID}");
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

        public BorrowerSecured BorrowerSecuredFindByEMail(string EMail)
        {
            BorrowerSecured rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BorrowerSecuredFindByEmail";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerEmail";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = EMail;
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
                        BorrowerSecuredMapper mapper = new BorrowerSecuredMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBorrowerSecured(reader);
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
                            throw new Exception("Multiple reccords found with id: {BorrowerID}");
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

        public int BorrowerSecuredUpdateJust(int BorrowerID, string Hash, string Salt)
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
                    command.CommandText = "BorrowerSecuredUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowerID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Hash";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Hash;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Salt";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Salt;
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
