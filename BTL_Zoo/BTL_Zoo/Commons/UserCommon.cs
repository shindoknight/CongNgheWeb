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
        public int Insert(Login user)
        {
            if(db.Logins.SingleOrDefault(n=>n.UserName==user.UserName)==null)
            {
                db.Logins.Add(user);
                db.SaveChanges();
                return 1;
              
            }
            else
            {
                return -1; //tên đăng nhập đã tồn tại
            }
            
        }
        public bool Edit(Login user)
        {
            try
            {
                Login us = db.Logins.Find(user.UserName);
                us.UserName = user.UserName;
                us.PassWord = user.PassWord;
                us.Group = user.Group;
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
            
        }
        
    }
}