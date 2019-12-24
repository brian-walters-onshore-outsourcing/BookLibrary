using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using LibraryCommon;
using LibraryDataAccess;

namespace LibraryBusinessLogicLayer
{

    // this class represents an easy access to the business logic 
    // from higher levels  its usage pattern is
    // using (Context ctx = new Context())
    // {
    //    ctx.procedurename1(args);
    //    ctx.procedurename2(args);
    // }
    //  
    //    it allows multiple calls to the database without
    //    requiring multiple opens and closes of the connection
    //    for efficient connection usage


    public class Context : IDisposable
    {
        #region Context Overhead
        public bool UsingFallbackConnection { get; set; }
        IDbConnection _connection;

        public Context()
        {
            string fallbackconnectionstring = @"Data Source=.\sqlexpress;Initial Catalog=Library;Integrated Security=True";
            string actual = fallbackconnectionstring;
            var potential =
            System.Configuration.ConfigurationManager.ConnectionStrings["LibraryConnectionString"];
            if (potential == null)
            {
                UsingFallbackConnection = true;
            }
            else
            {
                actual = potential.ConnectionString;
                UsingFallbackConnection = false;
            }
            // the default implementation is using SQL Server
            _connection = new SqlConnection(actual);



        }

        public Context(IDbConnection connection)
        {
            // the caller can use a different connection if desired.
            _connection = connection;
        }

        // this is the implementation of IDisposable
        // we just dispose the connection when we are disposed
        public void Dispose()
        {
            _connection.Dispose();
        }
        #endregion context

        #region Author CRUD
        //this method is provided to allow easy access from MVC without
        // requiring CALLER to unpack the author in the POST portion
        // of the controller method
        //We can unpack it here instead and direct it to the other procedure
        public int AuthorCreate(Author author)
        {
            return AuthorCreate(author.AuthorName, author.AuthorDOB, author.AuthorLocation);
            // this unpacks the Author and calls the method below
        }
        public int AuthorCreate(
            string Name,
            DateTime? DOB,
            string Location)
        {
            AuthorDAL dal = new AuthorDAL(_connection);
            return dal.AuthorCreate(Name, DOB, Location);
        }
        public Author AuthorFindByID(int AuthorID)
        {
            AuthorDAL dal = new AuthorDAL(_connection);
            return dal.AuthorFindByID(AuthorID);
        }
        public List<Author> AuthorGetAll(int skip=0, int take=0)
        {
            AuthorDAL dal = new AuthorDAL(_connection);
            return dal.AuthorsGetAll(skip, take);
        }

        //this method is provided to allow easy access from MVC without
        // requiring CALLER to unpack the author in the POST portion
        // of the controller method
        //We can unpack it here instead and direct it to the other procedure
        // the id is passed in seperatly from MVC
        public int AuthorUpdateJust(int id, Author author)
        {
            return AuthorUpdateJust(id, author.AuthorName, author.AuthorDOB, author.AuthorLocation);
            // this unpacks the Author and calls the method below
        }
        public int AuthorUpdateJust(
            int AuthorID,
            string Name,
            DateTime? DOB,
            string Location)
        {
            AuthorDAL dal = new AuthorDAL(_connection);
            return dal.AuthorUpdateJust(AuthorID, Name, DOB, Location);
        }

        public int AuthorUpdateJust(
            int AuthorID,
            string oldName,
            DateTime? oldDOB,
            string oldLocation,
            string newName,
            DateTime? newDOB,
            string newLocation)
        {
            AuthorDAL dal = new AuthorDAL(_connection);
            return dal.AuthorUpdateSafe(AuthorID, 
                oldName, oldDOB, oldLocation,
                newName, newDOB, newLocation);
        }


        



        public void AuthorDelete(int AuthorID)
        {
            AuthorDAL dal = new AuthorDAL(_connection);
            dal.AuthorDelete(AuthorID);
        }

        #endregion author

        #region Book CRUD

        public int BookGetSortedAndFilteredCount(string sortColumn, string sortColumnDir, string searchValue)
        {
            BookDAL dal = new BookDAL(_connection);
           
            return dal.BookGetSortedAndFilteredCount(sortColumn, sortColumnDir, searchValue);
        }

        public List<Book> BookGetSortedAndFiltered(string sortColumn, string sortColumnDir, string searchValue, int skip=0, int take=0)
        {
            BookDAL dal = new BookDAL(_connection);
            if (0==take)
            {
                take = dal.BooksObtainCount();
            }
            return dal.BookGetSortedAndFiltered(sortColumn, sortColumnDir, searchValue, skip, take);
        }

        public int BookObtainCount()
        {
            BookDAL dal = new BookDAL(_connection);
            return dal.BooksObtainCount();
        }
        public int BookCreate( Book book)
        {
            return BookCreate(book.ISBN,book.BookName, book.Pages, book.Price, book.GenreID);
        }
        public int BookCreate(
             string ISBN,
             string Name,
             int Pages,
             decimal Price,
            int GenreID)
        {
            BookDAL dal = new BookDAL(_connection);
            return dal.BookCreate(ISBN,Name, Pages,Price, GenreID);
        }
        public Book BookFindByID(int BookID)
        {
            BookDAL dal = new BookDAL(_connection);
            return dal.BookFindByID(BookID);
        }
        public List<Book> BookGetAll(int skip=0, int take=0)
        {
            BookDAL dal = new BookDAL(_connection);
            return dal.BooksGetAll(skip, take);
        }

        public int BookUpdateJust(int id,Book book)
        {
            return BookUpdateJust(id, book.ISBN,book.BookName, book.Pages, book.Price, book.GenreID);
        }
        public int BookUpdateJust(
            int BookID,
            string ISBN,
            string Name,
            int Pages,
            decimal Price,
            int GenreID)
        {
            BookDAL dal = new BookDAL(_connection);
            return dal.BookUpdateJust(BookID,ISBN, Name,Pages,Price, GenreID);
        }

        public int BookUpdateSafe(
            int BookID,
            string oldISBN,
            string oldName,
            int oldPages,
            decimal oldPrice,
            int oldGenreID,
            string newISBN,
            string newName,
            int newPages,
            decimal newPrice,
            int newGenreID)
        {
            BookDAL dal = new BookDAL(_connection);
            return dal.BookUpdateSafe(BookID,
                oldISBN,
                oldName, oldPages, oldPrice, oldGenreID,
                newISBN,
                newName, newPages, newPrice, newGenreID);
        }

        public void BookDelete(int BookID)
        {
            BookDAL dal = new BookDAL(_connection);
            dal.BookDelete(BookID);
        }

        #endregion Book

        #region Borrower CRUD
        public int BorrowerCreate(Borrower borrower)
        {
            return BorrowerCreate(borrower.BorrowerName, borrower.BorrowerEMail,
                borrower.BorrowerDOB, borrower.RoleID);
        }
        public int BorrowerCreate(
            string Name,
            string EMail,
            DateTime? DOB,
            int RoleID)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            return dal.BorrowerCreate(Name, EMail,DOB, RoleID);
        }
        public Borrower BorrowerFindByID(int BorrowerID)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            return dal.BorrowerFindByID(BorrowerID);
        }
        public List<Borrower> BorrowerGetAll(int skip=0, int take=0)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            return dal.BorrowersGetAll(skip, take);
        }

        public int BorrowerUpdateJust(int id, Borrower borrower)
        {
            return BorrowerUpdateJust(id, borrower.BorrowerName, borrower.BorrowerEMail, borrower.BorrowerDOB, borrower.RoleID);
        }
        public int BorrowerUpdateJust(
            int BorrowerID,
            string Name,
            string EMail,
            DateTime? DOB,
            int RoleID)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            return dal.BorrowerUpdateJust(BorrowerID, Name,EMail, DOB, RoleID);
        }

        public int BorrowerUpdateSafe(
            int BorrowerID,
            string oldName,
            string oldEMail,
            DateTime? oldDOB,
            int oldRoleID,
            string newName,
            string newEMail,
            DateTime? newDOB,
            int newRoleID)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            return dal.BorrowerUpdateSafe(BorrowerID,
                oldName, oldEMail, oldDOB, oldRoleID,
                newName, newEMail, newDOB, newRoleID);
        }

        public void BorrowerDelete(int BorrowerID)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            dal.BorrowerDelete(BorrowerID);
        }

        #endregion Borrower

        #region BorrowerSecured

        public BorrowerSecured BorrowerSecuredFindByID(int BorrowerID)
        {
            BorrowerSecuredDAL dal = new BorrowerSecuredDAL(_connection);
            return dal.BorrowerSecuredFindByID(BorrowerID);
        }

        public BorrowerSecured BorrowerSecuredFindByName(string Name)
        {
            BorrowerSecuredDAL dal = new BorrowerSecuredDAL(_connection);
            return dal.BorrowerSecuredFindByName(Name);
        }

        public BorrowerSecured BorrowerSecuredFindByEMail(string EMail)
        {
            BorrowerSecuredDAL dal = new BorrowerSecuredDAL(_connection);
            return dal.BorrowerSecuredFindByEMail(EMail);
        }

        public int BorrowereSecuredUpdateJust(int BorrowerID, string Hash, string Salt)
        {
            BorrowerSecuredDAL dal = new BorrowerSecuredDAL(_connection);
            return dal.BorrowerSecuredUpdateJust(BorrowerID,Hash,Salt);
        }


        #endregion BorrowerSecured

        #region Genre CRUD

        public int GenreCreate(Genre genre)
        {
            return GenreCreate(genre.GenreName);
        }
        public int GenreCreate(
            string Name)
        {
            GenreDAL dal = new GenreDAL(_connection);
            return dal.GenreCreate(Name);
        }
        public Genre GenreFindByID(int GenreID)
        {
            GenreDAL dal = new GenreDAL(_connection);
            return dal.GenreFindByID(GenreID);
        }
        public List<Genre> GenreGetAll(int skip=0, int take=0)
        {
            GenreDAL dal = new GenreDAL(_connection);
            return dal.GenresGetAll(skip, take);
        }
        public int GenreUpdateJust(int id, Genre genre)
        {
            return GenreUpdateJust(id, genre.GenreName);
        }
        public int GenreUpdateJust(
            int GenreID,
            string Name)
        {
            GenreDAL dal = new GenreDAL(_connection);
            return dal.GenreUpdateJust(GenreID, Name);
        }

        public int GenreUpdateSafe(
            int GenreID,
            string oldName,
            string newName)
        {
            GenreDAL dal = new GenreDAL(_connection);
            return dal.GenreUpdateSafe(GenreID,
                oldName, 
                newName);
        }

        public void GenreDelete(int GenreID)
        {
            GenreDAL dal = new GenreDAL(_connection);
            dal.GenreDelete(GenreID);
        }

        #endregion Genre

        #region Role CRUD

        public int RoleCreate(Role role)
        {
            return RoleCreate(role.RoleName, role.CreateOperation, role.UpdateOperation, role.DeleteOperation, role.ListOperation, role.ViewOperation);
        }
        public int RoleCreate(
            string Name,
            string CreateOperation,
            string UpdateOperation,
            string DeleteOperation,
            string ListOperation,
            string ViewOperation)
        {
            RoleDAL dal = new RoleDAL(_connection);
            return dal.RoleCreate(Name,CreateOperation,UpdateOperation,DeleteOperation,
                ListOperation,ViewOperation);
        }
        public Role RoleFindByID(int RoleID)
        {
            RoleDAL dal = new RoleDAL(_connection);
            return dal.RoleFindByID(RoleID);
        }
        public List<Role> RoleGetAll(int skip=0, int take=0)
        {
            RoleDAL dal = new RoleDAL(_connection);
            return dal.RolesGetAll(skip, take);
        }

        public int RoleUpdateJust(int id, Role r)
        {
            return RoleUpdateJust(id, r.RoleName, r.CreateOperation,
                r.UpdateOperation, r.DeleteOperation, r.ListOperation, r.ViewOperation);
        }
        public int RoleUpdateJust(
            int RoleID,
            string Name,
            string CreateOperation,
            string UpdateOperation,
            string DeleteOperation,
            string ListOperation,
            string ViewOperation)
        {
            RoleDAL dal = new RoleDAL(_connection);
            return dal.RoleUpdateJust(RoleID, Name, 
                CreateOperation, UpdateOperation, DeleteOperation,
                ListOperation, ViewOperation);
        }

        public int RoleUpdateSafe(
            int RoleID,
            string oldRoleName,
            string oldCreateOperation,
            string oldUpdateOperation,
            string oldDeleteOperation,
            string oldListOperation,
            string oldViewOperation,
            string newRoleName,
            string newCreateOperation,
            string newUpdateOperation,
            string newDeleteOperation,
            string newListOperation,
            string newViewOperation)
        {
            RoleDAL dal = new RoleDAL(_connection);
            return dal.RoleUpdateSafe(RoleID,
                oldRoleName,
                oldCreateOperation, 
                oldUpdateOperation, 
                oldDeleteOperation,
                oldListOperation, 
                oldViewOperation,
                newRoleName,
                newCreateOperation, 
                newUpdateOperation, 
                newDeleteOperation,
                newListOperation, 
                newViewOperation
                );
        }

        public void RoleDelete(int RoleID)
        {
            RoleDAL dal = new RoleDAL(_connection);
            dal.RoleDelete(RoleID);
        }

        #endregion Role

        #region Authentication

        public enum RegisterUserCode
        {
            Success,
            UserNameExists,
            UserNameNotFound,
            SecuredDataNotFound,
            SecuredAlready,
            EMailExists,
        }

        public RegisterUserCode RegisterUser(string UserName, string EMail, 
            DateTime DOB, string Password)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            Borrower theBorrower = dal.BorrowerFindByName(UserName);
            if (theBorrower != null)
            {
                return RegisterUserCode.UserNameExists;
            }
            theBorrower = dal.BorrowerFindByEmail(EMail);
            if (theBorrower != null)
            {
                return RegisterUserCode.EMailExists;
            }
            int BorrowerID = dal.BorrowerCreate(UserName, EMail, DOB, MagicConstants.DefaultRole);

            BorrowerSecuredDAL securedDal = new BorrowerSecuredDAL(_connection);
            string salt = System.Web.Helpers.Crypto.GenerateSalt(20);
            string hashed = System.Web.Helpers.Crypto.HashPassword(Password + salt);
            securedDal.BorrowerSecuredUpdateJust(BorrowerID, hashed, salt);
            
            return RegisterUserCode.Success;
        }

        public RegisterUserCode HashClearTextPassword(string UserName)
        {
            BorrowerDAL dal = new BorrowerDAL(_connection);
            Borrower b = dal.BorrowerFindByName(UserName);
            if (b == null)
            {
                return RegisterUserCode.UserNameNotFound;
            }
            BorrowerSecuredDAL sdal = new BorrowerSecuredDAL(_connection);
            BorrowerSecured sb = sdal.BorrowerSecuredFindByID(b.BorrowerID);
            if (sb == null)
            {
                return RegisterUserCode.SecuredDataNotFound;
            }
            // when using cleartext the SALT Field contains "ClearText" instead of salt
            // the cleartext password in in HASH
            if (sb.Salt=="ClearText")
            {
                string salt = System.Web.Helpers.Crypto.GenerateSalt(20);
                // when using cleartext, the HASH field contains the cleartext password
                string pw = sb.Hash + salt;
                string hash = System.Web.Helpers.Crypto.HashPassword(pw);
                sdal.BorrowerSecuredUpdateJust(b.BorrowerID, hash, salt);
            }
            else
            {
                return RegisterUserCode.SecuredAlready;
            }
            return RegisterUserCode.Success;
        }

        public Borrower ValidateUserClearText(string UserName,string Password)
        {
            BorrowerSecured rv = null;
            BorrowerSecuredDAL dal = new BorrowerSecuredDAL(_connection);
            {
                rv = dal.BorrowerSecuredFindByName(UserName);
                if (rv == null)
                {
                    return null;
                }
                if (Password == rv.Hash )
                {
                    return rv;
                }
            }
            return null;
        }

        public Borrower ValidateUserHashed(string UserName, string Password)
        {
            BorrowerSecured rv = null;
            BorrowerSecuredDAL dal = new BorrowerSecuredDAL(_connection);
            {
                rv = dal.BorrowerSecuredFindByName(UserName);
                if (rv == null)
                {
                    return null;
                }
                string pw =  Password + rv.Salt;
                bool verified =
                    System.Web.Helpers.Crypto.VerifyHashedPassword(rv.Hash, pw);
                if (verified)
                {
                    return rv;
                }
            }
            return null;
        }

        public Borrower ValidateEmailClearText(string EMail, string Password)
        {
            return null;
        }

        public Borrower ValidateEMailHashed(string EMail, string Password)
        {
            return null;
        }

        public string GetRoleString(Borrower b)
        {
            string rv = "";
            RoleDAL dal = new RoleDAL(_connection);
            {
                // since we are doing a lot of custom string work
                // use a string builder to increase performance

                StringBuilder sb = new StringBuilder();
                Role r = dal.RoleFindByID(b.RoleID);
                // the string builder is passed to the helper function
                // which will append the role info to the string builder

                // no need to lowercase the operation, 
                // since it is hardcoded to lowercase
                AddRole(sb,"list", r.ListOperation);
                AddRole(sb, "view", r.ViewOperation);
                // details added as synonym for view
                AddRole(sb, "details", r.ViewOperation);
                AddRole(sb, "create", r.CreateOperation);
                AddRole(sb, "update", r.UpdateOperation);
                // edit added as synonym for update
                AddRole(sb, "edit", r.UpdateOperation);
                AddRole(sb, "delete", r.DeleteOperation);
                // the string builder is then converted to the final string
                rv = sb.ToString();

            }
            return rv;
        }
        protected void 
            AddRole(StringBuilder sb, string Operation,string Roles)
        {
            if (string.IsNullOrWhiteSpace(Roles))
            {
                return;
            }
            string[] items = Roles.Split(',');
            
            
            foreach (string item in items)
            {
                // do not want a comma before the first item in the list
                // if the length of the stringbuilder is 0, then this is
                // the first item in the list!   
                if (sb.Length != 0)
                {
                    sb.Append(',');
                }
                sb.Append(Operation);
                sb.Append(':');
                // lowercase the items so that case will not be important
                sb.Append(item.ToLower());
                // if the tablename is plural (ends in s) then remove the s
                if (sb.Length > 0 && ('s' == sb[sb.Length - 1]))
                {
                    sb.Remove(sb.Length - 1, 1);
                }
            }
        }

        #endregion

        #region RatedBorrowing
        public int RatedBorrowingCreate(int BookId, int BorrowerID, DateTime? DueDate, DateTime? ReturnedDate, decimal ?Rating)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingCreate(BookId, BorrowerID, DueDate, ReturnedDate, Rating);
        }

        public int RatedBorrowingCreate(TypeDRatedBorrowing borrowing)
        {
            return RatedBorrowingCreate(borrowing.BookID, borrowing.BorrowerID, borrowing.DueDate, borrowing.ReturnedDate, borrowing.Rating);
        }

        public TypeDRatedBorrowing RatedBorrowingFindByID(int BorrowingID)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingFindByID(BorrowingID);
        }

        public List<TypeDRatedBorrowing> RatedBorrowingsGetAll(int skip = 0, int take=0)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingsGetAll(skip,take);
        }

        public List<TypeDRatedBorrowing> RatedBorrowingsGetAllCheckedOut(int skip = 0, int take = 0)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            var rv =  dal.TypeDRatedBorrowingsGetAll(skip, take);
            return rv.Where(b => b.isCheckedOut == true).ToList();
        }

        public int RatedBorrowingDelete(int borrowingID)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingDelete(borrowingID);
        }

        public int RatedBorrowingUpdateJust(TypeDRatedBorrowing item)
        {
            return RatedBorrowingUpdateJust(item.BorrowingID, item.BookID, item.BorrowerID, item.DueDate, item.ReturnedDate, item.Rating);
        }

        public int RatedBorrowingUpdateJust(int BorrowingID, int BookId, int BorrowerID, DateTime? DueDate, DateTime? ReturnedDate, decimal? Rating)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingUpdateJust(BorrowingID, BookId, BorrowerID, DueDate, ReturnedDate, Rating);
        }

        public int RatedBorrowingUpdateJust(int BorrowingID, TypeDRatedBorrowing borrowing)
        {
            return RatedBorrowingUpdateJust(BorrowingID, borrowing.BookID, borrowing.BorrowerID, borrowing.DueDate, borrowing.ReturnedDate, borrowing.Rating);
        }

        public List<TypeDRatedBorrowing> RatedBorrowingGetBooksRelatedToBorrower(int BorrowerID, int skip=0, int take=0)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingGetBooksRelatedToBorrowerID(BorrowerID, skip, take);
        }

        public List<TypeDRatedBorrowing> RatedBorrowingGetBooksRelatedToBorrowerCheckedOutOnly(int BorrowerID, int skip = 0, int take = 0)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            var rv = dal.TypeDRatedBorrowingGetBooksRelatedToBorrowerID(BorrowerID, skip, take);
            return rv.Where(x => x.isCheckedOut == true).ToList();
        }

        public List<TypeDRatedBorrowing> RatedBorrowingGetBorrowersRelatedToBook(int BookID, int skip = 0, int take = 0)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            return dal.TypeDRatedBorrowingGetBorrowersRelatedToBookID(BookID, skip, take);
        }

        public List<TypeDRatedBorrowing> RatedBorrowingGetBorrowersRelatedToBookCheckedOut(int BookID, int skip = 0, int take = 0)
        {
            TypeDRatedBorrowingDAL dal = new TypeDRatedBorrowingDAL(_connection);
            var rv = dal.TypeDRatedBorrowingGetBorrowersRelatedToBookID(BookID, skip, take);
            return rv.Where(b => b.isCheckedOut == true).ToList();
        }



        #endregion borrowing

       #region Writing
        public void WritingCreate(int AuthorID, int BookId)
        {
            TypeAWritingDAL dal = new TypeAWritingDAL(_connection);
            dal.TypeAWritingCreate(BookId, AuthorID);
        }

        public void WritingDelete(int BookID, int AuthorID)
        {
            TypeAWritingDAL dal = new TypeAWritingDAL(_connection);
            dal.TypeAWritingDelete(BookID, AuthorID);

        }

        //public List<> WritingsGetBooksRelatedToAuthor(int AuthorID, int skip=0, int take=0)
        //{
        //    TypeAWritingDAL dal = new TypeAWritingDAL(_connection);
        //    return dal.TypeAWritingGetBooksRelatedToAuthorID(AuthorID, skip, take);
        //}

        #endregion

        #region CommentedWriting
        #endregion writing



        #region LogItem

        public LogItem LogItemFindByID(int LogItemID)
        {
            LogItemDAL dal = new LogItemDAL(_connection);
            return dal.LogItemFindByID(LogItemID);
        }
        public List<LogItem> LogItemGetAll(int skip = 0, int take = 0)
        {
            LogItemDAL dal = new LogItemDAL(_connection);
            return dal.LogItemsGetAll(skip, take);
        }
        #endregion

    }
}
