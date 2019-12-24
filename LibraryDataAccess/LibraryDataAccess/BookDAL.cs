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
    public class BookMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public BookMapper(IDataReader reader)
            : base(reader, "BookID", "ISBN","BookName", "Pages","Price", "GenreID", "GenreName","CheckOuts","DaysOverDue","AvgRating")

        {

        }

        public Book ToBook(IDataReader reader)
        {
            Book rv = new Book();
            // the values of the GetXXX have been validated by the constructor
            rv.BookID = reader.GetInt32(0);

           // the GetNullableXXX methods come from readerhelper.cs
            rv.ISBN = reader.GetNullableString(1);
            rv.BookName = reader.GetNullableString(2);  
            rv.Pages = reader.GetNullableInt32(3); 
            rv.Price = reader.GetNullableDecimal(4);
            rv.GenreID = reader.GetInt32(5);
            rv.GenreName = reader.GetString(6);
            rv.CheckOuts = reader.GetNullableInt32(7);
            rv.DaysOverdue = reader.GetNullableInt32(8);
            rv.AvgRating = reader.GetNullableDecimal(9);
           
            return rv;
        }

    }

    public class BookDAL : DALBase
    {

        /// <summary>
        /// constructs a data access layer object granting access to the stored procedures relating to an Book
        /// </summary>
        /// <param name="connection">a connection to the database</param>
        public BookDAL(IDbConnection connection)
        {
            _connection = connection;
        }

        public int BooksObtainCount()
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "obtainBooksCount";
                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }



        /// <summary>
        /// locates an Book record by its primary id
        /// </summary>
        /// <param name="BookID">the primary key to the record to return</param>
        /// <returns>an Book record</returns>
        public Book BookFindByID(int BookID)
        {
            Book rv = null;
            // a default return value
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BookFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BookID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookID;
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
                        BookMapper mapper = new BookMapper(reader);
                        int count = 0;
                        while (reader.Read())
                        {
                            rv = mapper.ToBook(reader);
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
                            throw new Exception("Multiple reccords found with id: {BookID}");
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
        /// returns a list of Books, optionally skipping several for paging
        /// purposes and only returning the amount in the page
        /// </summary>
        /// <param name="Skip">the number of records to ignore</param>
        /// <param name="Take">the number of records to return</param>
        /// <returns></returns>
        public List<Book> BooksGetAll(int Skip = 0, int Take = 0)
        {
            List<Book> rv = new List<Book>();
            // a default return value is an empty list
            try
            {


                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BooksGetAll";

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
                        BookMapper mapper = new BookMapper(reader);

                        while (reader.Read())
                        {
                            Book a = mapper.ToBook(reader);
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
        /// creates a new Book record and then returns the id to that record
        /// </summary>
        /// <param name="BookName"></param>
        /// <param name="BookDOB"></param>
        /// <param name="BookLocation"></param>
        /// <returns>the id to the newly created record</returns>
        public int BookCreate(string ISBN,
            string BookName,
            int Pages,
            decimal Price,
            int GenreID)
            // GenreName is not part of the books table
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
                    command.CommandText = "BookCreate";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BookName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@ISBN";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    if (string.IsNullOrWhiteSpace(ISBN))
                    {
                        p.Value = DBNull.Value;
                    }
                    else
                    {
                        p.Value = ISBN;
                    }

                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Pages";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    
                    p.Value = Pages;
                    
                    command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Price";
                    p.DbType = DbType.Decimal;
                    p.Precision = 18;
                    p.Scale = 2;
                    p.Direction = ParameterDirection.Input;

                    p.Value = Price;

                    command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@GenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreID;
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
        /// <param name="BookID"></param>
        public void BookDelete(int BookID)
        {
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "BookDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BookID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookID;
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
        /// <param name="BookID"></param>
        /// <param name="BookName"></param>
        /// <param name="BookDOB"></param>
        /// <param name="BookLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
        public int BookUpdateJust(int BookID, string ISBN, string BookName, int Pages, decimal Price, int GenreID)
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
                    command.CommandText = "BookUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BookID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@ISBN";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    if (string.IsNullOrWhiteSpace(ISBN))
                    {
                        p.Value = DBNull.Value;
                    }
                    else
                    {
                        p.Value = ISBN;
                    }

                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BookName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookName;
                    command.Parameters.Add(p);

                    
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Pages";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = Pages;
                    
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Price";
                    p.DbType = DbType.Decimal;
                    p.Precision = 18;
                    p.Scale = 2;
                    p.Direction = ParameterDirection.Input;

                    p.Value = Price;

                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@GenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = GenreID;
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

        // BookGetSortedAndFilteredcount is used by advanced ajax portion of the
        // datatables example.  It is used to get the 'filtered' count for displaying
        // on the datatables form
        public int BookGetSortedAndFilteredCount(string sortColumn, string sortColumnDir, string searchValue)
        {
            try
            {
                string direction;
                string orderby;
                string where;
                bool wherethere = false;
                // check the sort column to verify it is a valid column
                // this is to avoid SQL injection
                switch (sortColumn.ToLower())
                {
                    case ("bookid"): orderby = "bookid"; break;
                    case ("isbn"): orderby = "ISBN"; break;
                    case ("bookname"): orderby = "bookname"; break;
                    case ("pages"): orderby = "pages"; break;
                    case ("daysoverdue"): orderby = "daysoverdue"; break;
                    case ("genrename"): orderby = "genrename"; break;
                    default: orderby = "bookname"; break;
                }

                if (string.IsNullOrWhiteSpace(searchValue))
                {
                    where = "";
                    wherethere = false;
                }
                else
                {
                    // where clause is not subject to SQL injection because the
                    // columns are compared to an @variable
                    // which will be loaded if wherethere is true
                    // wheredata is loaded from searchvalue
                    where = $" where ISBN like @wheredata or Bookname like @wheredata or GenreName like @wheredata ";
                    wherethere = true;
                }
                // check direction to make sure it is valid
                // this is to avoid sql injection
                switch (sortColumnDir.ToLower())
                {
                    case ("asc"): direction = " ASC"; break;
                    default: direction = " DESC"; break;
                }
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // use text to create dynamic query
                    command.CommandType = CommandType.Text;
                    command.CommandText = "select count(*) from books " +
                    //from inner query
                    //first left outer join bringing over the genrename or NULL if no match
                    "left outer join genres " +
                    "on books.genreid = genres.genreid " +
                       //-- second left outer join bringing over the checkout data etc.

                       " left outer join " +
//-- inner query follows
"(select bookid as bkid, " +
     " count(*) as checkouts," +
    "  sum(DATEDIFF(day, DueDate, GetDate())) as daysoverdue, " +
    "  avg(Rating) AvgRating " +

    "  from TypeDRatedBorrowings " +
    " where ReturnedDate is null " +
    "  group by bookid) as x " +
                      //--end of inner query(still need the on clause for the previous left outer join)
                      "  on bkid = bookid " +
                       //  -- the first two joins are now joined to the third one also on the bookid
                       // this is the where clause, it may not be present
                       // and then the parameter will not be added either
                       where;

                   if (wherethere)
                    {
                        IDbDataParameter p = command.CreateParameter();
                        p.ParameterName = "@wheredata";
                        p.DbType = DbType.String;
                        p.Direction = ParameterDirection.Input;
                        p.Value = searchValue;
                        command.Parameters.Add(p);
                    }
                    // load the data from the database
                    object rv = command.ExecuteScalar();
                    return Convert.ToInt32(rv);



                }
            }
            catch (Exception ex) when (Logger.Log(ex, "DAL"))
            {

            }
            return 0;
        }


        // BookGetSortedAndFiltered is used by advanced ajax portion of the
        // datatables example.  It is used to get the 'filtered' data for displaying
        // on the datatables form
        public List<Book> BookGetSortedAndFiltered(string sortColumn, string sortColumnDir, string searchValue, int skip, int take)
        {
            List<Book> rv = new List<Book>();
            try
            {
                string direction;
                string orderby;
                string where;
                bool wherethere = false;
                // check the sort column to verify it is a valid column
                // this is to avoid SQL injection
                switch(sortColumn.ToLower())
                {
                    case ("bookid"): orderby = "bookid"; break;
                    case ("isbn"):    orderby = "ISBN"; break;
                    case ("bookname"): orderby = "bookname"; break;
                    case ("pages"):     orderby = "pages"; break;
                    case ("daysoverdue"): orderby = "daysoverdue"; break;
                    case ("genrename"): orderby = "genrename"; break;
                    default: orderby = "bookname"; break;
                }

                if (string.IsNullOrWhiteSpace(searchValue))
                {
                    where = "";
                    wherethere = false;
                }
                else
                {
                    // where clause is not subject to SQL injection because the
                    // columns are compared to an @variable
                    // which will be loaded if wherethere is true
                    // wheredata is loaded from searchvalue
                    where = $" where ISBN like @wheredata or Bookname like @wheredata or GenreName like @wheredata ";
                    wherethere = true;
                }
                // check direction to make sure it is valid
                // this is to avoid sql injection
                switch(sortColumnDir.ToLower())
                {
                    case ("asc"): direction = " ASC"; break;
                    default: direction = " DESC"; break;
                }
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // use text to create dynamic query
                    command.CommandType = CommandType.Text;
                    command.CommandText = "select " + "bookid,isbn,bookname,pages,price,books.genreid," +
                    // from Books
                    "genrename," +
                    // from genres
                    "checkouts, daysoverdue, avgrating from books " +
                    //from inner query
                    //first left outer join bringing over the genrename or NULL if no match
                    "left outer join genres " +
                    "on books.genreid = genres.genreid " +
                       //-- second left outer join bringing over the checkout data etc.

                       " left outer join " +
//-- inner query follows
"(select bookid as bkid, " +
     " count(*) as checkouts," +
    "  sum(DATEDIFF(day, DueDate, GetDate())) as daysoverdue, " +
    "  avg(Rating) AvgRating " +

    "  from TypeDRatedBorrowings " +
    " where ReturnedDate is null " +
    "  group by bookid) as x " +
                      //--end of inner query(still need the on clause for the previous left outer join)
                      "  on bkid = bookid " +
                       //  -- the first two joins are now joined to the third one also on the bookid
                       // this is the where clause, it may not be present
                       // and then the parameter will not be added either
                       where +
                       " order by " + orderby + direction +
                       " offset @Skip rows fetch next @Take rows only";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@Skip";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = skip;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@Take";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = take;
                    command.Parameters.Add(p);
                    if (wherethere)
                    {
                        p = command.CreateParameter();
                        p.ParameterName = "@wheredata";
                        p.DbType = DbType.String;
                        p.Direction = ParameterDirection.Input;
                        p.Value = searchValue;
                        command.Parameters.Add(p);
                    }
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
                        BookMapper mapper = new BookMapper(reader);

                        while (reader.Read())
                        {
                            Book a = mapper.ToBook(reader);
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
            catch(Exception ex) when (Logger.Log(ex,"DAL"))
            {

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
        /// <param name="BookID"></param>
        /// <param name="BookName"></param>
        /// <param name="BookDOB"></param>
        /// <param name="BookLocation"></param>
        /// <returns>the number of records updated (should be 1)</returns>
            public int BookUpdateSafe(int BookID,
            string oldISBN,
            string oldBookName,
                   int oldPages, decimal oldPrice, int oldGenreID,
            string newISBN,
            string newBookName,
                   int newPages, decimal newPrice, int newGenreID)
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
                    command.CommandText = "BookUpdateSafe";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BookID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldISBN";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    if (string.IsNullOrWhiteSpace(oldISBN))
                    {
                        p.Value = DBNull.Value;
                    }
                    else
                    {
                        p.Value = oldISBN;
                    }

                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldBookName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldBookName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldPages";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldPages;
                    
                    command.Parameters.Add(p);


                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldPrice";
                    p.DbType = DbType.Decimal;
                    p.Precision = 18;
                    p.Scale = 2;
                    p.Direction = ParameterDirection.Input;

                    p.Value = oldPrice;

                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@oldGenreID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = oldGenreID;
                    command.Parameters.Add(p);

           
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newISBN";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    if (string.IsNullOrWhiteSpace(newISBN))
                    {
                        p.Value = DBNull.Value;
                    }
                    else
                    {
                        p.Value = newISBN;
                    }
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newBookName";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newBookName;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newPages";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newPages;
                    
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@NewPrice";
                    p.DbType = DbType.Decimal;
                    p.Precision = 18;
                    p.Scale = 2;
                    p.Direction = ParameterDirection.Input;

                    p.Value = newPrice;

                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@newGenreID";
                    p.DbType = DbType.String;
                    p.Direction = ParameterDirection.Input;
                    p.Value = newGenreID;
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
