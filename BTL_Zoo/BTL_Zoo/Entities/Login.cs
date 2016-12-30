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
        [Display(Name="Tên tài khoản")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Display(Name="Mật khẩu")]
        public string PassWord { get; set; }
        
        public int? MaKH { get; set; }
        [Display(Name = "Phân quyền")]
        public int? Group { get; set; }

        public virtual KhachHang KhachHang { get; set; }
    }
}
