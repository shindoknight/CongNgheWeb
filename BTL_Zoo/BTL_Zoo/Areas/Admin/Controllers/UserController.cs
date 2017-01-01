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
        public ActionResult  CreateAction (string user, string pass, int group,string diachi, string ngaysinh, string hoten, string email, string sdt,string CMND)
        {
            Login us = new Login();
            us.UserName = user;
            us.PassWord = pass;
            us.Group = group;
            KhachHang kh = new KhachHang();
            kh.HoTen = hoten;
           // kh.NgaySinh = DateTime.Parse(ngaysinh,"dd/mm/yyyy");
            kh.Email = email;
            kh.SDT = sdt;
            kh.DiaChi = diachi;
            var dao = new UserCommon();
            int n=dao.Insert(us,kh);
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
        public ActionResult Edit(string username)
        {
            var dao = new UserCommon();
            Login user = dao.GetByUsername(username);
            ViewBag.username = username;
            return View(user);
        }
        public ActionResult EditAction(string user, string pass, int group, string diachi, string hoten, string email, string sdt,string CMND)
        {
            Login model = new Login();
            model.UserName = user;
            model.PassWord = pass;
            model.Group = group;
            KhachHang kh = new KhachHang();
            kh.HoTen = hoten;
            kh.DiaChi = diachi;
            kh.Email = email;
            kh.SDT = sdt;
            kh.CMND = CMND;
            UserCommon dao= new UserCommon();
            bool kt= dao.Edit(model, kh);
            if (kt)
            {
                ModelState.AddModelError("", "Sửa tài khoản thành công!");
                return RedirectToAction("Index", "User");
                
            }
            else
            {
                ModelState.AddModelError("", "Sửa không thành công");
                return View("Edit/?username="+user,"User");
            }
            
        }
        [HttpDelete]
        public ActionResult Delete(string username)
        {
            UserCommon dao = new UserCommon();
            bool result= dao.Delete(username);
            if (result)
            {
                ModelState.AddModelError("", "Xóa Thành công!");
                return RedirectToAction("Index", "User");

            }
            else
            {
                ModelState.AddModelError("", "xóa không thành công");
                return RedirectToAction("Index", "User");
            }

        }
	}
}