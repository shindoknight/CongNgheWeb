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

        [Column(TypeName = "ntext")]
        public string GioiThieu { get; set; }

        [StringLength(50)]
        public string ThucAn { get; set; }

        [StringLength(50)]
        public string NguonGoc { get; set; }

        public double? ChieuCao { get; set; }

        public double? CanNang { get; set; }

        [StringLength(50)]
        public string NoiSinhSong { get; set; }

        public int? MaVe { get; set; }

        public virtual Ve Ve { get; set; }
    }
}
