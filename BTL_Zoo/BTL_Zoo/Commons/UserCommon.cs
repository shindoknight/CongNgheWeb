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
        public IEnumerable<Login> ListUser(int page, int pagesize)
        {
            return db.Logins.OrderByDescending(x=>x.UserName).ToPagedList(page, pagesize);
        }
        public UserCommon()
        {
            db = new Zoo();
        }
        public int Insert(Login user,KhachHang kh)
        {
            if(db.Logins.SingleOrDefault(n=>n.UserName==user.UserName)==null)
            {
                db.KhachHangs.Add(kh);
                db.SaveChanges();
                List<KhachHang> LsKH = db.KhachHangs.OrderByDescending(x => x.MaKH).ToList();
                user.MaKH = LsKH[0].MaKH;
                db.Logins.Add(user);
                db.SaveChanges();
                return 1;
              
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
                db.KhachHangs.Remove(kh);
                db.Logins.Remove(us);
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