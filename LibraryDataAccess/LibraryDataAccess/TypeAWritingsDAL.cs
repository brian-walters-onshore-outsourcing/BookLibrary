﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LibraryCommon;
using System.Data;
using Logging;

namespace LibraryDataAccess
{
    public class TypeAWritingMapper : MapperBase
    {


        // this constructer will validate that the column offsets 
        // are indeed in the expected order;
        public TypeAWritingMapper(IDataReader reader)
            : base(reader, "BookID", "AuthorID")

                  

        {

        }

        public TypeAWriting ToWriting(IDataReader reader)
        {
            TypeAWriting rv = new TypeAWriting();
            // the values of the GetXXX have been validated by the constructor
            rv.BookID = reader.GetInt32(0);
            rv.AuthorID = reader.GetInt32(1);
            


            return rv;
        }

    }
    public class TypeAWritingDAL : DALBase
    {
       
        /// <summary>
        /// this method loads the associated book and author into the 
        /// junction class writing
        /// if the item is already loaded, it does not load it a second time
        /// </summary>
        /// <param name="writing"></param>
        public void LoadWritingItems(TypeAWriting writing)
        {
            if (null != writing)
            {
                if (null == writing.theAuthor)
                {
                    AuthorDAL authordal = new AuthorDAL(_connection);
                    writing.theAuthor = authordal.AuthorFindByID(writing.AuthorID);
                }
                if (null == writing.theBook)
                {
                    BookDAL bookdal = new BookDAL(_connection);
                    writing.theBook = bookdal.BookFindByID(writing.BookID);
                }

            }
        }
        public TypeAWritingDAL(IDbConnection connection)
        {
            _connection = connection;
        }
        public int TypeAWritingsObtainCount()
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "obtainTypeAWritingsCount";
                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        public int TypeAAuthorsRelatedToBookObtainCount(int BookID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "ObtainTypeAauthorsRelatedToBookCount";
                    IDbDataParameter p = command.CreateParameter();
                    p.DbType = DbType.Int32;
                    p.ParameterName = "@bookid";
                    p.Value = BookID;
                    p.Direction = ParameterDirection.Input;
                    command.Parameters.Add(p);

                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        public int TypeABooksRelatedToAuthorObtainCount(int AuthorID)
        {
            int rv = 0;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "[dbo].[ObtainTypeAbooksRelatedToAuthorCount]";
                    IDbDataParameter p = command.CreateParameter();
                    p.DbType = DbType.Int32;
                    p.ParameterName = "@authorid";
                    p.Value = AuthorID;
                    p.Direction = ParameterDirection.Input;
                    command.Parameters.Add(p);

                    rv = Convert.ToInt32(command.ExecuteScalar());



                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }
        public TypeAWriting TypeAWritingFindByID(int authorID, int bookID)
        {
            TypeAWriting rv = null;
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeAWritingFindByID";
                    IDbDataParameter p = command.CreateParameter();
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.ParameterName = "@authorID";
                    p.Value = authorID;
                    command.Parameters.Add(p);

                    p = command.CreateParameter();
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.ParameterName = "@bookID";
                    p.Value = bookID;
                    command.Parameters.Add(p);

                    using (IDataReader reader = command.ExecuteReader())
                    {

                        int count = 0;
                        TypeAWritingMapper m = new TypeAWritingMapper(reader);
                        while (reader.Read())
                        {
                            rv = m.ToWriting(reader);
                            count++;
                        }
                        if (count > 1)
                        {
                            throw new Exception($"Multiple reccords found with id: author: {authorID}  book:{bookID}");

                        }

                    }

                }
                // the integer ids for book and author are now loaded from SQL
                // this procedure now loads the book and author data from
                // SQL
                LoadWritingItems(rv);
                
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        public List<TypeAWriting> TypeAWritingsGetAll(int Skip = 0, int Take = 0)
        {
            List<TypeAWriting> rv = new List<TypeAWriting>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeAWritingsGetAll";

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
                        TypeAWritingMapper mapper = new TypeAWritingMapper(reader);

                        while (reader.Read())
                        {
                            TypeAWriting a = mapper.ToWriting(reader);
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
                foreach (TypeAWriting writing in rv)
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
                    
                    LoadWritingItems(writing);
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return rv;
        }

        public void TypeAWritingCreate(int authorID, int bookID)
        {
         
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeAWritingCreate";

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
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
           
        }

        public void TypeAWritingDelete(int authorID,int bookID)
        {
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeAWritingDelete";

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
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
        }

    // TypeA Junction table does not have updates.  to update
    // delete and re add

        public List<TypeAWriting> TypeAWritingGetBooksRelatedToAuthorID(int authorID, int Skip, int Take)
        {
            List<TypeAWriting> actualrv = new List<TypeAWriting>();
            List<Book> rv = new List<Book>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeAbooksGetRelatedToAuthorID";

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
                    p.ParameterName = "@authorID";
                    p.DbType = DbType.Int32;
                    p.Direction = ParameterDirection.Input;
                    p.Value = authorID;
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
                AuthorDAL authordal = new AuthorDAL(_connection);
                Author author = authordal.AuthorFindByID(authorID);
                if (null == author)
                {
                    throw new Exception($"cant find author with id of {authorID}");
                }
                foreach (Book b in rv)
                {
                    TypeAWriting writing = new TypeAWriting();
                    writing.AuthorID = author.AuthorID;
                    writing.theAuthor = author;
                    writing.BookID = b.BookID;
                    writing.theBook = b;
                    actualrv.Add(writing);
                }

            }
            catch (Exception ex) when (Logger.Log(ex,"DAL"))
            {

            }
            return actualrv;
        }

        public List<TypeAWriting> TypeAWritingGetAuthorsRelatedToBookID(int bookID, int Skip, int Take)
        {
            List<TypeAWriting> actualrv = new List<TypeAWriting>();
            List<Author> rv = new List<Author>();
            try
            {
                EnsureConnected();
                using (IDbCommand command = _connection.CreateCommand())
                {
                    // configure the command object
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "TypeAauthorsGetRelatedToBookID";

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
                    }
                }
                BookDAL bookdal = new BookDAL(_connection);
                Book book = bookdal.BookFindByID(bookID);
                if (null == book)
                {
                    throw new Exception($"cant find book with id of {bookID}");
                }
                foreach (Author a in rv)
                {
                    TypeAWriting writing = new TypeAWriting();
                    writing.BookID = book.BookID;
                    writing.theBook = book;
                    writing.AuthorID = a.AuthorID;
                    writing.theAuthor = a;
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
