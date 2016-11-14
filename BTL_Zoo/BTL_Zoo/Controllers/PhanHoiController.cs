using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_Zoo.Controllers
{
    public class PhanHoiController : Controller
    {
        //
        // GET: /PhanHoi/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Subcribe(string mail)
        {
            ViewBag.namemail = mail;
            return View();
        }
	}
}