using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;

namespace GreenFlowers.Controllers
{
    public class CartController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();
        // GET: Cart
        public ActionResult Cart()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Payment(string ProductName, int Price, int Quantity, int DiscountPrice)
        {
            GF_Order od = new GF_Order();
            od.ProductName = ProductName;
            od.Price = Price;
            od.Quantity = Quantity;
            od.DiscountPrice = DiscountPrice;
            db.GF_Order.Add(od);
            db.SaveChanges();
            return RedirectToAction("","");
        }
    }
}