using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;
using PagedList;
using PagedList.Mvc;

namespace GreenFlowers.Controllers
{
    public class ProductsController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();
        // GET: Products
        public ActionResult Details(string id)
        {
            var rs = db.GF_Product.Find(id);
            if(rs.CustomerView == null)
            {
                rs.CustomerView = 0;
            }
            rs.CustomerView++;
            db.Entry(rs).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
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

        public ActionResult ListProduct(string id, int? page = 1)
        {
            try
            {
                int pageSize = 5;
                int pageNumber = (page ?? 1);
                int ID = int.Parse(id);
                var lst = db.GF_Product.Where(s => s.IDCategory == ID).ToList();
                return View(lst.ToPagedList(pageNumber, pageSize));
            }catch(Exception ex)
            {
                return RedirectToAction("ErrorPage", "Error");
            }
        }
    }
}