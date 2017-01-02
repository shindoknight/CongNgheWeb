using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        Entities.Zoo mod = new Entities.Zoo();
        //Entities.Zoo1 mod2 = new Entities.Zoo1();
        public ActionResult Index()
        {
            ListZoo list = new ListZoo();
            list.LsDongVat = mod.DongVats.ToList();
            list.LsSuKien = mod.SuKiens.ToList();
            var ph = new Models.PhanHoiModel();
            list.LsPhanHoi =ph.ListAll();
            return View(list);
        }
       
	}
}