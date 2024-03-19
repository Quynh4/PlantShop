USE [master]
GO
/****** Object:  Database [PlantShopDB]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 19/03/2024 10:40:14 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[Plants]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[Ratings]    Script Date: 19/03/2024 10:40:14 ******/
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
/****** Object:  Table [dbo].[Shipping]    Script Date: 19/03/2024 10:40:14 ******/
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
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([accId], [email], [password], [fullName], [phone], [status], [role], [token]) VALUES (1, N'quynhntnhe181950@fpt.edu.vn', N'1', N'nofomtre', N'0972156004', 1, 0, N'9NezG6TbAcvLso5SdBPtduJwL2mhTwAp')
GO
INSERT [dbo].[Accounts] ([accId], [email], [password], [fullName], [phone], [status], [role], [token]) VALUES (2, N'q@gmail.com', N'222222', N'Q', N'0972156004', 1, 0, N'zl79BbZPyqbvGqQvwHb_-TtdjuvrgDF0')
GO
INSERT [dbo].[Accounts] ([accId], [email], [password], [fullName], [phone], [status], [role], [token]) VALUES (3, N'qq@gmail.com', N'1', N'NTN', N'0900003933', 0, 0, N'IoiOnbc0jMbB_eSgrfAUmA6R9r1PWz_t')
GO
INSERT [dbo].[Accounts] ([accId], [email], [password], [fullName], [phone], [status], [role], [token]) VALUES (4, N'admin@gmail.com', N'1', N'admin', N'0972156004', 1, 1, N'mXzmx7xzJ_CBjgzrXcl80ocd7J5WSRum')
GO
INSERT [dbo].[Accounts] ([accId], [email], [password], [fullName], [phone], [status], [role], [token]) VALUES (5, N'trang@gmail.com', N'111111', N'Trang', N'0999999999', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accId], [email], [password], [fullName], [phone], [status], [role], [token]) VALUES (6, N'hai@gmail.com', N'111111', N'haivm', N'0900040000', 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([cateId], [cateName]) VALUES (1, N'Flower')
GO
INSERT [dbo].[Categories] ([cateId], [cateName]) VALUES (2, N'Outdoor plant')
GO
INSERT [dbo].[Categories] ([cateId], [cateName]) VALUES (3, N'Others')
GO
INSERT [dbo].[Categories] ([cateId], [cateName]) VALUES (13, N'Fertilizer')
GO
INSERT [dbo].[Categories] ([cateId], [cateName]) VALUES (14, N'Indoor plant')
GO
INSERT [dbo].[Categories] ([cateId], [cateName]) VALUES (15, N'Fruit plant')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (1, 1, 1, 4, 95)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (2, 1, 2, 1, 67)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (3, 2, 1, 10, 95)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (4, 2, 7, 1, 72)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (5, 3, 2, 1, 67)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (6, 3, 4, 1, 64)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (7, 4, 1, 1, 95)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (8, 4, 2, 1, 67)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (9, 4, 3, 1, 86)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (10, 5, 1, 9, 95)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (11, 6, 3, 1, 86)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (12, 7, 4, 1, 64)
GO
INSERT [dbo].[OrderDetails] ([detailId], [orderId], [pId], [quantity], [price]) VALUES (13, 7, 3, 1, 86)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (1, CAST(N'2024-03-05' AS Date), NULL, N'No notes', 3, 3, 1, 447)
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (2, CAST(N'2024-03-05' AS Date), CAST(N'2024-03-11' AS Date), N'No notes', 2, 3, 2, 1022)
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (3, CAST(N'2024-03-13' AS Date), CAST(N'2024-03-14' AS Date), N'No notes', 2, 2, 3, 131)
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (4, CAST(N'2024-03-14' AS Date), CAST(N'2024-03-14' AS Date), N'hhh', 2, 2, 4, 248)
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (5, CAST(N'2024-03-14' AS Date), CAST(N'2024-03-14' AS Date), N'No notes', 2, 2, 5, 855)
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (6, CAST(N'2024-03-19' AS Date), NULL, N'No notes', 3, 6, 6, 86)
GO
INSERT [dbo].[Orders] ([orderId], [ordDate], [shipDate], [note], [status], [accId], [shippingId], [totalPrice]) VALUES (7, CAST(N'2024-03-19' AS Date), NULL, N'bom hang thoii', 1, 6, 7, 150)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 
GO
INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (1, N'Processing')
GO
INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (2, N'Completed')
GO
INSERT [dbo].[OrderStatus] ([id], [name]) VALUES (3, N'Canceled')
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (1, N'Cay duoi cong', 95, N'https://cdn.tgdd.vn/Files/2022/07/09/1446086/top-60-cac-loai-cay-la-mau-dep-bat-mat-de-trong-tai-nha-202207090934354815.jpg', N'Cay duoi cong', 1, 3)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (2, N'Cay mat nai', 67, N'https://cdn.tgdd.vn/Files/2022/07/09/1446086/top-60-cac-loai-cay-la-mau-dep-bat-mat-de-trong-tai-nha-202207090940128979.jpg', N'Cay mat nai', 1, 1)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (3, N'Cay to tong duoi luon', 86, N'https://cdn.tgdd.vn/Files/2022/07/09/1446086/top-60-cac-loai-cay-la-mau-dep-bat-mat-de-trong-tai-nha-202207090940388937.jpg', N'Cay to tong duoi luon', 1, 3)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (4, N'Cay la gam vang', 64, N'https://cdn.tgdd.vn/Files/2022/07/09/1446086/top-60-cac-loai-cay-la-mau-dep-bat-mat-de-trong-tai-nha-202207090941184383.jpg', N'Cay la gam vang', 1, 3)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (5, N'Dua xiem', 15, N'https://www.cayxanhdep.vn/uploads/gallerys/product/Resource-340/image/2_Cay_Dua_Xiem.jpg', N'dua xiem', 1, 3)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (6, N'Banana', 86, N'https://uniontrading.vn/wp-content/uploads/su-hy-sinh-cua-cay-chuoi-gia-nam-my-union-trading-1.jpg', N'Banana', 1, 15)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (7, N'Tro', 5, N'https://www.cayxanhdep.vn/uploads/products/1_Tro_Dat.jpg', N'Tro', 1, 13)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (10, N'Xo dua', 10, N'https://www.cayxanhdep.vn/uploads/products/1_Xo_Dua.jpg', N'xo dua', 1, 2)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (101, N'Van Nien Thanh', 16, N'https://inhat.vn/wp-content/uploads/2022/01/cay-canh-tay-ninh-1-min.jpg', N'Cay Van Nien Thanh', 1, 3)
GO
INSERT [dbo].[Plants] ([pid], [pName], [price], [imgPath], [description], [status], [cateId]) VALUES (102, N'Cay phu quy', 19, N'https://cdn.tgdd.vn/Files/2022/07/09/1446086/top-60-cac-loai-cay-la-mau-dep-bat-mat-de-trong-tai-nha-202207090932353576.jpg', N'Cay phu quy', 1, 14)
GO

INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 95, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 25, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 105, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 45, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 55, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 65, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay hoa', 75, N'https://i.pinimg.com/736x/46/2f/ff/462fffe245847a514a2bf1b023a8bdc0.jpg', N'Cay hoa', 1, 1)


INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 95, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 25, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 105, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 45, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 55, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 65, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)
INSERT [dbo].[Plants] ( [pName], [price], [imgPath], [description], [status], [cateId]) VALUES ( N'Cay khac', 75, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO6xaxt6InKusSIuexRrJfljn6ijoClOBCiOwk_Y_88bgouvi-VbO2OLXvY5Khooux0QM&usq', N'Cay khac', 1, 2)



SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1, N'NTN', N'0900003933', N'Bac Ninh')
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (2, N'NTN', N'0900003933', N'xxx')
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3, N'Q', N'0972156004', N'f')
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (4, N'Q', N'0972156004', N'hhh')
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (5, N'Q', N'0972156004', N'kkk')
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (6, N'haivm', N'0900040000', N'hehe')
GO
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (7, N'haivm', N'0900040000', N'bom hang thoii')
GO
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E6164D6E1227C]    Script Date: 19/03/2024 10:40:14 ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
