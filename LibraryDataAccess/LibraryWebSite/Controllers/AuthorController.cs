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
    public class AuthorController : Controller
    {
        // GET: Author
        public ActionResult Index()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMAuthor.ToList(ctx.AuthorGetAll(0,400));
                    return View(data);
                }
            }
            catch(Exception ex)
            {
                return View("Exception", ex);
            }
            
            
        }

        // GET: Author/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMAuthor.MakeNew(ctx.AuthorFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Author/Create
        public ActionResult Create()
        {
            try
            {

                var data = new VMAuthor();
                
                return View(data);
               
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Author/Create
        [HttpPost]
        public ActionResult Create(VMAuthor data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.AuthorCreate(data);
                        return RedirectToAction("Index");
                    }
                }

                return View(data);
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Author/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                
                    using (Context ctx = new Context())
                    {
                    var data = Models.VMAuthor.MakeNew(ctx.AuthorFindByID(id));
                    return View(data);
                    }
               
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Author/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, VMAuthor data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.AuthorUpdateJust(id,data);
                        return RedirectToAction("Index");
                    }
                    
                }
                return View(data);
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Author/Delete/5
        public ActionResult Delete(int id)
        {

            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMAuthor.MakeNew(ctx.AuthorFindByID(id));
                    return View(data);
                }
            }

            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Author/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Author data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.AuthorDelete(id);
                        return RedirectToAction("Index");
                    }

                }
                return View(data);
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }
    }
}
