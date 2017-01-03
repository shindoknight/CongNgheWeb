namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ve")]
    public partial class Ve
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ve()
        {
            CTDatVes = new HashSet<CTDatVe>();
            DongVats = new HashSet<DongVat>();
        }

        [Key]
        public int MaVe { get; set; }

        [StringLength(50)]
        public string TenVe { get; set; }

        public decimal? GiaTien { get; set; }

        public int? LoaiVe { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayCapNhatGiaVe { get; set; }

        [StringLength(100)]
        public string AnhVe { get; set; }

        [Column(TypeName = "ntext")]
        public string ThongTinCTVe { get; set; }

        [Column(TypeName = "ntext")]
        public string TomTatVe { get; set; }

        public decimal? GiaMoiTreEm { get; set; }

        public decimal? GiaMoiNguoiLon { get; set; }

        public decimal? GiaCuTreEm { get; set; }

        public decimal? GiaCuNguoiLon { get; set; }

        public decimal? SLVe { get; set; }

        public decimal? SLDaMua { get; set; }

        public int DaXoa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDatVe> CTDatVes { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DongVat> DongVats { get; set; }
    }
}
