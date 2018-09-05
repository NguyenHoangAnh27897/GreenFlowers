using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GreenFlowers.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {
            ViewBag.Message = "Your blog page.";

            return View();
        }

        public ActionResult Details()
        {
            return View();
        }
    }
}