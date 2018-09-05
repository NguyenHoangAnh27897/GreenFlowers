using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GreenFlowers.Controllers
{
    public class CheckOutController : Controller
    {
        // GET: CheckOut
        public ActionResult Checkout()
        {
            return View();
        }
    }
}