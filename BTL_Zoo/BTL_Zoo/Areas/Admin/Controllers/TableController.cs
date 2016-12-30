using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTL_Zoo.Areas.Admin.Controllers
{
    public class TableController : Controller
    {
        Entities.Zoo model = new Entities.Zoo();
        //
        // GET: /Admin/Table/
        public ActionResult Index()
        {
            Entities.ListZoo LsZoo = new Entities.ListZoo();
            LsZoo.LsDongVat = model.DongVats.ToList();
            LsZoo.LsSuKien = model.SuKiens.ToList();
            LsZoo.LsVe = model.Ves.ToList();
            LsZoo.LsAccount = model.Logins.ToList();
            return View(LsZoo);
        }

        //
        // GET: /Admin/Table/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Admin/Table/Create
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Admin/Table/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/Table/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Admin/Table/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Admin/Table/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Admin/Table/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
