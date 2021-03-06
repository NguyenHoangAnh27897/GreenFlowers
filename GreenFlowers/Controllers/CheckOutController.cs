﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;

namespace GreenFlowers.Controllers
{
    public class CheckOutController : Controller
    {
        GreenFlowersEntities db = new GreenFlowersEntities();
        // GET: CheckOut
        public ActionResult Checkout()
        {
            string orid = Session["Order"].ToString();
            var lst = db.GF_Record.Where(s => s.ID_Order.Equals(orid)).ToList();
            return View(lst);
        }

        [HttpPost]
        public ActionResult Checkout(string name, string address, string phone, string email)
        {
            GF_Order od = new GF_Order();
            od.ID = Session["Order"].ToString();
            od.CustomerName = name;
            od.Phone = phone;
            od.Address = address;
            od.Email = email;
            od.IsChecked = false;
            db.GF_Order.Add(od);
            db.SaveChanges();
            return RedirectToAction("Index","Home");
        }
    }
}