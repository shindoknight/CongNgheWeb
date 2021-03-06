USE [master]
GO
/****** Object:  Database [CongNgheWeb_Zoo]    Script Date: 2017-01-03 3:52:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_PhanHoi_ListAll]    Script Date: 2017-01-03 3:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_PhanHoi_ListAll]
as
select a.ID,HoTen,a.Thoigian,a.NoiDung from PhanHoi a,KhachHang b where a.MaKH=b.MaKH 
order by a.ID desc
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaTK]    Script Date: 2017-01-03 3:52:26 PM ******/
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
/****** Object:  Table [dbo].[CTDatVe]    Script Date: 2017-01-03 3:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDatVe](
	[MaDatVe] [int] NOT NULL,
	[MaVe] [int] NOT NULL,
	[SoLuong] [decimal](18, 0) NULL,
	[TreGia] [int] NOT NULL,
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_CTDatVe] PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC,
	[MaVe] ASC,
	[TreGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatVe]    Script Date: 2017-01-03 3:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatVe](
	[MaDatVe] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
	[DaThanhToan] [int] NULL,
	[NgayDat] [datetime] NULL,
	[DaGui] [int] NULL,
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_DatVe] PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongVat]    Script Date: 2017-01-03 3:52:26 PM ******/
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
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_DongVat] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2017-01-03 3:52:26 PM ******/
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
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 2017-01-03 3:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
	[Group] [int] NULL,
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 2017-01-03 3:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NoiDung] [ntext] NULL,
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuKien]    Script Date: 2017-01-03 3:52:26 PM ******/
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
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_SuKien] PRIMARY KEY CLUSTERED 
(
	[IDEvent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ve]    Script Date: 2017-01-03 3:52:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[TenVe] [nvarchar](50) NULL,
	[GiaTien] [decimal](18, 0) NULL,
	[LoaiVe] [int] NULL,
	[NgayCapNhatGiaVe] [date] NULL,
	[AnhVe] [nvarchar](100) NULL,
	[ThongTinCTVe] [ntext] NULL,
	[TomTatVe] [ntext] NULL,
	[GiaMoiTreEm] [decimal](18, 0) NULL,
	[GiaMoiNguoiLon] [decimal](18, 0) NULL,
	[GiaCuTreEm] [decimal](18, 0) NULL,
	[GiaCuNguoiLon] [decimal](18, 0) NULL,
	[SLVe] [decimal](18, 0) NULL,
	[SLDaMua] [decimal](18, 0) NULL,
	[DaXoa] [int] NOT NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (1, 1, CAST(1 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (1, 1, CAST(1 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (3, 4, CAST(1 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (3, 4, CAST(1 AS Decimal(18, 0)), 2, 0)
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (4, 4, CAST(1 AS Decimal(18, 0)), 1, 0)
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (4, 4, CAST(1 AS Decimal(18, 0)), 2, 0)
INSERT [dbo].[CTDatVe] ([MaDatVe], [MaVe], [SoLuong], [TreGia], [DaXoa]) VALUES (5, 1, CAST(1 AS Decimal(18, 0)), 1, 0)
SET IDENTITY_INSERT [dbo].[DatVe] ON 

INSERT [dbo].[DatVe] ([MaDatVe], [MaKH], [TongTien], [DaThanhToan], [NgayDat], [DaGui], [DaXoa]) VALUES (1, 1, CAST(50000 AS Decimal(18, 0)), 1, CAST(0x0000A6EF00000000 AS DateTime), 0, 0)
INSERT [dbo].[DatVe] ([MaDatVe], [MaKH], [TongTien], [DaThanhToan], [NgayDat], [DaGui], [DaXoa]) VALUES (3, 3, CAST(250000 AS Decimal(18, 0)), 1, CAST(0x0000A6EF016E1409 AS DateTime), 0, 0)
INSERT [dbo].[DatVe] ([MaDatVe], [MaKH], [TongTien], [DaThanhToan], [NgayDat], [DaGui], [DaXoa]) VALUES (4, 1, CAST(250000 AS Decimal(18, 0)), 1, CAST(0x0000A6EF01739571 AS DateTime), 1, 0)
INSERT [dbo].[DatVe] ([MaDatVe], [MaKH], [TongTien], [DaThanhToan], [NgayDat], [DaGui], [DaXoa]) VALUES (5, 3, CAST(50000 AS Decimal(18, 0)), 0, CAST(0x0000A6F000028B71 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[DatVe] OFF
SET IDENTITY_INSERT [dbo].[DongVat] ON 

INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (1, N'Cá heo', N'Dolphin', N'abc', N'abc', N'/Content/Images/gallery-dolphin.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiếHiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…t bị y tế,…', N'dsg', N'dfg', 3, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (2, N'Voi Tây Nguyên', N'Elephant', N'xyz', N'xyz', N'/Content/Images/gallery-elephant.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiếtHiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,… bị y tế,…', N'sdgs', N'gds', 4, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (3, N'Tinh tinh', N'Gorilla', NULL, NULL, N'/Content/Images/gallery-gorilla.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bHiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…ị y tế,…', N'sdg', N'gs', 32, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (5, N'Bướm xanh', N'butter fly', NULL, NULL, N'/Content/Images/gallery-blue-butterfly.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…', N'sf', N'gdsf', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (6, N'Sư tử Châu phi', NULL, NULL, NULL, N'/Content/Images/gallery-lion.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…', N'dg', N'gds', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (7, N'Cú Anh Quốc', NULL, NULL, NULL, N'/Content/Images/gallery-owl.jpg', N'Hiện nay, các lĩnh vực trong công nghệ phần mềm là rất rộng lớn, không thể phủ nhận vai trò của các phần mềm đối với cuộc sống hiện nay. Về tài chính, có hệ thống phần mềm quản lý ngân hàng; phương tiện vận chuyển, hay các thiết bị gia đình được điều khiển bởi các thiết bị được cài đặt phần mềm có sẵn, sức khỏe của chúng ta được chăm sóc tốt hơn nhờ các thiết bị y tế,…', NULL, N'gsd', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (8, N'Chim cánh cụt', NULL, NULL, NULL, N'/Content/Images/gallery-penguin.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DongVat] ([MaDV], [TenDV], [TenKH], [Ho], [Bo], [HinhAnh], [GioiThieu], [ThucAn], [NguonGoc], [ChieuCao], [CanNang], [NoiSinhSong], [MaVe], [DaXoa]) VALUES (9, N'Hươu cao cổ', N'Hươu cổ cao', N'họ của hươu', N'bộ của hươu', N'/Data/images/hqdefault.jpg', N'Theo tạp ch&iacute;&nbsp;Current Biology,&nbsp;trong một thời gian d&agrave;i, c&aacute;c nh&agrave; sinh học coi hươu cao cổ thuộc về một lo&agrave;i duy nhất (Giraffa camelopardalis) với v&agrave;i ph&acirc;n lo&agrave;i&nbsp;kh&aacute;c nhau, v&agrave;i chi tiết bề ngo&agrave;i v&agrave; sự ph&acirc;n bố về địa l&yacute;. Chỉ sau khi ph&aacute;t triển được phương ph&aacute;p ph&acirc;n t&iacute;ch ADN, c&aacute;c nh&agrave; di truyền học đ&atilde; v&agrave;o cuộc v&agrave; họ đ&atilde; bị bất ngờ.&nbsp


', N'lá cây', N'châu phi', 3, 300, N'Châu phi', NULL, 0)
SET IDENTITY_INSERT [dbo].[DongVat] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email], [DaXoa]) VALUES (1, N'Bạch Ngọc Hiệp', CAST(0xC71D0B00 AS Date), N'250993576', N'Lâm Đồng', N'0909000000', N'bachngochieph2@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email], [DaXoa]) VALUES (3, N'Trần Mạnh Linh', NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email], [DaXoa]) VALUES (5, N'bạch ngoc hiệp', NULL, NULL, NULL, N'01234', N'bachngochieph2@gmail.com', 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email], [DaXoa]) VALUES (6, N'abc', NULL, NULL, N'hà nội', N'987', N'em@gmail.com', 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email], [DaXoa]) VALUES (1006, N'áđá', NULL, NULL, N'', N'', N'', 0)
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [CMND], [DiaChi], [SDT], [Email], [DaXoa]) VALUES (1007, N'nguyễn văn b', NULL, N'2020', N'hà nội', N'2321', N'nadn', 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group], [DaXoa]) VALUES (N'admin', N'123', 1007, 1, 0)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group], [DaXoa]) VALUES (N'admin1', N'1234', 1, 1, 1)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group], [DaXoa]) VALUES (N'admin3', N'1234', 3, 1, 0)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group], [DaXoa]) VALUES (N'bnh', N'', 5, 2, 0)
INSERT [dbo].[Login] ([UserName], [PassWord], [MaKH], [Group], [DaXoa]) VALUES (N'khachhang', N'123', 6, 3, 0)
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([ID], [ThoiGian], [HoTen], [SDT], [Email], [NoiDung], [DaXoa]) VALUES (1, CAST(0x0000A58000C5C100 AS DateTime), NULL, NULL, NULL, N'Vườn thú tuyệt vời, rất thích hợp cho những buổi vui chơi của gia đình vào cuối tuần. Tôi đã có 1 ngày nghỉ tuyệt vời cùng gia đình tôi ở đây!', 0)
INSERT [dbo].[PhanHoi] ([ID], [ThoiGian], [HoTen], [SDT], [Email], [NoiDung], [DaXoa]) VALUES (2, CAST(0x0000A54D00000000 AS DateTime), NULL, NULL, NULL, N'Tôi nghĩ Vườn thú nên bổ sung những con vật lạ hơn nữa. Những động vật ở đây đã có từ rất lâu rồi', 0)
INSERT [dbo].[PhanHoi] ([ID], [ThoiGian], [HoTen], [SDT], [Email], [NoiDung], [DaXoa]) VALUES (3, CAST(0x0000A54300000000 AS DateTime), NULL, NULL, NULL, N'Nhà vệ sinh thật tồi tàn, vườn thú nên nâng cấp nhà vệ sinh!', 0)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[SuKien] ON 

INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian], [DaXoa]) VALUES (1, N'Sư Tử Châu Phi về Việt Nam', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat1.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung1.txt', N'/Content/images/event-lion.jpg', CAST(0x0000A58000C5C100 AS DateTime), 0)
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian], [DaXoa]) VALUES (2, N'Cá Heo Đại Tây Dương múa như vũ công', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat2.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung2.txt', N'/Content/images/event-dolphin.jpg', CAST(0x0000A58100C5C100 AS DateTime), 0)
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian], [DaXoa]) VALUES (3, N'Sự kiện thứ 3', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat3.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung3.txt', N'/Content/images/event-gorilla.jpg', CAST(0x0000A6BB00B54640 AS DateTime), 0)
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian], [DaXoa]) VALUES (4, N'sự kiện thứ 4', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat4.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung4.txt', N'/Content/images/event-dolphin.jpg', CAST(0x0000A58100C5C100 AS DateTime), 0)
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian], [DaXoa]) VALUES (5, N'abc', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\\tomtat4.txt', N'D:\\1-Study\\4-HK6\\lap trinh web\\New folder\\CongNgheWeb\\BTL_Zoo\\BTL_Zoo\\Text\noidung4.txt', N'/Content/images/event-dolphin.jpg', NULL, 0)
INSERT [dbo].[SuKien] ([IDEvent], [TieuDe], [TomTat], [NoiDung], [HinhAnh], [Thoigian], [DaXoa]) VALUES (6, N'Vương quốc'' đười ươi, khỉ mũi dài ở Malaysia', N'Những chú khỉ mũi dài Proboscis và đười ươi Orang Utan ở vùng Sandakan và Kinabatangan, Sabah (Malaysia) đang khiến cho đông đảo khách du lịch từ các nước phải lặn lội ghé thăm và khám phá.', N'<p>Dọc hai b&ecirc;n bờ s&ocirc;ng Kinabatangan (Sabah) l&agrave; nơi tập trung động vật hoang d&atilde; lớn nhất của Malaysia. <span style="color:#b22222"><strong>Nơi đ&acirc;y nổi tiếng bởi sự xuất hiện của h&agrave;ng ngh&igrave;n khỉ mũi d&agrave;i Proboscis (khỉ voi).</strong></span></p>
', N'/Data/files/883f7c673166710eb3b500c9bd8f9cc5.jpg', NULL, 0)
SET IDENTITY_INSERT [dbo].[SuKien] OFF
SET IDENTITY_INSERT [dbo].[Ve] ON 

INSERT [dbo].[Ve] ([MaVe], [TenVe], [GiaTien], [LoaiVe], [NgayCapNhatGiaVe], [AnhVe], [ThongTinCTVe], [TomTatVe], [GiaMoiTreEm], [GiaMoiNguoiLon], [GiaCuTreEm], [GiaCuNguoiLon], [SLVe], [SLDaMua], [DaXoa]) VALUES (1, N'Vé vào cổng', NULL, 1, NULL, NULL, NULL, NULL, CAST(20000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(30000 AS Decimal(18, 0)), CAST(3000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[Ve] ([MaVe], [TenVe], [GiaTien], [LoaiVe], [NgayCapNhatGiaVe], [AnhVe], [ThongTinCTVe], [TomTatVe], [GiaMoiTreEm], [GiaMoiNguoiLon], [GiaCuTreEm], [GiaCuNguoiLon], [SLVe], [SLDaMua], [DaXoa]) VALUES (2, N'Khu rừng rùng rợn', NULL, 4, NULL, NULL, NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), NULL, NULL, CAST(1000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[Ve] ([MaVe], [TenVe], [GiaTien], [LoaiVe], [NgayCapNhatGiaVe], [AnhVe], [ThongTinCTVe], [TomTatVe], [GiaMoiTreEm], [GiaMoiNguoiLon], [GiaCuTreEm], [GiaCuNguoiLon], [SLVe], [SLDaMua], [DaXoa]) VALUES (4, N'Vé vip 1', NULL, 2, NULL, NULL, NULL, NULL, CAST(100000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(150000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[Ve] ([MaVe], [TenVe], [GiaTien], [LoaiVe], [NgayCapNhatGiaVe], [AnhVe], [ThongTinCTVe], [TomTatVe], [GiaMoiTreEm], [GiaMoiNguoiLon], [GiaCuTreEm], [GiaCuNguoiLon], [SLVe], [SLDaMua], [DaXoa]) VALUES (5, N'Vé VIP 2', NULL, 3, NULL, NULL, NULL, NULL, CAST(80000 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(130000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[Ve] ([MaVe], [TenVe], [GiaTien], [LoaiVe], [NgayCapNhatGiaVe], [AnhVe], [ThongTinCTVe], [TomTatVe], [GiaMoiTreEm], [GiaMoiNguoiLon], [GiaCuTreEm], [GiaCuNguoiLon], [SLVe], [SLDaMua], [DaXoa]) VALUES (6, N'Trại cá heo', NULL, 4, NULL, NULL, NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), NULL, NULL, CAST(1000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 0)
INSERT [dbo].[Ve] ([MaVe], [TenVe], [GiaTien], [LoaiVe], [NgayCapNhatGiaVe], [AnhVe], [ThongTinCTVe], [TomTatVe], [GiaMoiTreEm], [GiaMoiNguoiLon], [GiaCuTreEm], [GiaCuNguoiLon], [SLVe], [SLDaMua], [DaXoa]) VALUES (7, N'Cưỡi đà điểu', NULL, NULL, NULL, N'/Data/images/%C4%90%C3%A0-%C4%90i%E1%BB%83u-c%C3%B3-ph%E1%BA%A3i-l%C3%A0-chim-kh%C3%B4ng-5.jpg', N'<p><strong>th&ocirc;ng tin chi tiết v&eacute;..</strong></p>

<p><span style="color:#b22222">v&eacute; cưỡi đ&agrave; điểu...&nbsp;</span></p>

<p><span style="color:#b22222">&aacute;kjkla</span></p>
', N'Cưỡi đà điểu có nguồn gốc châu phi', CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), NULL, 0)
SET IDENTITY_INSERT [dbo].[Ve] OFF
ALTER TABLE [dbo].[DatVe] ADD  CONSTRAINT [DF_DatVe_NgayDat]  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[SuKien] ADD  CONSTRAINT [DF_SuKien_Thoigian]  DEFAULT (getdate()) FOR [Thoigian]
GO
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
