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
        public ActionResult TimKiemNhanh(string txtdongVat)
        {
            List<DongVat> tblDongvat = db.DongVats.Where(x => x.TenDV.Contains(txtdongVat)).ToList();
            //List<DongVat> tblDongvat = db.DongVats.SqlQuery("Select * from DongVat where TenDV ={0}", txtdongVat).ToList();
            return View("Index", tblDongvat);
        }


        [HttpPost]
        public ActionResult TimKiemDongVat(string TenDv, string TenKH, string ThucAn, string NguonGoc, string ChieuCao)
        {
            List<DongVat> tblDongVat = db.DongVats.Where(x => x.TenDV.Contains(TenDv) && x.TenKH.Contains(TenKH) && x.ThucAn.Contains(ThucAn) && x.NguonGoc.Contains(NguonGoc) && x.ChieuCao.Contains(ChieuCao)).ToList();
            //List<DongVat> tblDongVat = db.DongVats.SqlQuery("");

            return View("Index", tblDongVat);
        }
        
        public ActionResult ThongTinChiTiet(int maDv)
        {
            List<DongVat> record = db.DongVats.Where(x => x.MaDV == maDv).ToList();
            if (record == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(record.ToList());
        }
    }
}