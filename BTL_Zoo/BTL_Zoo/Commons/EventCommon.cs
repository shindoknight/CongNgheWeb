using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
using PagedList;
namespace BTL_Zoo.Commons
{
    public class EventCommon
    {
        Zoo db = null;
        public IEnumerable<SuKien> ListEvent(string tk,int page, int pagesize)
        {
            if (!string.IsNullOrEmpty(tk))
            {
                var model = db.SuKiens.OrderByDescending(x => x.Thoigian).Where(x => x.DaXoa == 0);

                return model.Where(x => x.TieuDe.Contains(tk) || x.TomTat.Contains(tk)).ToPagedList(page, pagesize);
            }
            return db.SuKiens.OrderByDescending(x => x.Thoigian).Where(x => x.DaXoa == 0).ToPagedList(page, pagesize);
        }
        public EventCommon()
        {
            db = new Zoo();
        }
        public bool Add(SuKien eve)
        {
            try
            {
                eve.DaXoa = 1;
                db.SuKiens.Add(eve);
                db.SaveChanges();
                return true;
            }
           catch
            {
                return false;
            }
        }
        public SuKien GetByID(int id)
        {
            return  db.SuKiens.Find(id);
        }
        public bool Edit(SuKien eve)
        {
            try
            {
                SuKien _event = new SuKien();
                _event = db.SuKiens.Find(eve.IDEvent);
                _event.TieuDe = eve.TieuDe;
                _event.HinhAnh = eve.HinhAnh;
                _event.Thoigian = eve.Thoigian;
                _event.TomTat = eve.TomTat;
                _event.NoiDung = eve.NoiDung;
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
                SuKien _event = new SuKien();
                _event = db.SuKiens.Find(id);
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