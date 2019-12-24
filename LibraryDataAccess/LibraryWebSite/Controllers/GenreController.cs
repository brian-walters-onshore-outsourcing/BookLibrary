using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibraryWebSite.Models;
using LibraryBusinessLogicLayer;
using LibraryCommon;


namespace LibraryWebSite.Controllers
{
    public class GenreController : Controller
    {
        // GET: Genre
        public ActionResult Index()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMGenre.ToList(ctx.GenreGetAll());
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Genre/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMGenre.MakeNew(ctx.GenreFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Genre/Create
        public ActionResult Create()
        {
            try
            {

                var data = new VMGenre();
                return View(data);

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Genre/Create
        [HttpPost]
        public ActionResult Create(VMGenre data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.GenreCreate(data);
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

        // GET: Genre/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMGenre.MakeNew(ctx.GenreFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Genre/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, VMGenre data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.GenreUpdateJust(id, data);
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

        // GET: Genre/Delete/5
        public ActionResult Delete(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMGenre.MakeNew(ctx.GenreFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Genre/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, VMGenre data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.GenreDelete(id);
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
