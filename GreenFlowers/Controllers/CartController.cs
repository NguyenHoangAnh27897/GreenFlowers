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
        public ActionResult AddtoCart(string productname, int? quantity, int? price)
        {
            Session["Order"] = getGUID();

            GF_Record rc = new GF_Record();
            rc.ID = getGUID();
            rc.ID_Order = Session["Order"].ToString();
            rc.ProductName = productname;
            rc.Quantity = quantity;
            rc.TotalPrice = quantity * price;
            db.GF_Record.Add(rc);
            db.SaveChanges();

            return RedirectToAction("Checkout", "Checkout");
        }

        //generate ra một id mới
        public static string getGUID()
        {
            string rs = "";
            char replace = '-';
            char to = '_';
            try
            {
                rs = Guid.NewGuid().ToString();
                rs = rs.Replace(replace, to);
            }
            catch (Exception ex)
            {
                string mess = ex.Message.ToString();
            }
            return rs;
        }
    }
}