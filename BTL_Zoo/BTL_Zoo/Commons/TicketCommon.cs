using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
using PagedList;
namespace BTL_Zoo.Commons
{
    public class TicketCommon
    {
        Zoo db = null;
        public IEnumerable<Ve> ListTicket(int page, int pagesize)
        {
            return db.Ves.OrderBy(x => x.TenVe).ToPagedList(page, pagesize);
        }
        public IEnumerable<DatVe> ListBuyTicket(int page, int pagesize, int k)
        {
            var model=db.DatVes.OrderByDescending(x => x.NgayDat);
            if(k==1)
            {
                return model.ToPagedList(page,pagesize);
            }
            else
            {
                if(k==2)
                    return model.Where(x => x.DaThanhToan == 0).ToPagedList(page, pagesize);
                else
                    return model.Where(x => x.DaGui == 0).ToPagedList(page, pagesize);
            }
                
        }

        public TicketCommon()
        {
            db = new Zoo();

        }
        public DatVe GetDatVeByID(int id)
        {
            return db.DatVes.Find(id);
        }
        public bool DaGui(int id)
        {
            try
            {
                var ve = db.DatVes.Find(id);
                ve.DaGui = 1;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }

        }
        public int DaThanhToan(int id)
        {
            try
            {
                var ve = db.DatVes.Find(id);
                if (ve.DaThanhToan == 1)
                    return -1;
                else
                {
                    ve.DaThanhToan = 1;
                    db.SaveChanges();
                    return 1;
                }
                
            }
            catch
            {
                return 0;
            }

        }
    }
}