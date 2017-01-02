namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTDatVe")]
    public partial class CTDatVe
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDatVe { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaVe { get; set; }

        public int? SoLuong { get; set; }

        public DateTime? NgayDatve { get; set; }

        public int? TreGia { get; set; }

        public virtual DatVe DatVe { get; set; }

        public virtual Ve Ve { get; set; }
    }
}
