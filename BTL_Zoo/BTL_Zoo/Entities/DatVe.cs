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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DatVe()
        {
            CTDatVes = new HashSet<CTDatVe>();
        }

        [Key]
        public int MaDatVe { get; set; }

        public int? MaKH { get; set; }

        public decimal? TongTien { get; set; }

        public int? DaThanhToan { get; set; }

        public DateTime? NgayDat { get; set; }

        public int? DaGui { get; set; }

        [StringLength(100)]
        public string DiaChiGui { get; set; }

        public int DaXoa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDatVe> CTDatVes { get; set; }

        public virtual KhachHang KhachHang { get; set; }
    }
}
