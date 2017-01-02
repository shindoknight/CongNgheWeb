namespace BTL_Zoo.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Login")]
    public partial class Login
    {
        [Key]
        [StringLength(50)]
        [Required(ErrorMessage = "Tên đăng nhập không được rỗng")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Tên đăng nhập không được rỗng")]
        public string PassWord { get; set; }

        public int? MaKH { get; set; }
        [Range(1, 150)]
        public int? Group { get; set; }

        public virtual KhachHang KhachHang { get; set; }
    }
}
