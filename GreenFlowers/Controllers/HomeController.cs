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
            string id = "introduce";
            var rs = db.GF_Introduce.Where(s => s.ID.Equals(id));
            return View(rs);
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

        [HttpPost]
        public ActionResult SendContact(string fullname, string email, string subject, string message)
        {
            try
            {
                GF_AboutUs ab = new GF_AboutUs();
                ab.Fullname = fullname;
                ab.Title = subject;
                ab.Email = email;
                ab.ContentAbout = message;
                db.GF_AboutUs.Add(ab);
                db.SaveChanges();
                return RedirectToAction("Contact","Home");
            }catch(Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error");
            }
        }
    }
}