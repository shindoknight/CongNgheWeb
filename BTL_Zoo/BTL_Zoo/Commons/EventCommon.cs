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
    }
}