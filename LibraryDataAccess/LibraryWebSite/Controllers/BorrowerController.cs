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
    [MustBeLoggedIn]
    public class BorrowerController : Controller
    {
        // GET: Borrower
        public ActionResult Index()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBorrower.ToList(ctx.BorrowerGetAll());
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Borrower/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBorrower.MakeNew( ctx.BorrowerFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Borrower/Create
        public ActionResult Create()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = new VMBorrower();
                    data.PopulateRoleItems(ctx.RoleGetAll());
                    return View(data);
                }

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Borrower/Create
        [HttpPost]
        public ActionResult Create(VMBorrower data)
        {
            try
            {
                // context on outside because both sides of modelstate
                // need context (then needs to update, and else needs to repopulate)

                using (Context ctx = new Context())
                {
                    if (ModelState.IsValid)
                    {
                        ctx.BorrowerCreate(data);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        data.PopulateRoleItems(ctx.RoleGetAll());
                        return View(data);
                    }
                }
                

               
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Borrower/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBorrower.MakeNew(ctx.BorrowerFindByID(id));
                    data.PopulateRoleItems(ctx.RoleGetAll());
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Borrower/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, VMBorrower data)
        {
            try
            {
                // context on outside because both sides of modelstate
                // need context (then needs to update, and else needs to repopulate)
                using (Context ctx = new Context())
                {
                    if (ModelState.IsValid)
                    {
                        ctx.BorrowerUpdateJust(id,data);
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        data.PopulateRoleItems(ctx.RoleGetAll());
                        return View(data);
                    }
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }

            
           
        }

        // GET: Borrower/Delete/5
        public ActionResult Delete(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = VMBorrower.MakeNew(ctx.BorrowerFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Borrower/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, VMBorrower data)
        {
            try
            {
                // modelstate on outside because delete does not need dropdown list
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.BorrowerDelete(id);
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
    }
}
