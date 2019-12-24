using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibraryBusinessLogicLayer;
using LibraryCommon;
using LibraryWebSite.Models;

namespace LibraryWebSite.Controllers
{
    public class BookController : Controller
    {

        // this is the server paging index
        public ActionResult Page(int page, int count)
        {
            try
            {
                if (page <=0)
                {
                    page = 1;
                }
                ViewBag.PageNumber = page;
                ViewBag.PageSize = count;
                using (Context ctx = new Context())
                {
                    ViewBag.TotalCount = ctx.BookObtainCount();
                    var data = VMBook.ToList(ctx.BookGetAll((page-1)*count, count));

                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }


        public ActionResult AjaxLoading()
        {
            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchValue = Request.Form.GetValues("search[value]").FirstOrDefault();

            int skip = (start != null) ? Convert.ToInt32(start) : 0;
            int take = (length != null) ? Convert.ToInt32(length) : 1;
            int totalRecordCount = 0;
            using (Context ctx = new Context())
            {
                totalRecordCount = ctx.BookObtainCount();
                var Data = ctx.BookGetAll();
                IOrderedEnumerable<Book> SortedData;
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDir)))
                {
                    if (sortColumnDir == "asc")
                    {
                        switch(sortColumn.ToLower())
                        {
                            case ("isbn"):
                                SortedData = Data.OrderBy(x => x.ISBN);
                                break;
                            case ("bookname"):
                                SortedData = Data.OrderBy(x => x.BookName);
                                break;
                            case ("pages"):
                                SortedData = Data.OrderBy(x => x.Pages);
                                break;
                            case ("daysoverdue"):
                                SortedData = Data.OrderBy(x => x.DaysOverdue);
                                break;
                            case ("genrename"):
                                SortedData = Data.OrderBy(x => x.GenreName);
                                break;
                            default:
                                SortedData = Data.OrderBy(x => x.BookName);
                                break;
                                
                        }
                    }
                    else
                    {
                        switch (sortColumn.ToLower())
                        {
                            case ("isbn"):
                                SortedData = Data.OrderByDescending(x => x.ISBN);
                                break;
                            case ("bookname"):
                                SortedData = Data.OrderByDescending(x => x.BookName);
                                break;
                            case ("pages"):
                                SortedData = Data.OrderByDescending(x => x.Pages);
                                break;
                            case ("daysoverdue"):
                                SortedData = Data.OrderByDescending(x => x.DaysOverdue);
                                break;
                            case ("genrename"):
                                SortedData = Data.OrderByDescending(x => x.GenreName);
                                break;
                            default:
                                SortedData = Data.OrderByDescending(x => x.BookName);
                                break;

                        }
                    }
                  
                }
                else
                {
                    SortedData = (IOrderedEnumerable<Book>) Data;
                }
                //Search 
                IEnumerable<Book> FilteredAndSortedData;
                if (!string.IsNullOrEmpty(searchValue))
                {

                    FilteredAndSortedData = SortedData.Where
                        (
                        x => ((x.ISBN != null && x.ISBN.Contains(searchValue)) |
                              ((x.BookName != null) && x.BookName.Contains(searchValue)) |
                              ((x.GenreName != null) && x.GenreName.Contains(searchValue))

                             )    
                        );
                         
                }
                else
                {
                    FilteredAndSortedData = SortedData;
                }
                List<Book> FinalData = FilteredAndSortedData.ToList();
                int FilteredCount = FinalData.Count;
                return Json(new { draw = draw, recordsTotal = totalRecordCount,
                    recordsFiltered = FilteredCount,
                    data = FinalData.Skip(skip).Take(take),
                });
            }

           
        }


        public ActionResult AjaxFastLoading()
        {
            var draw = Request.Form.GetValues("draw").FirstOrDefault();
            var start = Request.Form.GetValues("start").FirstOrDefault();
            var length = Request.Form.GetValues("length").FirstOrDefault();
            var sortColumn = Request.Form.GetValues("columns[" + Request.Form.GetValues("order[0][column]").FirstOrDefault() + "][name]").FirstOrDefault();
            var sortColumnDir = Request.Form.GetValues("order[0][dir]").FirstOrDefault();
            var searchValue = Request.Form.GetValues("search[value]").FirstOrDefault();

            int skip = (start != null) ? Convert.ToInt32(start) : 0;
            int take = (length != null) ? Convert.ToInt32(length) : 1;
            int totalRecordCount = 0;
            using (Context ctx = new Context())
            {
                totalRecordCount = ctx.BookObtainCount();
                var Data = ctx.BookGetSortedAndFiltered(sortColumn,sortColumnDir,searchValue,skip,take);


                int FilteredCount = ctx.BookGetSortedAndFilteredCount(sortColumn, sortColumnDir, searchValue) ;
                return Json(new
                {
                    draw = draw,
                    recordsTotal = totalRecordCount,
                    recordsFiltered = FilteredCount,
                    data = Data,
                });
            }


        }

        public ActionResult AjaxIndex()
        {
            return View();
        }

        public ActionResult AjaxAdvancedIndex()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }
        // GET: Book
        [MustBeInTheRole("List:Books")]
        public ActionResult AllIndex(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBook.ToList(ctx.BookGetAll(0,id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

 

        // GET: Book/Details/5
        [MustBeInTheRole("View:Book")]
        public ActionResult Details(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBook.MakeNew(ctx.BookFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Book/Create

        [MustBeInTheRole("Create:Book")]
        public ActionResult Create()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = new VMBook();
                    data.PopulateGenreItems(ctx.GenreGetAll());
                    return View(data);
                }

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Book/Create
        [MustBeInTheRole("Create:Book")]
        [HttpPost]
        public ActionResult Create(VMBook data)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    if (ModelState.IsValid)
                    {
                        ctx.BookCreate(data);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        data.PopulateGenreItems(ctx.GenreGetAll());
                        return View(data);
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Book/Edit/5
        [MustBeInTheRole("Edit:Book")]
        public ActionResult Edit(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBook.MakeNew(ctx.BookFindByID(id));
                    data.PopulateGenreItems(ctx.GenreGetAll());
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Book/Edit/5
        [HttpPost]
        [MustBeInTheRole("Edit:Book")]
        public ActionResult Edit(int id, VMBook data)
        {
            try
            {
                // context on outside because both sides of modelstate
                // need context (then needs to update, and else needs to repopulate)
                using (Context ctx = new Context())
                {
                    if (ModelState.IsValid)
                    {
                        ctx.BookUpdateJust(id, data);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        data.PopulateGenreItems(ctx.GenreGetAll());
                        return View(data);
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }

        }

        // GET: Book/Delete/5
        [MustBeInTheRole("Delete:Book")]
        public ActionResult Delete(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBook.MakeNew(ctx.BookFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Book/Delete/5
        [HttpPost]
        [MustBeInTheRole("Delete:Book")]
        public ActionResult Delete(int id, VMBook data)
        {
            try
            {
                // modelstate on outside because delete does not need dropdown list
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.BookDelete(id);
                        return RedirectToAction("Index");
                    }
                }
                else
                {
                    return View(data);
                }

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // allows the CURRENT User to check out the identified book if 
        // they have ThisUserBorrowing role

        [MustBeInTheRole("Create:ThisUserBorrowing")]
        public ActionResult Borrow(int id /* bookid */)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    string BorrowerName = User.Identity.Name;
                    Borrower thisUser = ctx.BorrowerSecuredFindByName(BorrowerName);
                    if (null == thisUser)
                    {
                        throw new Exception($"Borrower Not Found: '{BorrowerName}'");
                    }
                    Book thisBook = ctx.BookFindByID(id);
                    if (null == thisBook)
                    {
                        throw new Exception($"Book Not Found, id:'{id}'");
                    }
                    // see if the book is checked out already
                    var history = ctx.RatedBorrowingGetBorrowersRelatedToBook(id);
               var checkedout = (history.Where(b => b.isCheckedOut == true)).ToList();
                    if (checkedout.Count>0)
                    {
                        return View("CheckedOut", checkedout);
                    }

                    // this is the Junction to a Many-Many.  
                    // This is duplicatable, and has extra data.
                    VMBorrowing Borrowing = new VMBorrowing(thisBook,thisUser);
                    Borrowing.DueDate = DateTime.Now.AddDays(21);

                    return View(Borrowing);

                    


                }
            }
            catch(Exception ex)
            {
                return View("Exception", ex);
            }

       
        }

        [MustBeInTheRole("Create:ThisUserBorrowing")]
        [HttpPost]
        public ActionResult Borrow(VMBorrowing borrowing)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    if (!ModelState.IsValid)
                    {
                        return View(borrowing);
                    }
                    ctx.RatedBorrowingCreate(borrowing);
                    return RedirectToAction("Index");



                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }

           
        }

       

        public ActionResult Lend(int id)
        {
            return null;
        }

        [MustBeInTheRole("Delete:AllUserBorrowing")]
        public ActionResult DeleteHistory(int id)
        {

            try
            {
                using (Context ctx = new  Context())
                {
                    var b = ctx.RatedBorrowingFindByID(id);
                    if (b == null)
                    {
                        throw new Exception($"borrowing not found id='{id}'");
                    }
                    ctx.RatedBorrowingDelete(id);
                    return RedirectToAction("History", new { id = b.BookID });
                }
            }
            catch(Exception ex)
            {
                return View("Exception", ex);
            }
        }
        [MustBeInTheRole("Update:AllUserBorrowing")]
        public ActionResult ForceReturn(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = ctx.RatedBorrowingFindByID(id);
                    if (null==data)
                    {
                        return View("NotFound");
                    }
                    return View(VMBorrowing.MakeNew(data));
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        [MustBeInTheRole("Update:AllUserBorrowing")]
        [HttpPost]
        public ActionResult ForceReturn(TypeDRatedBorrowing item)
        {
            try
            {
                // context on outside because both sides of modelstate
                // need context (then needs to update, and else needs to repopulate)
                using (Context ctx = new Context())
                {
                    if (ModelState.IsValid)
                    {
                        ctx.RatedBorrowingUpdateJust(item);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                      
                        return View(item);
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        public ActionResult ViewBooksBy(int id  /* borrowerid */)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    string BorrowerName = User.Identity.Name;
                    Borrower thisUser = ctx.BorrowerSecuredFindByName(BorrowerName);
                    if (null == thisUser)
                    {
                        throw new Exception($"Borrower Not Found: '{BorrowerName}'");
                    }
                    if (!User.IsInRole("View:AllBorrowings"))
                    {
                        if (thisUser.BorrowerID == id)
                        {
                            if (User.IsInRole("View:MyBorrowings"))
                            {
                                // success
                            }
                            else
                            {
                                // failure
                                return View("NotAllowed");
                            }
                        }
                        else
                        {
                            // failure
                            return View("NotAllowed");
                        }
                    }

                    var rv = ctx.RatedBorrowingGetBooksRelatedToBorrower(id);
                    var vd = VMBorrowing.ToList(rv);
                    return View("bookborrowing", vd);
                    

                }

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        [MustBeInTheRole("View:AllUserBorrowing")]
        public ActionResult History(int id /* bookid*/)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    
                    if (!User.IsInRole("View:AllUserBorrowing"))
                    {
                        
                           
                            // failure
                            return View("NotAllowed");
                        
                    }

                    var rv = ctx.RatedBorrowingGetBorrowersRelatedToBook(id);
                    var vd = VMBorrowing.ToList(rv);
                    return View("bookborrowing", vd);


                }

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        [MustBeInTheRole("List:ThisUserBorrowing")]
        public ActionResult MyBorrowedBooks()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    // look at the GetCurrentUser method in Authentication class
                    // see the method signature
                  
                    // notice the 'this' modifier on the method signature
                    // GetCurrentUser 'extends' the context class
                    // when Authetication class is in scope, then the
                    // GetCurrentUser method will 'appear' inside any instances
                    // dot into the ctx variable and look at the icon in front of
                    // Get Current User.  this is how an extention is identified
                    // notice that the 'this' parameter is actually infront of the dot
                    // used to invoke GetCurrentUser.  It is NOT inside the parenthesis
                    var borrower = ctx.GetCurrentUser();
                    if (null == borrower)
                    {
                        return View("NotFound");
                    }
                    var items = ctx.RatedBorrowingGetBooksRelatedToBorrowerCheckedOutOnly(borrower.BorrowerID);
                    return View(VMBorrowing.ToList(items));


                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
            return View();
        }

        [MustBeInTheRole("List:AllUserBorrowing")]
        public ActionResult AllBorrowedBooks()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var items = ctx.RatedBorrowingsGetAllCheckedOut();
                    return View(VMBorrowing.ToList(items));


                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
           
        }

       public ActionResult EditBorrowing(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var b = ctx.RatedBorrowingFindByID(id);
                    if (null == b)
                    {
                        return View("NotFound");
                    }

                    return View(VMBorrowing.MakeNew(b));
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
          
        }

        [HttpPost]
        public ActionResult EditBorrowing(VMBorrowing data)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    ctx.RatedBorrowingUpdateJust(data);

                    return RedirectToAction("AllBorrowedBooks");
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }

        }
    }
}
