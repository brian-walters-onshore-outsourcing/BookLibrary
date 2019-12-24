using LibraryBusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryWebSite.Controllers
{
    public class ExceptionController : Controller
    {
        // GET: Exception
        public ActionResult Index()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var items = ctx.LogItemGetAll();
                    return View(items);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
      
        }

        public ActionResult Details(int id)
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var item = ctx.LogItemFindByID(id);
                    if (null == item)
                    {
                        return View("NotFound");
                    }
                    return View(item);
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }

        }

    }
}