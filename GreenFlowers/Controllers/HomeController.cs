using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;

namespace GreenFlowers.Controllers
{
    public class HomeController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();
        public ActionResult Index()
        {
            var lst = db.GF_Product.ToList();
            return View(lst);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Shop()
        {
            var lst = db.GF_Product.OrderByDescending(s => s.Created_Date).ToList();

            return View(lst);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

    }
}