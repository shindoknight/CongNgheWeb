using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;
using BTL_Zoo.Commons;
using PagedList;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        Entities.Zoo model = new Entities.Zoo();
        //
        // GET: /Admin/User/
        public ActionResult Index(int page=1, int pagesize=10)
        {
            var dao = new UserCommon();
            var model = dao.ListUser(page, pagesize);
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        public ActionResult  CreateAction (string user, string pass, int group, string hoten, string ngaysinh, string email, string sdt)
        {
            Login us = new Login();
            us.UserName = user;
            us.PassWord = pass;
            us.Group = group;
            KhachHang kh = new KhachHang();
            kh.HoTen = hoten;
            kh.NgaySinh = DateTime.Parse(ngaysinh);
            kh.Email = email;
            kh.SDT = sdt;
            var dao = new UserCommon();
            int n=dao.Insert(us);
            if(n==-1)
            {

                ModelState.AddModelError("", "Tài khoản đã tồn tại");
                return View("Create");
            }
            else
            {
                ModelState.AddModelError("", "Thêm tài khoản thành công!");
                return RedirectToAction("Index", "User");
            }
            
        }
        public ActionResult Edit(string username, string pass, int group)
        {
            Login model = new Login();
            model.UserName = username;
            model.PassWord = pass;
            model.Group = group;
            return View();
        }
	}
}