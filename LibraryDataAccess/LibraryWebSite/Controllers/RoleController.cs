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
    public class RoleController : Controller
    {
        // GET: Role
        public ActionResult Index()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMRole.ToList(ctx.RoleGetAll());
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Role/Details/5
        public ActionResult Details(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMRole.MakeNew(ctx.RoleFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // GET: Role/Create
        public ActionResult Create()
        {
            try
            {

                var data = new VMRole();
                return View(data);

            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Role/Create
        [HttpPost]
        public ActionResult Create(VMRole data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.RoleCreate(data);
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

        // GET: Role/Edit/5
        public ActionResult Edit(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMRole.MakeNew(ctx.RoleFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Role/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, VMRole data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.RoleUpdateJust(id, data);
                        // since we just changed a role, should also update the
                        // current users role string so they are able to use
                        // the new role info instantly
                        // other users will have to log out and log back in
                        Borrower b = Authentication.GetCurrentUser(ctx);
                       
                        Session["AUTHRole"] = ctx.GetRoleString(b);
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

        // GET: Role/Delete/5
        public ActionResult Delete(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = Models.VMRole.MakeNew(ctx.RoleFindByID(id));
                    return View(data);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
        }

        // POST: Role/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, VMRole data)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (Context ctx = new Context())
                    {
                        ctx.RoleDelete(id);
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
