USE [master]
GO
/****** Object:  Database [GreenFlowers]    Script Date: 9/11/2018 1:13:07 AM ******/
CREATE DATABASE [GreenFlowers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenFlowers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GreenFlowers.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GreenFlowers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\GreenFlowers_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GreenFlowers] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenFlowers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenFlowers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenFlowers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenFlowers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenFlowers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenFlowers] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenFlowers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenFlowers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenFlowers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenFlowers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenFlowers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenFlowers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenFlowers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenFlowers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenFlowers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenFlowers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GreenFlowers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenFlowers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenFlowers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenFlowers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenFlowers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenFlowers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenFlowers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenFlowers] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GreenFlowers] SET  MULTI_USER 
GO
ALTER DATABASE [GreenFlowers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenFlowers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenFlowers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenFlowers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GreenFlowers] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GreenFlowers]
GO
/****** Object:  Table [dbo].[GF_Blog]    Script Date: 9/11/2018 1:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Blog](
	[ID] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[ContentBlog] [nvarchar](max) NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[Avatar] [nvarchar](50) NULL,
	[IsHide] [bit] NULL,
 CONSTRAINT [PK_GF_Blog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GF_Category]    Script Date: 9/11/2018 1:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](20) NULL,
 CONSTRAINT [PK_GF_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GF_Order]    Script Date: 9/11/2018 1:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Order](
	[ID] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[IsChecked] [bit] NULL,
 CONSTRAINT [PK_GF_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GF_Product]    Script Date: 9/11/2018 1:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Product](
	[ID] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Avatar] [nvarchar](20) NULL,
	[Images] [nvarchar](100) NULL,
	[DiscountPrice] [int] NULL,
	[IDCategory] [int] NULL,
	[IsHide] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GF_Record]    Script Date: 9/11/2018 1:13:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Record](
	[ID] [nvarchar](50) NOT NULL,
	[ID_Order] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [int] NULL,
 CONSTRAINT [PK_GF_Record] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[GF_Blog] ([ID], [Title], [ContentBlog], [CreatedBy], [CreatedDate], [Avatar], [IsHide]) VALUES (N'23ffd967_e81b_4331_9c16_9daa626f03f1', N'Bài đăng thử', N'<p>Đ&acirc;y là bài đăng thử đ&ecirc;̉ ki&ecirc;̉m tra tính năng đăng bài của <strong>Blog</strong></p>
', N'Admin', CAST(N'2018-09-10 21:25:57.353' AS DateTime), N'image02.jpg', NULL)
SET IDENTITY_INSERT [dbo].[GF_Category] ON 

INSERT [dbo].[GF_Category] ([ID], [Category]) VALUES (0, N'Hoa Sinh Nhật')
INSERT [dbo].[GF_Category] ([ID], [Category]) VALUES (1, N'Hoa Đám Cưới')
INSERT [dbo].[GF_Category] ([ID], [Category]) VALUES (2, N'Hoa Mừng Thọ')
INSERT [dbo].[GF_Category] ([ID], [Category]) VALUES (3, N'Hoa Đám Tang')
INSERT [dbo].[GF_Category] ([ID], [Category]) VALUES (4, N'Hoa Valentine')
INSERT [dbo].[GF_Category] ([ID], [Category]) VALUES (5, N'Hoa Tốt Nghiệp')
SET IDENTITY_INSERT [dbo].[GF_Category] OFF
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'1', N'Glory of the Snow', 2600000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-1.jpg', N'product-1.jpg', 0, NULL, NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'2', N'Dutchman''s Breeches', 1200000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-2.jpg', N'product-2.jpg', 0, NULL, NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'3', N'Flowers Bouquet Pink', 1000000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-3.jpg', N'product-3.jpg', 0, NULL, NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'4', N'Evergreen Candytuft', 1000000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-4.jpg', N'product-4.jpg', 0, NULL, NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'5', N'Pearly Everlasting', 1500000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-5.jpg', N'product-5.jpg', 0, NULL, NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'6', N'Yellow Loosestrife', 2000000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-6.jpg', N'product-6.jpg', 0, NULL, NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images], [DiscountPrice], [IDCategory], [IsHide]) VALUES (N'7', N'Golden Marguerite', 2700000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-7.jpg', N'product-7.jpg', 0, NULL, NULL)
USE [master]
GO
ALTER DATABASE [GreenFlowers] SET  READ_WRITE 
GO
