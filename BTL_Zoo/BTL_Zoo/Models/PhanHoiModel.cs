using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BTL_Zoo.Entities;
namespace BTL_Zoo.Models
{
    
    public class PhanHoiModel
    {
        private Zoo _zoo = null;
        public PhanHoiModel()
        {
            _zoo = new Zoo();
        }
        public List<PhanHoi2> ListAll()
        {
            var ls = _zoo.Database.SqlQuery<PhanHoi2>("sp_PhanHoi_ListAll").ToList();
            return ls;
        }
    }
}