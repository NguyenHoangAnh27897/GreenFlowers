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
                return RedirectToAction("Login", "WebMaster");
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
                    return RedirectToAction("Index", "WebMaster");
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
                return RedirectToAction("Login", "WebMaster");
            }

        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddProduct(string name, HttpPostedFileBase avatar, HttpPostedFileBase[] images, string editor, bool hide = false, int price = 0, int discountprice = 0, string category ="")
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
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
                pd.IDCategory = int.Parse(category);
                db.GF_Product.Add(pd);
                db.SaveChanges();
                return RedirectToAction("Index", "WebMaster");
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
      
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
                var pd = db.GF_Product.Where(s => s.ID.Equals(ID));
                return View(pd);
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
        }

        [HttpPost]
        public ActionResult EditProduct(string name, HttpPostedFileBase avatar, HttpPostedFileBase[] images, string editor, bool hide = false, int price = 0, int discountprice = 0, string category ="")
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
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
                pd.IDCategory = int.Parse(category);
                db.Entry(pd).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "WebMaster");
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
          
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


        public ActionResult ListCategory()
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                var lst = db.GF_Category.ToList();
                return View(lst);
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
        }

        public ActionResult AddCategory()
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
        }

        [HttpPost]
        public ActionResult AddCategory(string category)
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                GF_Category cate = new GF_Category();
                cate.Category = category;
                db.GF_Category.Add(cate);
                db.SaveChanges();
                return RedirectToAction("Index","WebMaster");
            }
            else
            {
                return RedirectToAction("Login", "Webmaster");
            }
        }

        public ActionResult ListBlog()
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                var lst = db.GF_Blog.ToList();
                return View(lst);
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
        }

        public ActionResult AddBlog()
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }

        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddBlog(string title, string editor, HttpPostedFileBase avatar, bool hide = false)
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
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

                GF_Blog bl = new GF_Blog();
                bl.ID = getGUID();
                bl.Title = title;
                bl.Avatar = Avatar;
                bl.ContentBlog = editor;
                bl.CreatedBy = "Admin";
                bl.CreatedDate = DateTime.Now;
                db.GF_Blog.Add(bl);
                db.SaveChanges();
                return RedirectToAction("Index", "WebMaster");
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }

        }

        public ActionResult EditBlog(string id)
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
            {
                var rs = db.GF_Blog.Where(s => s.ID.Equals(id));
                return View(rs);
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult EditBlog(string title, string editor, HttpPostedFileBase avatar, bool hide = false)
        {
            //kiểm tra đã đăng nhập vào chưa
            if (Session["Authentication"] != null)
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

                GF_Blog bl = new GF_Blog();
                bl.ID = getGUID();
                bl.Title = title;
                bl.Avatar = Avatar;
                bl.ContentBlog = editor;
                bl.CreatedBy = "Admin";
                bl.CreatedDate = DateTime.Now;
                db.Entry(bl).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "WebMaster");
            }
            else
            {
                return RedirectToAction("Login", "WebMaster");
            }

        }
    }
}