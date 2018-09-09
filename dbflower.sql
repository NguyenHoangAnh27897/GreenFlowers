USE [master]
GO
/****** Object:  Database [GreenFlowers]    Script Date: 9/9/2018 7:49:19 PM ******/
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
/****** Object:  Table [dbo].[GF_Category]    Script Date: 9/9/2018 7:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Category](
	[ID] [int] NOT NULL,
	[Category] [nvarchar](20) NULL,
 CONSTRAINT [PK_GF_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GF_Product]    Script Date: 9/9/2018 7:49:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GF_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Avatar] [nvarchar](20) NULL,
	[Images] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[GF_Product] ON 

INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (1, N'Glory of the Snow', 2600000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-1.jpg', NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (2, N'Dutchman''s Breeches', 1200000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-2.jpg', NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (3, N'Flowers Bouquet Pink', 1000000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-3.jpg', NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (4, N'Evergreen Candytuft', 1000000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-4.jpg', NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (5, N'Pearly Everlasting', 1500000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-5.jpg', NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (6, N'Yellow Loosestrife', 2000000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-6.jpg', NULL)
INSERT [dbo].[GF_Product] ([ID], [ProductName], [Price], [Description], [Avatar], [Images]) VALUES (7, N'Golden Marguerite', 2700000, N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam est usus legentis in iis qui facit eorum claritatem.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.', N'product-7.jpg', NULL)
SET IDENTITY_INSERT [dbo].[GF_Product] OFF
USE [master]
GO
ALTER DATABASE [GreenFlowers] SET  READ_WRITE 
GO
