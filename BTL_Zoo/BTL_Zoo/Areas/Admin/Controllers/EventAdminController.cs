using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Commons;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class EventAdminController : Controller
    {
        //
        // GET: /Admin/Event/
        public ActionResult Index(int page=1,int pagesize=2)
        {
            var dao = new EventCommon();
            var model = dao.ListEvent(page, pagesize);
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
	}
}