using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;
using BTL_Zoo.Commons;
namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        Entities.Zoo model = new Entities.Zoo();
        //
        // GET: /Admin/User/
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
        public void  CreateAction (string user, string pass, int group)
        {
            Login us = new Login();
            us.UserName = user;
            us.PassWord = pass;
            us.Group = group;
            var dao = new UserCommon();
            int n=dao.Insert(us);
            if(n==-1)
            {

                ModelState.AddModelError("", "Tài khoản đã tồn tại");
            }
            else
            {
                ModelState.AddModelError("", "Thêm tài khoản thành công!");
                //return RedirectToAction("Index", "User");
            }
            
        }
	}
}