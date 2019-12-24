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
    public class TypeDRatedBorrowingMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public TypeDRatedBorrowingMapper(IDataReader reader)
            : base(reader, "ratedBorrowingID", "BookID", "BorrowerID","DueDate","ReturnedDate","Rating",
                  "isbn","Bookname","pages","price","genreid","genrename",
                  "borrowername", "borroweremail","borrowerDOB", "roleid","rolename")



        {

        }

        public TypeDRatedBorrowing ToBorrowing(IDataReader reader)
        {
            TypeDRatedBorrowing rv = new TypeDRatedBorrowing();
            // the values of the GetXXX have been validated by the constructor
            rv.BorrowingID = reader.GetInt32(0);
            rv.BookID = reader.GetInt32(1);
            rv.BorrowerID = reader.GetInt32(2);
            if (reader.IsDBNull(3))
            {
                rv.DueDate = null;
            }
            else
            {
                rv.DueDate = reader.GetDateTime(3);
            }
            if (reader.IsDBNull(4))
            {
                rv.ReturnedDate = null;
            }
            else
            {
                rv.ReturnedDate = reader.GetDateTime(4);
            }
            if (reader.IsDBNull(5))
            {
                rv.Rating = 0;
            }
            else
            {
                rv.Rating = reader.GetDecimal(5);
            }
            if (reader.IsDBNull(6))
            {
                rv.ISBN = "";
            }
            else
            {
                rv.ISBN = reader.GetString(6);
            }
            if (reader.IsDBNull(7))
            {
                rv.BookName = "";
            }
            else
            {
                rv.BookName = reader.GetString(7);
            }
            if (reader.IsDBNull(8))
            {
                rv.Pages = 0;
            }
            else
            {
                rv.Pages = reader.GetInt32(8);
            }
            if (reader.IsDBNull(9))
            {
                rv.Price = 0M;
            }
            else
            {
                rv.Price = reader.GetDecimal(9);
            }
           
                rv.GenreID = reader.GetInt32(10);
            if (reader.IsDBNull(11))
            {
                rv.GenreName = "";
            }
            else
            {
                rv.GenreName = reader.GetString(11);
            }
            if (reader.IsDBNull(12))
            {
                rv.BorrowerName = "";
            }
            else
            {
                rv.BorrowerName = reader.GetString(12);
            }
            if (reader.IsDBNull(13))
            {
                rv.BorrowerEMail = "";
            }
            else
            {
                rv.BorrowerEMail = reader.GetString(13);
            }
            if (reader.IsDBNull(14))
            {
                rv.BorrowerDOB = null;
            }
            else
            {
                rv.BorrowerDOB = reader.GetDateTime(14);
            }
            
                rv.RoleID = reader.GetInt32(15);

            if (reader.IsDBNull(16))
            {
                rv.RoleName = "";
            }
            else
            {
                rv.RoleName = reader.GetString(16);
            }












            return rv;
        }

    }
    public class TypeDRatedBorrowingDAL : DALBase
    {

        /// <summary>
        /// this method loads the associated book and author into the 
        /// junction class writing
        /// if the item is already loaded, it does not load it a second time
        /// </summary>
        /// <param name="writing"></param>
        //public void LoadBorrowingItems(TypeDRatedBorrowing writing)
        //{
        //    if (null != writing)
        //    {
        //        if (null == writing.theBorrower)
        //        {
        //            BorrowerDAL dal = new BorrowerDAL(_connection);
        //            writing.theBorrower = dal.BorrowerFindByID(writing.BorrowerID);
        //        }
        //        if (null == writing.theBook)
        //        {
        //            BookDAL bookdal = new BookDAL(_connection);
        //            writing.theBook = bookdal.BookFindByID(writing.BookID);
        //        }

        //    }
        //}
        public TypeDRatedBorrowingDAL(IDbConnection connection)
        {
            _connection = connection;
        }
        public TypeDRatedBorrowing TypeDRatedBorrowingFindByID(int BorrowingID)
        {
            TypeDRatedBorrowing rv = null;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDRatedBorrowingFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.ParameterName = "@BorrowingID";
                    p.Value = BorrowingID;
                    command.Parameters.Add(p);



                    using (IDataReader reader = command.ExecuteReader())
                    {

                        int count = 0;
                        TypeDRatedBorrowingMapper m = new TypeDRatedBorrowingMapper(reader);
                        while (reader.Read())
                        {
                            rv = m.ToBorrowing(reader);
                            count++;
                        }
                        if (count > 1)
                        {
                            throw new Exception($"Multiple reccords found with id: {BorrowingID}");

                        }

                    }

                }
                

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        public List<TypeDRatedBorrowing> TypeDRatedBorrowingsGetAll(int Skip = 0, int Take = 0)
        {
            List<TypeDRatedBorrowing> rv = new List<TypeDRatedBorrowing>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDRatedBorrowingsGetAll";

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
                        TypeDRatedBorrowingMapper mapper = new TypeDRatedBorrowingMapper(reader);

                        while (reader.Read())
                        {
                            TypeDRatedBorrowing a = mapper.ToBorrowing(reader);
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
                    }
                }
                foreach (TypeDRatedBorrowing writing in rv)
                {
                    // the integer ids for book and author are already loaded from SQL
                    // this procedure now loads the book and author data from
                    // SQL
                    // this part of this method can be optimized
                    // it currently is making several round trips to the server

                    // optimization could be achieved by recreating the
                    // stored procedure to return multiple record sets
                    // and refactor this routine to read all the record sets

                    // I envision that the stored procedure would return all
                    // the junction items in the first set, then all the 
                    // matching authors in the second set, then all the 
                    // matching books.  

                    // processing would involve calling reader.read until 
                    // it fails
                    // then call reader.nextresult to get the next result set
                    // (the authors)  then call reader.nextresult to get
                    // the books

                    // the advantage of this is that it could be done in a single round trip to the server

                    // i leave this refactoring as an exercise for a future 
                    // developer

                   
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        public int TypeDRatedBorrowingCreate(int BookID, int BorrowerID,
            DateTime? DueDate, DateTime? ReturnedDate, Decimal? Rating)
        {
            int rv = -1;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDRatedBorrowingCreate";



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
                    p.ParameterName = "@BookID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BookID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@DueDate";
                    p.DbType = DbType.DateTime2;
                    p.Direction = ParameterDirection.Input;
                    if (DueDate.HasValue)
                    {
                        p.Value = DueDate;
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
                    p.ParameterName = "@ReturnedDate";
                    p.DbType = DbType.DateTime2;
                    p.Direction = ParameterDirection.Input;
                    if (ReturnedDate.HasValue)
                    {
                        p.Value = ReturnedDate;
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
                    p.ParameterName = "@Rating";
                    p.DbType = DbType.Decimal;
                    p.Direction = ParameterDirection.Input;
                    if (Rating.HasValue)
                    {
                        p.Value = Rating;
                    }
                    else
                    {
                        p.Value = DBNull.Value;
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

            }
            return rv;
        }

        public int TypeDRatedBorrowingDelete(int BorrowingID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDRatedBorrowingDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@ratedBorrowingID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowingID;
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

            }
            return rv;
        }

        public int TypeDRatedBorrowingUpdateJust(int BorrowingID, int BorrowerID, int bookID, DateTime? DueDate, DateTime? ReturnedDate, decimal? Rating)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDRatedBorrowingUpdateJust";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@RatedBorrowingID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowingID;
                    command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
 
                    
                    // borrowerID is not updatable
                    //p = command.CreateParameter();
                    //p.ParameterName = "@BorrowerID";
                    //p.DbType = DbType.Int32;
                    //p.Direction = ParameterDirection.Input;
                    //p.Value = BorrowerID;

                    //command.Parameters.Add(p);
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter

                    // bookid is not updatable
                    //p = command.CreateParameter();
                    //p.ParameterName = "@BookID";
                    //p.DbType = DbType.Int32;
                    //p.Direction = ParameterDirection.Input;
                    //p.Value = bookID;

                    //command.Parameters.Add(p);

                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@DueDate";
                    p.DbType = DbType.DateTime2;
                    p.Direction = ParameterDirection.Input;
                    if (DueDate.HasValue)
                    {
                        p.Value = DueDate;
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
                    p.ParameterName = "@ReturnedDate";
                    p.DbType = DbType.DateTime2;
                    p.Direction = ParameterDirection.Input;
                    if (ReturnedDate.HasValue)
                    {
                        p.Value = ReturnedDate;
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
                    p.ParameterName = "@Rating";
                    p.DbType = DbType.Decimal;
                    p.Direction = ParameterDirection.Input;
                    if (Rating.HasValue)
                    {
                        p.Value = Rating;
                    }
                    else
                    {
                        p.Value = DBNull.Value;
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

            }
            return rv;

        }


        public List<TypeDRatedBorrowing> TypeDRatedBorrowingGetBooksRelatedToBorrowerID(int borrowerID, int Skip, int Take)
        {
            List<TypeDRatedBorrowing> actualrv = new List<TypeDRatedBorrowing>();
        //    List<Book> rv = new List<Book>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDbooksGetRelatedToBorrowerID";

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
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@borrowerID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = borrowerID;
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
                        TypeDRatedBorrowingMapper mapper = new TypeDRatedBorrowingMapper(reader);

                        while (reader.Read())
                        {
                            TypeDRatedBorrowing a = mapper.ToBorrowing(reader);
                            // the mapper uses the much more efficient getXXX 
                            // methods internally to avoid boxing and 
                            // string manipulation.  this more efficient code is 
                            // inside the loop
                            if (a != null)
                            // if the mapper returns null for some reason it will
                            // be ignored
                            {
                                actualrv.Add(a);
                            }

                        }
                    }
                }
               


                //foreach (var b in actualrv)
                //{
                    
                   
                //    b.theBorrower = borrower;
                //    b.BookID = b.BookID;
                //    borrowing.theBook = b;
                //   // actualrv.Add(borrowing);
                //}

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return actualrv;
        }

        public List<TypeDRatedBorrowing> TypeDRatedBorrowingGetBorrowersRelatedToBookID(int bookID, int Skip, int Take)
        {
            List<TypeDRatedBorrowing> actualrv = new List<TypeDRatedBorrowing>();
          //  List<Borrower> rv = new List<Borrower>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeDRatedBorrowingsGetRelatedToBookID";

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
                    // since p has been added to the parameters collection
                    // it is safe to reuse the same variable 
                    // for a new parameter
                    p = command.CreateParameter();
                    p.ParameterName = "@BookID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = bookID;
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
                        TypeDRatedBorrowingMapper mapper = new TypeDRatedBorrowingMapper(reader);

                        while (reader.Read())
                        {
                            TypeDRatedBorrowing a = mapper.ToBorrowing(reader);
                            // the mapper uses the much more efficient getXXX 
                            // methods internally to avoid boxing and 
                            // string manipulation.  this more efficient code is 
                            // inside the loop
                            if (a != null)
                            // if the mapper returns null for some reason it will
                            // be ignored
                            {
                                actualrv.Add(a);
                            }

                        }
                    }
                }
                //BookDAL bookdal = new BookDAL(_connection);
                //Book book = bookdal.BookFindByID(bookID);
                //if (null == book)
                //{
                //    throw new Exception($"cant find book with id of {bookID}");
                //}
                //foreach (Borrower a in rv)
                //{
                //    TypeDRatedBorrowing writing = new TypeDRatedBorrowing();
                //    writing.BookID = book.BookID;
                //    writing.theBook = book;
                //    writing.BorrowerID = a.BorrowerID;
                //    writing.theBorrower = a;
                //    actualrv.Add(writing);
                //}

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return actualrv;
        }

    }
}
