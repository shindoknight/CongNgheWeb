USE [master]
GO
/****** Object:  Database [CongNgheWeb_Zoo]    Script Date: 2016-11-11 5:01:02 PM ******/
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
/****** Object:  Table [dbo].[CTDatVe]    Script Date: 2016-11-11 5:01:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDatVe](
	[MaDatVe] [int] NOT NULL,
	[MaVe] [int] NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTDatVe] PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC,
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DatVe]    Script Date: 2016-11-11 5:01:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatVe](
	[MaDatVe] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[TongTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_DatVe] PRIMARY KEY CLUSTERED 
(
	[MaDatVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DongVat]    Script Date: 2016-11-11 5:01:03 PM ******/
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
	[ChiTiet] [nvarchar](100) NULL,
 CONSTRAINT [PK_DongVat] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2016-11-11 5:01:03 PM ******/
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
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 2016-11-11 5:01:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ve]    Script Date: 2016-11-11 5:01:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[MaVe] [int] IDENTITY(1,1) NOT NULL,
	[TenVe] [nvarchar](50) NULL,
	[GiaTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [CongNgheWeb_Zoo] SET  READ_WRITE 
GO
