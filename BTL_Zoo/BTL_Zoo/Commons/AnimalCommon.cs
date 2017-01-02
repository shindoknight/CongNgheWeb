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
        public IEnumerable<DongVat> ListAnimal(int page, int pagesize)
        {
            return db.DongVats.OrderBy(x => x.TenDV).ToPagedList(page, pagesize);
        }
        public AnimalCommon()
        {
            db = new Zoo();
        }
        public bool Add(DongVat eve)
        {
            try
            {
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
                db.DongVats.Remove(_event);
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