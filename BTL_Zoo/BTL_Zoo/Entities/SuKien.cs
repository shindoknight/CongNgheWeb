namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SuKien")]
    public partial class SuKien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SuKien()
        {
            PhanHois = new HashSet<PhanHoi>();
        }

        [Key]
        public int IDEvent { get; set; }

        [StringLength(100)]
        public string TieuDe { get; set; }

        [StringLength(100)]
        public string TomTat { get; set; }

        [StringLength(100)]
        public string NoiDung { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        public DateTime? Thoigian { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhanHoi> PhanHois { get; set; }
    }
}
