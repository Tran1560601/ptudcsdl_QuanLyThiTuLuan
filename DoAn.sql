USE [master]
GO
/****** Object:  Database [DoAn]    Script Date: 10/05/2018 2:39:43 CH ******/
CREATE DATABASE [DoAn]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DoAn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DoAn.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DoAn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DoAn_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DoAn] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DoAn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DoAn] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DoAn] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DoAn] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DoAn] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DoAn] SET ARITHABORT OFF 
GO
ALTER DATABASE [DoAn] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DoAn] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DoAn] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DoAn] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DoAn] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DoAn] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DoAn] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DoAn] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DoAn] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DoAn] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DoAn] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DoAn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DoAn] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DoAn] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DoAn] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DoAn] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DoAn] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DoAn] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DoAn] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DoAn] SET  MULTI_USER 
GO
ALTER DATABASE [DoAn] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DoAn] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DoAn] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DoAn] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DoAn]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 10/05/2018 2:39:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi](
	[stt] [int] NOT NULL,
	[noidungcauhoi] [nvarchar](max) NULL,
	[cautraloichinhxac] [nvarchar](max) NULL,
 CONSTRAINT [PK_CauHoi] PRIMARY KEY CLUSTERED 
(
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 10/05/2018 2:39:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[username] [nchar](20) NOT NULL,
	[password] [nchar](30) NULL,
	[loai] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TraLoi]    Script Date: 10/05/2018 2:39:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraLoi](
	[username] [nchar](20) NOT NULL,
	[stt] [int] NOT NULL,
	[cautraloi] [nvarchar](50) NULL,
 CONSTRAINT [PK_TraLoi] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[stt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CauHoi] ([stt], [noidungcauhoi], [cautraloichinhxac]) VALUES (1, N'Quốc gia nào giàu nhất thế giới hiện nay?', N'Quatar')
INSERT [dbo].[CauHoi] ([stt], [noidungcauhoi], [cautraloichinhxac]) VALUES (2, N'Qatar giàu có nhờ nguồn tài nguyên gì?', N'Dầu mỏ')
INSERT [dbo].[CauHoi] ([stt], [noidungcauhoi], [cautraloichinhxac]) VALUES (3, N'Năm 2022, Qatar đăng cai sự kiện gì?', N'FIFA World Cup')
INSERT [dbo].[CauHoi] ([stt], [noidungcauhoi], [cautraloichinhxac]) VALUES (4, N'Qatar là đất nước không có nguồn tài nguyên nào?', N'Tài nguyên nước')
INSERT [dbo].[CauHoi] ([stt], [noidungcauhoi], [cautraloichinhxac]) VALUES (5, N' Loại đồ uống nào bị cấm ở Qatar?', N'Rượu, bia')
INSERT [dbo].[TaiKhoan] ([username], [password], [loai]) VALUES (N'gv                  ', N'gv                            ', 2)
INSERT [dbo].[TaiKhoan] ([username], [password], [loai]) VALUES (N'sv1                 ', N'sv1                           ', 1)
INSERT [dbo].[TaiKhoan] ([username], [password], [loai]) VALUES (N'sv2                 ', N'sv2                           ', 1)
INSERT [dbo].[TaiKhoan] ([username], [password], [loai]) VALUES (N'sv3                 ', N'sv3                           ', 1)
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv1                 ', 1, N'dubai')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv1                 ', 2, N'dau mo')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv1                 ', 3, N'world cup')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv1                 ', 4, N'nuoc')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv1                 ', 5, N'bia')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv2                 ', 1, N'anh')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv2                 ', 2, N'thuy san')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv2                 ', 4, N'bien')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv3                 ', 1, N'quatar')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv3                 ', 2, N'dau mo, than da')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv3                 ', 3, N'the van hoi')
INSERT [dbo].[TraLoi] ([username], [stt], [cautraloi]) VALUES (N'sv3                 ', 5, N'do uong co con')
USE [master]
GO
ALTER DATABASE [DoAn] SET  READ_WRITE 
GO
