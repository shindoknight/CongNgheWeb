namespace BTL_Zoo.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Zoo1 : DbContext
    {
        public Zoo1()
            : base("name=Zoo1")
        {
        }

        public virtual DbSet<PhanHoi> PhanHois { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PhanHoi>()
                .Property(e => e.NoiDung)
                .IsFixedLength();
        }
    }
}
