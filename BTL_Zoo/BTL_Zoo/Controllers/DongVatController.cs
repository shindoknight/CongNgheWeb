using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BTL_Zoo.Entities;

namespace BTL_Zoo.Controllers
{
    public class DongVatController : Controller
    {
        Zoo db = new Zoo();
        //
        // GET: /DongVat/
        public ActionResult Index()
        {
            return View(db.DongVats.ToList());
        }
        public ActionResult TimKiemNhanh(string txtTenDv)
        {
            List<DongVat> tblDongvat = db.DongVats.Where(x=>x.TenDV.Contains(txtTenDv)).ToList();
            return View("Index",tblDongvat);
        }
        


        public ActionResult TimKiem(FormCollection f)
        {

            string txtTimkiem = f["txtTimKiem"].ToString();
//             int madv = int.Parse(txtTimkiem);
//             List<DongVat> lstDongVat = db.DongVats.SqlQuery("Select * from DongVat where MaDV= '{0}", madv).ToList<DongVat>();
            List<DongVat> lstDongVat = db.DongVats.Where(n=>n.TenDV.Contains(txtTimkiem)).ToList();
            return View("Index",lstDongVat);
        }
	}
}