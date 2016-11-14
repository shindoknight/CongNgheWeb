using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_Zoo.Entities
{
    public class ListZoo
    {
        public List<DongVat> LsDongVat { get; set; }
        public List<SuKien> LsSuKien { get; set; }
        public List<PhanHoi> LsPhanHoi { get; set; }
        
    }
}