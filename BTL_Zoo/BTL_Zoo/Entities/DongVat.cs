namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DongVat")]
    public partial class DongVat
    {
        [Key]
        public int MaDV { get; set; }

        [StringLength(50)]
        public string TenDV { get; set; }

        [StringLength(50)]
        public string TenKH { get; set; }

        [StringLength(50)]
        public string Ho { get; set; }

        [StringLength(50)]
        public string Bo { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }
        public string GioiThieu { set; get; }

        [StringLength(100)]
        public string ThucAn { get; set; }
        
        public string NguonGoc { set; get; }
        public string ChieuCao { set; get; }
        public string CanNang { set; get; }
        public string NoiSinhSong { set; get; }
        public int? MaVe { set; get; }



    }
}
