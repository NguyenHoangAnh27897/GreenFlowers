using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GreenFlowers.Models;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

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
        public JsonResult AddtoCart()
        {
            var resolveRequest = HttpContext.Request;
            List<Cart> cart = new List<Cart>();
            resolveRequest.InputStream.Seek(0, SeekOrigin.Begin);
            string jsonString = new StreamReader(resolveRequest.InputStream).ReadToEnd();
            if (jsonString != null)
            {
                if (IsValidJson(jsonString))
                {
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    cart = (List<Cart>)serializer.Deserialize(jsonString, typeof(List<Cart>));
                } 
            }
            Session["Order"] = getGUID();
            if (cart != null)
                {
                for (int i = 0; i < cart.Count; i++)
                {
                    GF_Record rc = new GF_Record();
                    rc.ID = getGUID();
                    rc.ID_Order = Session["Order"].ToString();
                    rc.ProductName = cart[i].ProductName;
                    rc.Quantity = int.Parse(cart[i].Qty);
                    rc.Price = cart[i].Price;
                    rc.TotalPrice = cart[i].Price * int.Parse(cart[i].Qty);
                    db.GF_Record.Add(rc);
                    db.SaveChanges();
                }
                return Json(new { msg = "Thành công", status = "200" }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json(new {  msg = "Thất bại", status ="500" }, JsonRequestBehavior.AllowGet);
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

        private static bool IsValidJson(string strInput)
        {
            strInput = strInput.Trim();
            if ((strInput.StartsWith("{") && strInput.EndsWith("}")) || //For object
                (strInput.StartsWith("[") && strInput.EndsWith("]"))) //For array
            {
                try
                {
                    var obj = JToken.Parse(strInput);
                    return true;
                }
                catch (JsonReaderException jex)
                {
                    //Exception in parsing json
                    Console.WriteLine(jex.Message);
                    return false;
                }
                catch (Exception ex) //some other exception
                {
                    Console.WriteLine(ex.ToString());
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}