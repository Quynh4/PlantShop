USE [master]
GO
/****** Object:  Database [PlantShopDB]    Script Date: 18/03/2024 23:15:58 ******/
CREATE DATABASE [PlantShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlantShopDB', FILENAME = N'D:\PlantShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlantShopDB_log', FILENAME = N'D:\PlantShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PlantShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlantShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlantShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlantShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlantShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlantShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlantShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlantShopDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PlantShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlantShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlantShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlantShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlantShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlantShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlantShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlantShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlantShopDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlantShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlantShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlantShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlantShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlantShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlantShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlantShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlantShopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlantShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [PlantShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlantShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlantShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlantShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlantShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlantShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PlantShopDB] SET QUERY_STORE = OFF
GO
USE [PlantShopDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](255) NULL,
	[fullName] [varchar](100) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[token] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[accId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cateId] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[detailId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[pId] [int] NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[ordDate] [date] NULL,
	[shipDate] [date] NULL,
	[note] [varchar](255) NULL,
	[status] [int] NULL,
	[accId] [int] NULL,
	[shippingId] [int] NULL,
	[totalPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[pName] [varchar](50) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](255) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[cateId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pId] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[accId] [int] NULL,
	[createdDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 18/03/2024 23:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[phone] [varchar](12) NULL,
	[address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ordDate]  DEFAULT (getdate()) FOR [ordDate]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Plants] ([pid])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([accId])
REFERENCES [dbo].[Accounts] ([accId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([shippingId])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[OrderStatus] ([id])
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD FOREIGN KEY([cateId])
REFERENCES [dbo].[Categories] ([cateId])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([accId])
REFERENCES [dbo].[Accounts] ([accId])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([pId])
REFERENCES [dbo].[Plants] ([pid])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([price]>=(0.0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PlantShopDB] SET  READ_WRITE 
GO
