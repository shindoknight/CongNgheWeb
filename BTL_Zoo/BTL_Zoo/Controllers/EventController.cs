using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Controllers
{
    public class EventController : Controller
    {
        //
        // GET: /Event/
        Entities.Zoo mo = new Entities.Zoo();
        public ActionResult Index()
        {
           
            return View(mo.SuKiens.ToList());
        }
        public ActionResult Detail(int id)
        {
            SuKien eve = mo.SuKiens.Find(id);
            return View(eve);
        }
	}
}