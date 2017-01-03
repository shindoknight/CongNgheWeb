using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
using PagedList;
namespace BTL_Zoo.Commons
{
    public class UserCommon
    {
        Zoo db = null;
        public IEnumerable<Login> ListUser(string tk,int page, int pagesize)
        {
           
            if(!string.IsNullOrEmpty(tk))
            {
                var model = db.Logins.OrderByDescending(x => x.UserName).Where(x => x.DaXoa == 0);

                return model.Where(x => x.UserName.Contains(tk) || x.KhachHang.HoTen.Contains(tk)).ToPagedList(page, pagesize);
            }
            return db.Logins.OrderByDescending(x => x.UserName).Where(x => x.DaXoa == 0).ToPagedList(page, pagesize);
        }
        public UserCommon()
        {
            db = new Zoo();
        }
        public int Insert(Login user,KhachHang kh)
        {
            if(db.Logins.SingleOrDefault(n=>n.UserName==user.UserName)==null)
            {
                try
                {
                    db.KhachHangs.Add(kh);
                    db.SaveChanges();
                    List<KhachHang> LsKH = db.KhachHangs.OrderByDescending(x => x.MaKH).ToList();
                    user.MaKH = LsKH[0].MaKH;
                    user.DaXoa = 0;
                    db.Logins.Add(user);
                    db.SaveChanges();
                    return 1;
                }
                catch
                {
                    return 0;
                }
                
              
            }
            else
            {
                return -1; //tên đăng nhập đã tồn tại
            }
            
        }
        public Login GetByUsername(string username)
        {
            return db.Logins.Find(username);
        }
        public bool Edit(Login user,KhachHang khachhang)
        {
            try
            {
                Login us = db.Logins.Find(user.UserName);
                us.UserName = user.UserName;
                us.PassWord = user.PassWord;
                us.Group = user.Group;
                KhachHang kh = new KhachHang();
                kh = db.KhachHangs.Find(us.MaKH);
                kh.HoTen = khachhang.HoTen;
                kh.NgaySinh = khachhang.NgaySinh;
                kh.DiaChi = khachhang.DiaChi;
                kh.CMND = khachhang.CMND;
                kh.SDT = khachhang.SDT;
                kh.Email = khachhang.Email;
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
            
        }
        public bool Delete(string username)
        {
            try
            {
                Login us = db.Logins.Find(username);
                KhachHang kh = db.KhachHangs.Find(us.MaKH);
                // db.Database.SqlQuery<DatVe>("update DatVe set DaXoa=1 where MaKH=" + kh.MaKH.ToString());
                 //db.Database.SqlQuery<CTDatVe>("update CTDatVe set DaXoa=1 where MaDatVe in (select MaDatVe from DatVe where DaXoa=1)");
                kh.DaXoa = 1;
                us.DaXoa=1;
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