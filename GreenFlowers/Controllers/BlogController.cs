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
    public class BlogController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();
        // GET: Blog
        public ActionResult Index(int? page = 1)
        {
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            var lst = db.GF_Blog.OrderByDescending(s=>s.CreatedDate).ToList();
            return View(lst.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Details(string id)
        {
            var rs = db.GF_Blog.Where(s => s.ID == id);
            return View(rs);
        }

        [HttpGet]
        public ActionResult Search(string content, int? page = 1)
        {
            int pageSize = 7;
            int pageNumber = (page ?? 1);
            var lst = db.GF_Blog.Where(s => s.Title.Contains(content)).ToList();
            return View(lst.ToPagedList(pageNumber, pageSize));
        }
    }
}