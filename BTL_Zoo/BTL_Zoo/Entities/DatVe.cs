namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DatVe")]
    public partial class DatVe
    {
        [Key]
        public int MaDatVe { get; set; }

        public int? MaKH { get; set; }

        public decimal? TongTien { get; set; }
    }
}
