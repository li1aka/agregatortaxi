USE [master]
GO
/****** Object:  Database [taxi]    Script Date: 03.02.2023 10:25:50 ******/
CREATE DATABASE [taxi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'taxi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\taxi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'taxi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\taxi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [taxi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [taxi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [taxi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [taxi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [taxi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [taxi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [taxi] SET ARITHABORT OFF 
GO
ALTER DATABASE [taxi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [taxi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [taxi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [taxi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [taxi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [taxi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [taxi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [taxi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [taxi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [taxi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [taxi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [taxi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [taxi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [taxi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [taxi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [taxi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [taxi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [taxi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [taxi] SET  MULTI_USER 
GO
ALTER DATABASE [taxi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [taxi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [taxi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [taxi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [taxi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [taxi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [taxi] SET QUERY_STORE = OFF
GO
USE [taxi]
GO
/****** Object:  Table [dbo].[accountVod]    Script Date: 03.02.2023 10:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountVod](
	[name] [nchar](10) NOT NULL,
	[ordersWin] [int] NULL,
	[money] [int] NULL,
 CONSTRAINT [PK_accountVod] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classCar]    Script Date: 03.02.2023 10:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classCar](
	[id] [int] NOT NULL,
	[name] [nchar](15) NULL,
 CONSTRAINT [PK_classCar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[infoCar]    Script Date: 03.02.2023 10:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoCar](
	[id] [int] NOT NULL,
	[serNum] [nchar](10) NULL,
	[numStrah] [nchar](10) NULL,
	[color] [nchar](10) NULL,
	[class] [nchar](15) NULL,
	[year] [nchar](10) NULL,
 CONSTRAINT [PK_infoCar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[infoVod]    Script Date: 03.02.2023 10:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[infoVod](
	[id] [int] NOT NULL,
	[name] [nchar](20) NULL,
	[lastName] [nchar](20) NULL,
	[otchestvo] [nchar](20) NULL,
	[numberPhone] [nchar](11) NULL,
	[dateStartWork] [date] NULL,
	[staj] [int] NULL,
	[reyting] [float] NULL,
	[markaCar] [nchar](20) NULL,
	[modelCar] [nchar](20) NULL,
 CONSTRAINT [PK_infoVod] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 03.02.2023 10:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] NOT NULL,
	[otkuda] [nchar](15) NULL,
	[kuda] [nchar](15) NULL,
	[typeService] [int] NULL,
	[typeClass] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 03.02.2023 10:25:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[id] [int] NOT NULL,
	[name] [nchar](20) NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accountVod] ([name], [ordersWin], [money]) VALUES (N'Дима      ', 120, 22500)
GO
INSERT [dbo].[classCar] ([id], [name]) VALUES (1, N'Эконом         ')
INSERT [dbo].[classCar] ([id], [name]) VALUES (2, N'Комфорт        ')
INSERT [dbo].[classCar] ([id], [name]) VALUES (3, N'Бизнес-класс   ')
INSERT [dbo].[classCar] ([id], [name]) VALUES (4, N'Минивен        ')
GO
INSERT [dbo].[infoCar] ([id], [serNum], [numStrah], [color], [class], [year]) VALUES (1, N'А-203     ', N'932234    ', N'черный    ', N'Комфотр        ', N'2018      ')
GO
INSERT [dbo].[infoVod] ([id], [name], [lastName], [otchestvo], [numberPhone], [dateStartWork], [staj], [reyting], [markaCar], [modelCar]) VALUES (1, N'Дима                ', N'Свитков             ', N'Дмитриевич          ', N'79871283393', CAST(N'2022-12-12' AS Date), 6, 9.1, N'kia                 ', N'rio                 ')
GO
INSERT [dbo].[order] ([id], [otkuda], [kuda], [typeService], [typeClass], [price]) VALUES (1, N'ленина         ', N'воргашор       ', 2, 3, 50)
GO
INSERT [dbo].[service] ([id], [name]) VALUES (1, N'дет. кресло         ')
INSERT [dbo].[service] ([id], [name]) VALUES (2, N'молч. водитель      ')
INSERT [dbo].[service] ([id], [name]) VALUES (3, N'большая машина      ')
INSERT [dbo].[service] ([id], [name]) VALUES (4, N'с животными         ')
INSERT [dbo].[service] ([id], [name]) VALUES (5, N'больше 4 человек    ')
INSERT [dbo].[service] ([id], [name]) VALUES (6, N'большой богажник    ')
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_classCar] FOREIGN KEY([typeClass])
REFERENCES [dbo].[classCar] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_classCar]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_service] FOREIGN KEY([typeService])
REFERENCES [dbo].[service] ([id])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_service]
GO
USE [master]
GO
ALTER DATABASE [taxi] SET  READ_WRITE 
GO
