using System.Web;
using System.Web.Optimization;

namespace LibraryWebSite
{
    // see lines 12 - 14 and 35
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            // added "~/Scripts/DataTables/jquery.dataTables.js",
            //  "~/Scripts/Chart.min.js"
            // and "~/Scripts/site.js"
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                         "~/Scripts/site.js",
                        "~/Scripts/DataTables/jquery.dataTables.js",
                        "~/Scripts/Chart.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      
                      // added "~/Content/DataTables/css/jquery.dataTables.css",
                    
                      "~/Content/DataTables/css/jquery.dataTables.css",
                      "~/Content/site.css"));
        }
    }
}
