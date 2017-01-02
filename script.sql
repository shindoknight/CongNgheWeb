USE [master]
GO
/****** Object:  Database [CongNgheWeb_Zoo]    Script Date: 2017-01-02 11:35:10 AM ******/
CREATE DATABASE [CongNgheWeb_Zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CongNgheWeb_Zoo', FILENAME = N'D:\1-Study\4-HK6\lap trinh web\CongNgheWeb_Zoo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CongNgheWeb_Zoo_log', FILENAME = N'D:\1-Study\4-HK6\lap trinh web\CongNgheWeb_Zoo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CongNgheWeb_Zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET  MULTI_USER 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CongNgheWeb_Zoo]
GO
/****** Object:  StoredProcedure [dbo].[sp_PhanHoi_ListAll]    Script Date: 2017-01-02 11:35:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PhanHoi_ListAll]
as
select a.ID,HoTen,a.Thoigian,a.NoiDung from PhanHoi a,KhachHang b where a.MaKH=b.MaKH 
order by a.ID desc
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaTK]    Script Date: 2017-01-02 11:35:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SuaTK] (@username nvarchar(50),@password nvarchar(50),@group int, @hoten nvarchar(50), @ngaysinh date,@diachi nvarchar(50),@CMND nvarchar(50),@sdt nvarchar(50),@email nvarchar(50))
as 
begin
	declare @makh int
	select @makh=makh from Login where UserName=@username
	update [Login] set PassWord=@password,[Group]=@group where UserName=@username
	update KhachHang set HoTen=@hoten,NgaySinh=@ngaysinh,DiaChi=@diachi,CMND=@CMND,SDT=@sdt,Email=@email where MaKH=@makh
end
GO
/****** Object:  Table [dbo].[CTDatVe]    Script Date: 2017-01-02 11:35:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDatVe](
	[MaDatVe] [int] NOT NULL,
	[MaVe] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[NgayDatve] [datetime] NULL,
	[TreGia] [int] NULL,
 CONSTRAINT [PK_CTDatVe] PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC,
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatVe]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatVe](
	[MaDatVe] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[DaThanhToan] [int] NULL,
 CONSTRAINT [PK_DatVe] PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongVat]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongVat](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](50) NULL,
	[TenKH] [nvarchar](50) NULL,
	[Ho] [nvarchar](50) NULL,
	[Bo] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[GioiThieu] [ntext] NULL,
	[ThucAn] [nvarchar](50) NULL,
	[NguonGoc] [nvarchar](50) NULL,
	[ChieuCao] [float] NULL,
	[CanNang] [float] NULL,
	[NoiSinhSong] [nvarchar](50) NULL,
	[MaVe] [int] NULL,
 CONSTRAINT [PK_DongVat] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[CMND] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
	[Group] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[ThoiGian] [datetime] NULL,
	[NoiDung] [nvarchar](1000) NULL,
	[HienThi] [int] NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuKien]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuKien](
	[IDEvent] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NULL,
	[TomTat] [nvarchar](500) NULL,
	[NoiDung] [ntext] NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[Thoigian] [datetime] NULL,
 CONSTRAINT [PK_SuKien] PRIMARY KEY CLUSTERED 
(
	[IDEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ve]    Script Date: 2017-01-02 11:35:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[TenVe] [nvarchar](50) NULL,
	[GiaTien] [decimal](18, 0) NULL,
	[LoaiVe] [int] NULL,
	[GiaMoiTreEm] [int] NULL,
	[GiaMoiNguoiLon] [int] NULL,
	[GiaCuTreEm] [int] NULL,
	[GiaCuNguoiLon] [int] NULL,
	[ThuTu] [int] NULL,
	[SLVe] [int] NULL,
	[SLDaMua] [int] NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DongVat] ON 

INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (1, N'Cá heo', N'Dolphin', N'abc', N'abc', N'gallery-dolphin.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiếHiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…t bị y tế,…', N'dsg', N'dfg', 3, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (2, N'Voi Tây Nguyên', N'Elephant', N'xyz', N'xyz', N'gallery-elephant.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiếtHiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,… bị y tế,…', N'sdgs', N'gds', 4, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (3, N'Tinh tinh', N'Gorilla', NULL, NULL, N'gallery-gorilla.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bHiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…ị y tế,…', N'sdg', N'gs', 32, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (4, N'Tùa tai đỏ', N'Turle', NULL, NULL, N'gallery-turtle.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…bị y tế,…', N'sd', N'gdf', NULL, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (5, N'Bướm xanh', N'butter fly', NULL, NULL, N'gallery-blue-butterfly.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…', N'sf', N'gdsf', NULL, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (6, N'Sư tử Châu phi', NULL, NULL, NULL, N'gallery-lion.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…', N'dg', N'gds', NULL, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (7, N'Cú Anh Quốc', NULL, NULL, NULL, N'gallery-owl.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…', NULL, N'gsd', NULL, NULL, NULL, NULL)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe]) VALUES (8, N'Chim cánh cụt', NULL, NULL, NULL, N'gallery-penguin.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[DongVat] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email]) VALUES (1, N'Bạch Ngọc Hiệp', CAST(0xC71D0B00 AS Date), N'250993576', N'Lâm Đồng', N'0909000000', N'bachngochieph2@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email]) VALUES (3, N'Trần Mạnh Linh', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email]) VALUES (5, N'bạch ngoc hiệp', NULL, NULL, NULL, N'01234', N'bachngochieph2@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email]) VALUES (6, N'abc', NULL, NULL, N'hà nội', N'987', N'em@gmail.com')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group]) VALUES (N'admin1', N'1234', 1, 1)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group]) VALUES (N'admin3', N'1234', 3, 1)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group]) VALUES (N'bnh', N'', 5, 2)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group]) VALUES (N'khachhang', N'123', 6, 3)
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([ID], [MaKH], [ThoiGian], [NoiDung], [HienThi]) VALUES (1, 1, CAST(0x0000A58000C5C100 AS DateTime), N'Vườn thú tuyệt vời, rất thích hợp cho những buổi vui chơi của gia đình vào cuối tuần. Tôi đã có 1 ngày nghỉ tuyệt vời cùng gia đình tôi ở đây!', NULL)
INSERT [dbo].[PhanHoi] ([ID], [MaKH], [ThoiGian], [NoiDung], [HienThi]) VALUES (2, 2, CAST(0x0000A54D00000000 AS DateTime), N'Tôi nghĩ Vườn thú nên bổ sung những con vật lạ hơn nữa. Những động vật ở đây đã có từ rất lâu rồi', NULL)
INSERT [dbo].[PhanHoi] ([ID], [MaKH], [ThoiGian], [NoiDung], [HienThi]) VALUES (3, 2, CAST(0x0000A54300000000 AS DateTime), N'Nhà vệ sinh thật tồi tàn, vườn thú nên nâng cấp nhà vệ sinh!', NULL)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[SuKien] ON 

INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian]) VALUES (1, N'Sư Tử Châu Phi về Việt Nam', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat1.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung1.txt', N'event-lion.jpg', CAST(0x0000A58000C5C100 AS DateTime))
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian]) VALUES (2, N'Cá Heo Đại Tây Dương múa như vũ công', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat2.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung2.txt', N'event-dolphin.jpg', CAST(0x0000A58100C5C100 AS DateTime))
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian]) VALUES (3, N'Sự kiện thứ 3', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat3.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung3.txt', N'event-gorilla.jpg', CAST(0x0000A6BB00B54640 AS DateTime))
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian]) VALUES (4, N'sự kiện thứ 4', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat4.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung4.txt', N'event-dolphin.jpg', CAST(0x0000A58100C5C100 AS DateTime))
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian]) VALUES (5, N'abc', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat4.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung4.txt', N'event-dolphin.jpg', NULL)
SET IDENTITY_INSERT [dbo].[SuKien] OFF
ALTER TABLE [dbo].[CTDatVe]  WITH CHECK ADD  CONSTRAINT [FK_CTDatVe_DatVe] FOREIGN KEY([MaDatVe])
REFERENCES [dbo].[DatVe] ([MaDatVe])
GO
ALTER TABLE [dbo].[CTDatVe] CHECK CONSTRAINT [FK_CTDatVe_DatVe]
GO
ALTER TABLE [dbo].[CTDatVe]  WITH CHECK ADD  CONSTRAINT [FK_CTDatVe_Ve1] FOREIGN KEY([MaVe])
REFERENCES [dbo].[Ve] ([MaVe])
GO
ALTER TABLE [dbo].[CTDatVe] CHECK CONSTRAINT [FK_CTDatVe_Ve1]
GO
ALTER TABLE [dbo].[DatVe]  WITH CHECK ADD  CONSTRAINT [FK_DatVe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DatVe] CHECK CONSTRAINT [FK_DatVe_KhachHang]
GO
ALTER TABLE [dbo].[DongVat]  WITH CHECK ADD  CONSTRAINT [FK_DongVat_Ve] FOREIGN KEY([MaVe])
REFERENCES [dbo].[Ve] ([MaVe])
GO
ALTER TABLE [dbo].[DongVat] CHECK CONSTRAINT [FK_DongVat_Ve]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_KhachHang]
GO
USE [master]
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET  READ_WRITE 
GO
