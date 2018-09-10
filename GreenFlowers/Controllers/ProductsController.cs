using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;

namespace GreenFlowers.Controllers
{
    public class ProductsController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();
        // GET: Products
        public ActionResult Details(string id)
        {
            var item = db.GF_Product.Where(s => s.ID.Equals(id));
            return View(item);
        }

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