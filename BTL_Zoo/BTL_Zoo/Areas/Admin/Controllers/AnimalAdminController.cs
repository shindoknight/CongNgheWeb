using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;
using BTL_Zoo.Commons;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class AnimalAdminController : Controller
    {
        //
        // GET: /Admin/AnimalAdmin/
        public ActionResult Index(int page = 1, int pagesize = 10)
        {
            var dao = new AnimalCommon();
            var model = dao.ListAnimal(page, pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(DongVat animal)
        {
            if (ModelState.IsValid)
            {
                AnimalCommon _ani = new AnimalCommon();
                _ani.Add(animal);
                return Redirect("/Admin/AnimalAdmin/Index");
            }
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            DongVat model = new AnimalCommon().GetByID(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(DongVat eve)
        {
            if (new AnimalCommon().Edit(eve))
            {
                ModelState.AddModelError("", "Sửa Thành công!");
                return Redirect("/Admin/EventAdmin/Index");
            }
            else
            {
                ModelState.AddModelError("", "xóa không thành công");
                return View();
            }
           
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            AnimalCommon dao = new AnimalCommon();
            bool result = dao.Delete(id);
            if (result)
            {
                ModelState.AddModelError("", "Xóa Thành công!");

            }
            else
            {
                ModelState.AddModelError("", "xóa không thành công");
            }
            return RedirectToAction("Index", "User");

        }
	}
}