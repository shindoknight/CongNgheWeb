using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Commons
{
    public class UserCommon
    {
        Zoo db = null;
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
        
    }
}