namespace BTL_Zoo.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Zoo : DbContext
    {
        public Zoo()
            : base("name=Zoo2")
        {
        }

        public virtual DbSet<CTDatVe> CTDatVes { get; set; }
        public virtual DbSet<DatVe> DatVes { get; set; }
        public virtual DbSet<DongVat> DongVats { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<SuKien> SuKiens { get; set; }
        public virtual DbSet<Ve> Ves { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DatVe>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Ve>()
                .Property(e => e.GiaTien)
                .HasPrecision(18, 0);
        }
    }
}
