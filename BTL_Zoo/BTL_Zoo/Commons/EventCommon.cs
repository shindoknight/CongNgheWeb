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
        public IEnumerable<SuKien> ListEvent(int page, int pagesize)
        {
            return db.SuKiens.OrderByDescending(x => x.Thoigian).ToPagedList(page, pagesize);
        }
        public EventCommon()
        {
            db = new Zoo();
        }
        public bool Add(SuKien eve)
        {
            try
            {
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
                db.SuKiens.Remove(_event);
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