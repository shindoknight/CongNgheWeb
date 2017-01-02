using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Commons;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class BuyTicketController : Controller
    {
        //
        // GET: /Admin/BuyTicket/
        public ActionResult Index(int? k=1, int page = 1, int pagesize = 10)
        {
            int tk = 1;
            var dao = new TicketCommon();
            if (k == 1)
            {
                ViewBag.tit = "Danh sách vé thanh toán";
                tk = 1;

            }
            else if (k == 2)
            {
                ViewBag.tit="Danh sách vé chưa thanh toán";
                 tk = 2;
            }
            else
            {
                ViewBag.tit="Danh sách vé chưa GỬI ĐI";
                tk = 3;
            }
             var model = dao.ListBuyTicket(page, pagesize,tk);
            return View(model);
        }
        public ActionResult DaGui(int id)
        {
            var dao = new TicketCommon();
            bool kt = dao.DaGui(id);
            if (kt)
            {
                ModelState.AddModelError("", "Sửa thành công!");

            }
            else
            {
                ModelState.AddModelError("", "sửa không thành công");
            }
            return RedirectToAction("Index", "BuyTicket");
        }
        public ActionResult DaThanhToan(int id)
        {
            var dao = new TicketCommon();
           int kt = dao.DaThanhToan(id);
            if (kt==1)
            {
                ModelState.AddModelError("", "Sửa thành công!");

            }
            else
            {
                if(kt==0)
                ModelState.AddModelError("", "sửa không thành công");
                else
                    ModelState.AddModelError("", "Vé đã được thanh toán");

            }
            return RedirectToAction("Index","BuyTicket");
        }
	}
}