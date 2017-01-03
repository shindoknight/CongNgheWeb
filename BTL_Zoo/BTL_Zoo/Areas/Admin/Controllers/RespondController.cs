using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class RespondController : Controller
    {
        //
        // GET: /Admin/Respond/
        public ActionResult Index(string tkstring, int page=1,int pagesize=10)
        {
           // var model;
            return View();
        }
	}
}