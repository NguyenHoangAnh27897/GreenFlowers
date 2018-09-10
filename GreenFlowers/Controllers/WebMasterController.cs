using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;
using System.Data.Entity;

namespace GreenFlowers.Controllers
{
    public class WebMasterController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();

        // GET: WebMaster
        public ActionResult Index()
        {
            //kiểm tra đã đăng nhập vào chưa
            if(Session["Authentication"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login","Webmaster");
            }

        }

        //View Đăng nhập
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string Username, string Password)
        {
            if (Username.Contains("admin@gmail.com"))
            {
                if (Password.Contains("1234"))
                {
                    //set Session khi đã đăng nhập
                    Session["Authentication"] = "True";
                    return RedirectToAction("Index", "Webmaster");
                }
            }
            return RedirectToAction("Error");
        }

        public ActionResult GFProduct()
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login", "Webmaster");
            }

        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddProduct(string name, HttpPostedFileBase avatar, HttpPostedFileBase[] images, string editor, bool hide = false, int price = 0, int discountprice = 0)
        {
            String chk = "";
            if (hide == false)
            {
                chk = "False";
            }
            else
            {
                chk = "True";
            }
            string Avatar = "";
            if (avatar != null)
            {
                if (avatar.ContentLength > 0)
                {
                    var filename = Path.GetFileName(avatar.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/product/avatar"), avatar.FileName);
                    avatar.SaveAs(path);
                    Avatar += avatar.FileName;
                }

            }

            string Images = "";
            if (images != null)
            {
                foreach (HttpPostedFileBase file in images)
                {
                    if (file.ContentLength > 0)
                    {
                        var filename = Path.GetFileName(file.FileName);
                        var path = Path.Combine(Server.MapPath("~/Images/product/image"), file.FileName);
                        file.SaveAs(path);
                        Images += file.FileName + ",";
                    }
                }
            }
            Images = Images.Remove(Images.Length - 1);
            GF_Product pd = new GF_Product();
            pd.ID = getGUID();
            pd.ProductName = name;
            pd.Avatar = Avatar;
            pd.Images = Images;
            pd.Price = price;
            pd.DiscountPrice = discountprice;
            pd.Description = editor;
            db.GF_Product.Add(pd);
            db.SaveChanges();
            return RedirectToAction("Index","Webmaster");
        }

        public ActionResult ListProduct()
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                var ls = db.GF_Product.ToList();
                return View(ls);
            }
            else
            {
                return RedirectToAction("Login", "Webmaster");
            }
        }

        public ActionResult EditProduct(string ID)
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                var pd = db.GF_Product.Where(s => s.ID == ID);
                return View(pd);
            }
            else
            {
                return RedirectToAction("Login", "Webmaster");
            }
        }

        [HttpPost]
        public ActionResult EditProduct(string name, HttpPostedFileBase avatar, HttpPostedFileBase[] images, string editor, bool hide = false, int price = 0, int discountprice = 0)
        {
            String chk = "";
            if (hide == false)
            {
                chk = "False";
            }
            else
            {
                chk = "True";
            }
            string Avatar = "";
            if (avatar != null)
            {
                if (avatar.ContentLength > 0)
                {
                    var filename = Path.GetFileName(avatar.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images/product/avatar"), avatar.FileName);
                    avatar.SaveAs(path);
                    Avatar += avatar.FileName;
                }

            }

            string Images = "";
            if (images != null)
            {
                foreach (HttpPostedFileBase file in images)
                {
                    if (file.ContentLength > 0)
                    {
                        var filename = Path.GetFileName(file.FileName);
                        var path = Path.Combine(Server.MapPath("~/Images/product/image"), file.FileName);
                        file.SaveAs(path);
                        Images += file.FileName + ",";
                    }
                }
            }
            Images = Images.Remove(Images.Length - 1);
            GF_Product pd = new GF_Product();
            pd.ProductName = name;
            pd.Avatar = Avatar;
            pd.Images = Images;
            pd.Price = price;
            pd.DiscountPrice = discountprice;
            pd.Description = editor;
            db.Entry(pd).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "Webmaster");
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