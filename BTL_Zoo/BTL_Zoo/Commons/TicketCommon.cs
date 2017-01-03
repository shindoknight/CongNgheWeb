using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
using PagedList;
using System.Data.SqlClient;
namespace BTL_Zoo.Commons
{
    public class TicketCommon
    {
        Zoo db = null;
        public IEnumerable<Ve> ListTicket(string tk,int page, int pagesize)
        {
            if (!string.IsNullOrEmpty(tk))
            {
                var model = db.Ves.OrderByDescending(x => x.TenVe).Where(x => x.DaXoa == 0);

                return model.Where(x => x.TenVe.Contains(tk)).ToPagedList(page, pagesize);
            }
            return db.Ves.OrderBy(x => x.TenVe).Where(x=>  x.DaXoa == 0).ToPagedList(page, pagesize);
        }
        public IEnumerable<DatVe> ListBuyTicket(string tk,int page, int pagesize, int k)
        {
            var model=db.DatVes.OrderByDescending(x => x.NgayDat);
            if(k==1)
            {
                if (!string.IsNullOrEmpty(tk))
                {
                    

                    return model.Where(x => x.KhachHang.HoTen.Contains(tk) && x.DaXoa==0).ToPagedList(page, pagesize);
                }
                return model.Where(x => x.DaXoa == 0).ToPagedList(page,pagesize);
            }
            else
            {
                if(k==2)
                    return model.Where(x => x.DaThanhToan == 0 &&  x.DaXoa == 0).ToPagedList(page, pagesize);
                else
                    return model.Where(x => x.DaGui == 0 && x.DaXoa == 0).ToPagedList(page, pagesize);
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
        public Ve GetVeByID(int id)
        {
            return db.Ves.Find(id);
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
        public bool EditTicket(Ve eve)
        {
            try
            {
                Ve ticket = new Ve();
                ticket = db.Ves.Find(eve.MaVe);
                ticket.TenVe = eve.TenVe;
                ticket.LoaiVe = eve.LoaiVe;
                ticket.GiaMoiNguoiLon = eve.GiaMoiNguoiLon;
                ticket.GiaMoiTreEm = eve.GiaCuTreEm;
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
                Ve ticket = new Ve();
                ticket = db.Ves.Find(id);
                ticket.DaXoa = 1;
                db.SaveChanges();
                return true;

            }
            catch(Exception ex)
            {
                return false;
            }
        }
        public bool Add(Ve eve)
        {
            try
            {
                eve.DaXoa = 1;
                db.Ves.Add(eve);
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