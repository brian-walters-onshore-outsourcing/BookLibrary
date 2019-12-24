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
    public class TypeCBorrowingMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public TypeCBorrowingMapper(IDataReader reader)
            : base(reader, "BorrowingID","BookID", "BorrowerID")



        {

        }

        public TypeCBorrowing ToBorrowing(IDataReader reader)
        {
            TypeCBorrowing rv = new TypeCBorrowing();
            // the values of the GetXXX have been validated by the constructor
            rv.BorrowingID = reader.GetInt32(0);
            rv.BookID = reader.GetInt32(1);
            rv.BorrowerID = reader.GetInt32(2);



            return rv;
        }

    }
    public class TypeCBorrowingDAL : DALBase
    {

        /// <summary>
        /// this method loads the associated book and author into the 
        /// junction class writing
        /// if the item is already loaded, it does not load it a second time
        /// </summary>
        /// <param name="writing"></param>
        public void LoadBorrowingItems(TypeCBorrowing writing)
        {
            if (null != writing)
            {
                if (null == writing.theBorrower)
                {
                    BorrowerDAL dal = new BorrowerDAL(_connection);
                    writing.theBorrower = dal.BorrowerFindByID(writing.BorrowerID);
                }
                if (null == writing.theBook)
                {
                    BookDAL bookdal = new BookDAL(_connection);
                    writing.theBook = bookdal.BookFindByID(writing.BookID);
                }

            }
        }
        public TypeCBorrowingDAL(IDbConnection connection)
        {
            _connection = connection;
        }
        public TypeCBorrowing TypeCBorrowingFindByID(int BorrowingID)
        {
            TypeCBorrowing rv = null;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeCBorrowingFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.ParameterName = "@BorrowingID";
                    p.Value = BorrowingID;
                    command.Parameters.Add(p);

 

                    using (IDataReader reader = command.ExecuteReader())
                    {

                        int count = 0;
                        TypeCBorrowingMapper m = new TypeCBorrowingMapper(reader);
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
                // the integer ids for book and author are now loaded from SQL
                // this procedure now loads the book and author data from
                // SQL
                LoadBorrowingItems(rv);

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        public List<TypeCBorrowing> TypeCBorrowingsGetAll(int Skip = 0, int Take = 0)
        {
            List<TypeCBorrowing> rv = new List<TypeCBorrowing>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeCBorrowingsGetAll";

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
                        TypeCBorrowingMapper mapper = new TypeCBorrowingMapper(reader);

                        while (reader.Read())
                        {
                            TypeCBorrowing a = mapper.ToBorrowing(reader);
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
                foreach (TypeCBorrowing writing in rv)
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

                    LoadBorrowingItems(writing);
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        public int TypeCBorrowingCreate(int authorID, int bookID)
        {
            int rv = -1;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeCBorrowingCreate";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@AuthorID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = authorID;
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

        public int TypeCBorrowingDelete(int BorrowingID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeCBorrowingDelete";

                    IDbDataParameter p = command.CreateParameter();
                    p.ParameterName = "@BorrowingID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = BorrowingID;
                    command.Parameters.Add(p);
 


                    // since this procedure returns a single row with 
                    // a single value in column 1
                    // we can retrieve it much more efficiently using
                    // execute scalar, avoiding all the reader overhead
                   rv = Convert.ToInt32( command.ExecuteScalar());
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        // TypeC Junction table does not have updates.  to update
        // delete and re add

        public List<TypeCBorrowing> TypeCBorrowingGetBooksRelatedToBorrowerID(int borrowerID, int Skip, int Take)
        {
            List<TypeCBorrowing> actualrv = new List<TypeCBorrowing>();
            List<Book> rv = new List<Book>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeCbooksGetRelatedToBorrowerID";

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
                    }
                }
                BorrowerDAL dal = new BorrowerDAL(_connection);
                Borrower borrower = dal.BorrowerFindByID(borrowerID);
                if (null == borrower)
                {
                    throw new Exception($"cant find borrower with id of {borrowerID}");
                }
                foreach (Book b in rv)
                {
                    TypeCBorrowing borrowing = new TypeCBorrowing();
                    borrowing.BorrowerID = borrower.BorrowerID;
                    borrowing.theBorrower = borrower;
                    borrowing.BookID = b.BookID;
                    borrowing.theBook = b;
                    actualrv.Add(borrowing);
                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return actualrv;
        }

        public List<TypeCBorrowing> TypeCBorrowingGetBorrowersRelatedToBookID(int bookID, int Skip, int Take)
        {
            List<TypeCBorrowing> actualrv = new List<TypeCBorrowing>();
            List<Borrower> rv = new List<Borrower>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeCBorrowersGetRelatedToBookID";

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
                    }
                }
                BookDAL bookdal = new BookDAL(_connection);
                Book book = bookdal.BookFindByID(bookID);
                if (null == book)
                {
                    throw new Exception($"cant find book with id of {bookID}");
                }
                foreach (Borrower a in rv)
                {
                    TypeCBorrowing writing = new TypeCBorrowing();
                    writing.BookID = book.BookID;
                    writing.theBook = book;
                    writing.BorrowerID = a.BorrowerID;
                    writing.theBorrower = a;
                    actualrv.Add(writing);
                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return actualrv;
        }

    }
}
