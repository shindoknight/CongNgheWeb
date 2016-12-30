namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanHoi")]
    public partial class PhanHoi
    {
        public int ID { get; set; }

        public int? MaKH { get; set; }

        public DateTime? ThoiGian { get; set; }

        [StringLength(1000)]
        public string NoiDung { get; set; }

        public int? IDEvent { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual SuKien SuKien { get; set; }
    }
}
