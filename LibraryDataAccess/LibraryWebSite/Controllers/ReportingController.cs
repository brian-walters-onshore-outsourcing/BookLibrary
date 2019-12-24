using LibraryBusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryWebSite.Controllers
{
    public class ReportingController : Controller
    {
        // GET: Reporting
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Overdue()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = ctx.BookGetAll();
                    OverDueReport report = new OverDueReport(data);
                    var rv = report.Compute();
                    return View(rv);
                    
                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
            return View();
        }

        public ActionResult BooksByGenre()
        {
            try
            {
                using (Context ctx = new Context())
                {
                    var data = ctx.BookGetAll();
                    BooksByGenreReport report = new BooksByGenreReport(data);
                    var rv = report.Compute();
                    return View(rv);

                }
            }
            catch (Exception ex)
            {
                return View("Exception", ex);
            }
            return View();
        }
    }
}