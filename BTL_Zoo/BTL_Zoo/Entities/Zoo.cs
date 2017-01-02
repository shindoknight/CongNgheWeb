namespace BTL_Zoo.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Zoo : DbContext
    {
        public Zoo()
            : base("name=Zoo")
        {
        }

        public virtual DbSet<CTDatVe> CTDatVes { get; set; }
        public virtual DbSet<DatVe> DatVes { get; set; }
        public virtual DbSet<DongVat> DongVats { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Login> Logins { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<SuKien> SuKiens { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Ve> Ves { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DatVe>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<DatVe>()
                .HasMany(e => e.CTDatVes)
                .WithRequired(e => e.DatVe)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Ve>()
                .Property(e => e.GiaTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Ve>()
                .Property(e => e.GiaMoiTreEm)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Ve>()
                .Property(e => e.GiaMoiNguoiLon)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Ve>()
                .Property(e => e.GiaCuTreEm)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Ve>()
                .Property(e => e.GiaCuNguoiLon)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Ve>()
                .HasMany(e => e.CTDatVes)
                .WithRequired(e => e.Ve)
                .WillCascadeOnDelete(false);
        }
    }
}
