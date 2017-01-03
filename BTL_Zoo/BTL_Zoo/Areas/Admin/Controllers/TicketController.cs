using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Commons;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class TicketController : Controller
    {
        //
        // GET: /Admin/Ticket/
        public ActionResult Index(string tkstring,int page=1, int pagesize=5)
        {
            var model = new TicketCommon().ListTicket(tkstring,page, pagesize);
            ViewBag.tk = tkstring;
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Ve eve)
        {
            if (ModelState.IsValid)
            {
                TicketCommon ticket = new TicketCommon();
                if (ticket.Add(eve))
                {
                    ModelState.AddModelError("", "Thêm Thành công!");
                    return Redirect("/Admin/Ticket/Index");
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
            Ve model = new TicketCommon().GetVeByID(id);
            return View(model);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Ve eve)
        {
            if (new TicketCommon().EditTicket(eve))
            {
                ModelState.AddModelError("", "sửa Thành công!");
                return Redirect("/Admin/Ticket/Index");
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
            TicketCommon dao = new TicketCommon();
            bool result = dao.Delete(id);
            if (result)
            {
                ModelState.AddModelError("", "Xóa Thành công!");

            }
            else
            {
                ModelState.AddModelError("", "xóa không thành công");
            }
            return RedirectToAction("Index", "Ticket");

        }
	}
}