using Microsoft.VisualStudio.TestTools.UnitTesting;
using LibraryDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using LibraryCommon;

// WARNING  WARNING   WARNING   WARNING
// a reference to System.DATA was added to the test library
// the standard Unit Testing does not have access to a database
// the tests in this library are known to be non optimal
// this test library is not really a unit test
// this test library is used to VALIDATE the DAL to the database
// this test library should be run against a TEST database
// as if it fails it may leave the database in an inconsistent state
// the purpose of this library is to VALIDATE the CRUD in the DAL only
// the MagicSetup for the connection string MUST be pointed to a test database and
// NOT to the production database
// WARNING  WARNING   WARNING   WARNING
namespace LibraryDataAccess.Tests
{
    public class MagicSetup

    {
        public const string connectionstring = @"Data Source=.\sqlexpress;Initial Catalog=Library;Integrated Security=True";
        static IDbConnection _connection;
        public static IDbConnection Connection
        {
            get { 
                return _connection; }
        }
        static MagicSetup()
        {
            _connection = new System.Data.SqlClient.SqlConnection(connectionstring);
            _connection.Open();
        }

    }

    // the tests in this library are known to be non optimal
    // this test library is not really a unit test
    // this test library is used to VALIDATE the DAL to the database
    // this test library should be run against a TEST database
    // as if it fails it may leave the database in an inconsistent state
    // the purpose of this library is to VALIDATE the CRUD in the DAL only
    // the MagicSetup for the connection string MUST be pointed to a test database and
    // NOT to the production database
    [TestClass()]
    public class AuthorDALTests
    {

        [TestMethod()]
        public void AuthorTest()
        {
            // arrange
            AuthorDAL dal = new AuthorDAL(MagicSetup.Connection);
            // act create
            int rv1 = dal.AuthorCreate("Test1", null, "testlocation1");
            Assert.IsTrue(rv1 > 0,$"AuthorCreate failed rv = {rv1}");

            Author a = dal.AuthorFindByID(rv1);
            Assert.IsNotNull(a, $"AuthorFindByID for ID {rv1} (just created) returned null");
            Assert.IsTrue(a.AuthorName == "Test1",$"AuthorName was expected to be 'Test1' but found {a.AuthorName}");
            Assert.IsFalse(a.AuthorDOB.HasValue,$"AuthorDOB was expected to be null, but had a value");
            Assert.IsTrue(a.AuthorLocation == "testlocation1",$"authorlocation was expected to be 'testlocation1' but was actually '{a.AuthorLocation}'");

            int countofauthors = dal.AuthorsObtainCount();
            Assert.IsTrue(countofauthors > 0, $"AuthorsObtainCount should be greater than 0 it is {countofauthors}");
            List<Author> authors = dal.AuthorsGetAll();
            Assert.IsTrue(authors.Count == countofauthors, $"AuthorsGetAll should have brought back {countofauthors} records, but it only found {authors.Count}");
            DateTime now = DateTime.Now;
            int number = dal.AuthorUpdateJust(rv1, "Test1New", now, "newLocation1");
            Assert.IsTrue(number == 1,$"authorUpdateJust was expected to return 1, but actually returned {number}");
            a = dal.AuthorFindByID(rv1);
            Assert.IsNotNull(a, $"AuthorFindByID for ID {rv1} (just updated) returned null");
            Assert.IsTrue(a.AuthorName == "Test1New",$"AuthorName after update was expected to be 'Test1New' but was actually '{a.AuthorName}'");
            Assert.IsTrue(a.AuthorDOB.HasValue,"authorDOB was expected to have a value, but was null");
            Assert.IsTrue(a.AuthorLocation == "newLocation1", $"authorlocation was expected to be 'newLocation1' but was actually '{a.AuthorLocation}'");
            number = dal.AuthorUpdateSafe(rv1, "Test1New", now, "newLocation1","1",null,"2");
            Assert.IsTrue(number == 1,$"authorUpdateSafe was expected to return 1 but actually returned {number}");
            a = dal.AuthorFindByID(rv1);
            Assert.IsNotNull(a, $"AuthorFindByID for ID {rv1} (just safe updated) returned null");
            Assert.IsTrue(a.AuthorName == "1",$"authorname after safeupdate was expected to be '1', but was '{a.AuthorName}");
            Assert.IsFalse(a.AuthorDOB.HasValue,$"authorDOB after safeupdate was expected to be null, but was not");
            Assert.IsTrue(a.AuthorLocation == "2", $"authorlocation after saftupdate was expected to be '2' but was actually '{a.AuthorLocation}'");
            number = dal.AuthorUpdateSafe(rv1, "1", now, "2", "3", null, "4");
            Assert.IsTrue(number == 0,$"authorupdatesafe was expected to return 0, but it actually returned {number}");

            dal.AuthorDelete(rv1);







        }

        [TestMethod()]
        public void BookTest()
        {
            // arrange
            BookDAL dal = new BookDAL(MagicSetup.Connection);
            // act create
            int rv1 = dal.BookCreate("ISBN1","Test1",100,20.0M,1);
            Assert.IsTrue(rv1 > 0, $"BookCreate failed rv = {rv1}");

            Book a = dal.BookFindByID(rv1);
            Assert.IsNotNull(a, $"BookFindByID for ID {rv1} (just created) returned null");
            Assert.IsTrue(a.BookName == "Test1");
            Assert.IsTrue(a.Pages == 100);
            Assert.IsTrue(a.GenreID == 1);

            int countofBooks = dal.BooksObtainCount();
            Assert.IsTrue(countofBooks > 0, $"BooksObtainCount should be greater than 0 it is {countofBooks}");
            List<Book> Books = dal.BooksGetAll();
            Assert.IsTrue(Books.Count == countofBooks, $"BooksGetAll should have brought back {countofBooks} records, but it only found {Books.Count}");
            
            int number = dal.BookUpdateJust(rv1,"ISBN1New", "Test1New",200,20.0M,0);
            Assert.IsTrue(number == 1);
            a = dal.BookFindByID(rv1);
            Assert.IsNotNull(a, $"BookFindByID for ID {rv1} (just updated) returned null");
            Assert.IsTrue(a.BookName == "Test1New");
            Assert.IsTrue(a.Pages==200);
            Assert.IsTrue(a.GenreID == 0);
            number = dal.BookUpdateSafe(rv1,"ISBN1New", "Test1New", 200,20.0M, 0, "ISBN1Newer","1", 300, 30.0M,3);
            Assert.IsTrue(number == 1);
            a = dal.BookFindByID(rv1);
            Assert.IsNotNull(a, $"BookFindByID for ID {rv1} (just safe updated) returned null");
            Assert.IsTrue(a.BookName == "1",$"bookname after safeupdate was expected to be '1' but was actually '{a.BookName}'");
            Assert.IsTrue(a.Pages == 300, $"pages after safeupdate was expected to be '200' but was actually '{a.Pages}'");
            Assert.IsTrue(a.GenreID==3, $"genreID after safeupdate was expected to be 3 but was actually '{a.GenreID}'");
            number = dal.BookUpdateSafe(rv1,"X", "1",30,30.0M, 0, "Y","3",40,40.0M ,4);
            Assert.IsTrue(number == 0,$"bookupdatesafe was expected to return 0, but it actually returned '{number}'");

            dal.BookDelete(rv1);







        }

        [TestMethod()]
        public void BorrowerTest()
        {
            // arrange
            BorrowerDAL dal = new BorrowerDAL(MagicSetup.Connection);
            // act create
            int rv1 = dal.BorrowerCreate("Test1","Email", null, 1);
            Assert.IsTrue(rv1 > 0, $"BorrowerCreate failed rv = {rv1}");

            Borrower a = dal.BorrowerFindByID(rv1);
            Assert.IsNotNull(a, $"BorrowerFindByID for ID {rv1} (just created) returned null");
            Assert.IsTrue(a.BorrowerName == "Test1", $"BorrowerName was expected to be 'Test1' but found {a.BorrowerName}");
            Assert.IsFalse(a.BorrowerDOB.HasValue, $"BorrowerDOB was expected to be null, but had a value");
            Assert.IsTrue(a.RoleID == 1, $"Borrowerroleid was expected to be '1' but was actually '{a.RoleID}'");

            int countofBorrowers = dal.BorrowerObtainCount();
            Assert.IsTrue(countofBorrowers > 0, $"BorrowersObtainCount should be greater than 0 it is {countofBorrowers}");
            List<Borrower> Borrowers = dal.BorrowersGetAll();
            Assert.IsTrue(Borrowers.Count == countofBorrowers, $"BorrowersGetAll should have brought back {countofBorrowers} records, but it only found {Borrowers.Count}");
            DateTime now = DateTime.Now;
            int number = dal.BorrowerUpdateJust(rv1, "Test1New", "EMail1",now, 2);
            Assert.IsTrue(number == 1, $"BorrowerUpdateJust was expected to return 1, but actually returned {number}");
            a = dal.BorrowerFindByID(rv1);
            Assert.IsNotNull(a, $"BorrowerFindByID for ID {rv1} (just updated) returned null");
            Assert.IsTrue(a.BorrowerName == "Test1New", $"BorrowerName after update was expected to be 'Test1New' but was actually '{a.BorrowerName}'");
            Assert.IsTrue(a.BorrowerDOB.HasValue, "BorrowerDOB was expected to have a value, but was null");
            Assert.IsTrue(a.RoleID == 2, $"BorrowerRoleID was expected to be 'newLocation1' but was actually '{a.RoleID}'");
            number = dal.BorrowerUpdateSafe(rv1, "Test1New","EMail1", now, 2, "1", "EMail2",null, 3);
            Assert.IsTrue(number == 1, $"BorrowerUpdateSafe was expected to return 1 but actually returned {number}");
            a = dal.BorrowerFindByID(rv1);
            Assert.IsNotNull(a, $"BorrowerFindByID for ID {rv1} (just safe updated) returned null");
            Assert.IsTrue(a.BorrowerName == "1", $"Borrowername after safeupdate was expected to be '1', but was '{a.BorrowerName}");
            Assert.IsFalse(a.BorrowerDOB.HasValue, $"BorrowerDOB after safeupdate was expected to be null, but was not");
            Assert.IsTrue(a.RoleID == 3, $"BorrowerRoleID after saftupdate was expected to be '3' but was actually '{a.RoleID}'");
            number = dal.BorrowerUpdateSafe(rv1, "1", "EMail2",now,2, "3","EMail3", null, 4);
            Assert.IsTrue(number == 0, $"Borrowerupdatesafe was expected to return 0, but it actually returned {number}");

            dal.BorrowerDelete(rv1);







        }

        [TestMethod()]
        public void GenreTest()
        {
            // arrange
            GenreDAL dal = new GenreDAL(MagicSetup.Connection);
            // act create
            int rv1 = dal.GenreCreate("Test1");
            Assert.IsTrue(rv1 > 0, $"GenreCreate failed rv = {rv1}");

            Genre a = dal.GenreFindByID(rv1);
            Assert.IsNotNull(a, $"GenreFindByID for ID {rv1} (just created) returned null");
            Assert.IsTrue(a.GenreName == "Test1", $"GenreName was expected to be 'Test1' but found {a.GenreName}");

            int countofGenres = dal.GenresObtainCount();
            Assert.IsTrue(countofGenres > 0, $"GenresObtainCount should be greater than 0 it is {countofGenres}");
            List<Genre> Genres = dal.GenresGetAll();
            Assert.IsTrue(Genres.Count == countofGenres, $"GenresGetAll should have brought back {countofGenres} records, but it only found {Genres.Count}");
            DateTime now = DateTime.Now;
            int number = dal.GenreUpdateJust(rv1, "Test1New");
            Assert.IsTrue(number == 1, $"GenreUpdateJust was expected to return 1, but actually returned {number}");
            a = dal.GenreFindByID(rv1);
            Assert.IsNotNull(a, $"GenreFindByID for ID {rv1} (just updated) returned null");
            Assert.IsTrue(a.GenreName == "Test1New", $"GenreName after update was expected to be 'Test1New' but was actually '{a.GenreName}'");
            
            number = dal.GenreUpdateSafe(rv1, "Test1New",  "1");
            Assert.IsTrue(number == 1, $"GenreUpdateSafe was expected to return 1 but actually returned {number}");
            a = dal.GenreFindByID(rv1);
            Assert.IsNotNull(a, $"GenreFindByID for ID {rv1} (just safe updated) returned null");
            Assert.IsTrue(a.GenreName == "1", $"Genrename after safeupdate was expected to be '1', but was '{a.GenreName}");
 
            number = dal.GenreUpdateSafe(rv1, "2", "4");
            Assert.IsTrue(number == 0, $"Genreupdatesafe was expected to return 0, but it actually returned {number}");

            dal.GenreDelete(rv1);







        }

        [TestMethod()]
        public void RoleTest()
        {
            // arrange
            RoleDAL dal = new RoleDAL(MagicSetup.Connection);
            // act create
            int rv1 = dal.RoleCreate("Test1", "1","2","3","4","5");
            Assert.IsTrue(rv1 > 0, $"RoleCreate failed rv = {rv1}");

            Role a = dal.RoleFindByID(rv1);
            Assert.IsNotNull(a, $"RoleFindByID for ID {rv1} (just created) returned null");
            Assert.IsTrue(a.RoleName == "Test1", $"RoleName was expected to be 'Test1' but found {a.RoleName}");
            Assert.IsTrue(a.CreateOperation == "1", $"CreateOperation was expected to be 1 but was actually {a.CreateOperation}");
            Assert.IsTrue(a.UpdateOperation == "2", $"UpdateOperation was expected to be 2 but was actually {a.UpdateOperation}");
            Assert.IsTrue(a.DeleteOperation == "3", $"DeleteOperation was expected to be 3 but was actually {a.DeleteOperation}");
            Assert.IsTrue(a.ListOperation == "4", $"ListOperation was expected to be 4 but was actually {a.ListOperation}");
            Assert.IsTrue(a.ViewOperation == "5", $"ViewOperation was expected to be 5 but was actually {a.ViewOperation}");

            int countofRoles = dal.RolesObtainCount();
            Assert.IsTrue(countofRoles > 0, $"RolesObtainCount should be greater than 0 it is {countofRoles}");
            List<Role> Roles = dal.RolesGetAll();
            Assert.IsTrue(Roles.Count == countofRoles, $"RolesGetAll should have brought back {countofRoles} records, but it only found {Roles.Count}");
            DateTime now = DateTime.Now;
            int number = dal.RoleUpdateJust(rv1, "Test1New", "10","20","30","40","50");
            Assert.IsTrue(number == 1, $"RoleUpdateJust was expected to return 1, but actually returned {number}");
            a = dal.RoleFindByID(rv1);
            Assert.IsNotNull(a, $"RoleFindByID for ID {rv1} (just updated) returned null");
            Assert.IsTrue(a.RoleName == "Test1New", $"RoleName after update was expected to be 'Test1New' but was actually '{a.RoleName}'");
            Assert.IsTrue(a.CreateOperation == "10", $"CreateOperation was expected to be 10 but was actually {a.CreateOperation}");
            Assert.IsTrue(a.UpdateOperation == "20", $"UpdateOperation was expected to be 20 but was actually {a.UpdateOperation}");
            Assert.IsTrue(a.DeleteOperation == "30", $"DeleteOperation was expected to be 30 but was actually {a.DeleteOperation}");
            Assert.IsTrue(a.ListOperation == "40", $"ListOperation was expected to be 40 but was actually {a.ListOperation}");
            Assert.IsTrue(a.ViewOperation == "50", $"ViewOperation was expected to be 50 but was actually {a.ViewOperation}");



            number = dal.RoleUpdateSafe(rv1,"Test1New","10","20","30","40","50","1","100","200","300","400","500");
            Assert.IsTrue(number == 1, $"RoleUpdateSafe was expected to return 1 but actually returned {number}");
            a = dal.RoleFindByID(rv1);
            Assert.IsNotNull(a, $"RoleFindByID for ID {rv1} (just safe updated) returned null");
            Assert.IsTrue(a.RoleName == "1", $"Rolename after safeupdate was expected to be '1', but was '{a.RoleName}");
            Assert.IsTrue(a.CreateOperation == "100", $"CreateOperation was expected to be 100 but was actually {a.CreateOperation}");
            Assert.IsTrue(a.UpdateOperation == "200", $"UpdateOperation was expected to be 200 but was actually {a.UpdateOperation}");
            Assert.IsTrue(a.DeleteOperation == "300", $"DeleteOperation was expected to be 300 but was actually {a.DeleteOperation}");
            Assert.IsTrue(a.ListOperation == "400", $"ListOperation was expected to be 400 but was actually {a.ListOperation}");
            Assert.IsTrue(a.ViewOperation == "500", $"ViewOperation was expected to be 500 but was actually {a.ViewOperation}");

            number = dal.RoleUpdateSafe(rv1, "Test1New", "10", "20", "30", "40", "50", "1", "100", "200", "300", "400", "500");
            Assert.IsTrue(number == 0, $"Roleupdatesafe was expected to return 0, but it actually returned {number}");

            dal.RoleDelete(rv1);







        }
    }
}