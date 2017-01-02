using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Commons;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class EventAdminController : Controller
    {
        //
        // GET: /Admin/Event/
        public ActionResult Index(int page=1,int pagesize=10)
        {
            var dao = new EventCommon();
            var model = dao.ListEvent(page, pagesize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(SuKien eve)
        {
            if(ModelState.IsValid)
            {
                EventCommon _event = new EventCommon();
                if (_event.Add(eve))
                {
                    ModelState.AddModelError("", "Thêm Thành công!");
                    return Redirect("/Admin/EventAdmin/Index");
                }
                else
                {
                    ModelState.AddModelError("", "sửa Thành công!");
                    return View();
                }
                
            }
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            SuKien model = new EventCommon().GetByID(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(SuKien eve)
        {
            if(new EventCommon().Edit(eve))
            {
                ModelState.AddModelError("", "sửa Thành công!");
                return Redirect("/Admin/EventAdmin/Index");
            }
            else
            {
                ModelState.AddModelError("", "sửa không thành công");
                return View();
            }
            
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            EventCommon dao = new EventCommon();
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