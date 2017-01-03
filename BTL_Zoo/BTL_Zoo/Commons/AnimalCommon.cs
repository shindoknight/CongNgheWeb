using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
using PagedList;
namespace BTL_Zoo.Commons
{
    public class AnimalCommon
    {
        Zoo db = null;
        public IEnumerable<DongVat> ListAnimal(string tk,int page, int pagesize)
        {
            if (!string.IsNullOrEmpty(tk))
            {
                var model = db.DongVats.OrderByDescending(x => x.TenDV).Where(x => x.DaXoa == 0);

                return model.Where(x => x.TenDV.Contains(tk) || x.TenKH.Contains(tk)).ToPagedList(page, pagesize);
            }
            return db.DongVats.OrderBy(x => x.TenDV).Where(x => x.DaXoa == 0).ToPagedList(page, pagesize);
        }
        public AnimalCommon()
        {
            db = new Zoo();
        }
        public bool Add(DongVat eve)
        {
            try
            {
                eve.DaXoa = 1;
                db.DongVats.Add(eve);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public DongVat GetByID(int id)
        {
            return db.DongVats.Find(id);
        }
        public bool Edit(DongVat eve)
        {
            try
            {
                DongVat _dongvat = new DongVat();
                _dongvat = db.DongVats.Find(eve.MaDV);
                _dongvat.TenDV = eve.TenDV;
                _dongvat.TenKH = eve.TenKH;
                _dongvat.ThucAn = eve.ThucAn;
                _dongvat.NguonGoc = eve.NguonGoc;
                _dongvat.NoiSinhSong = eve.NoiSinhSong;
                _dongvat.Ho = eve.Ho;
                _dongvat.Bo = eve.Bo;
                _dongvat.CanNang = eve.CanNang;
                _dongvat.ChieuCao = eve.ChieuCao;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                DongVat _event = new DongVat();
                _event = db.DongVats.Find(id);
                _event.DaXoa = 1;
                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }
    }
}