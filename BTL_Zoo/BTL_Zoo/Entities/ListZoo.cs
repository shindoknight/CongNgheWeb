using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL_Zoo.Entities
{
    public class ListZoo
    {
        public List<DongVat> LsDongVat { set; get; }
        public List<SuKien> LsSuKien { set; get; }
        public List<Ve> LsVe { set; get; }
        public List<Login> LsAccount { get; set; }
        public List<PhanHoi2> LsPhanHoi { set; get; }
    }
}