using System.Web;
using System.Web.Optimization;

namespace GreenFlowers
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/javascript").Include(
                      "~/Scripts/popper.js",
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/imagesloaded.pkgd.min.js",
                      "~/Scripts/isotope.pkgd.min.js",
                      "~/Scripts/ajax-mail.js",
                      "~/Scripts/owl.carousel.min.js",
                      "~/Scripts/plugins.js",
                      "~/Scripts/main.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/animate.css",
                      "~/Content/owl.carousel.min.css",
                      "~/Content/slick.css",
                      "~/Content/chosen.min.css",
                      "~/Content/font-awesome.min.css",
                      "~/Content/simple-line-icons.css",
                      "~/Content/ionicons.min.css",
                      "~/Content/meanmenu.min.css",
                      "~/Content/style.css",
                      "~/Content/responsive.css"));
        }
    }
}
