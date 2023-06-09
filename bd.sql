USE [master]
GO
/****** Object:  Database [Decoration]    Script Date: 31.03.2023 12:21:59 ******/
CREATE DATABASE [Decoration]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Decoration', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Decoration.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Decoration_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Decoration_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Decoration] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Decoration].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Decoration] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Decoration] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Decoration] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Decoration] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Decoration] SET ARITHABORT OFF 
GO
ALTER DATABASE [Decoration] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Decoration] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Decoration] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Decoration] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Decoration] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Decoration] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Decoration] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Decoration] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Decoration] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Decoration] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Decoration] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Decoration] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Decoration] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Decoration] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Decoration] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Decoration] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Decoration] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Decoration] SET RECOVERY FULL 
GO
ALTER DATABASE [Decoration] SET  MULTI_USER 
GO
ALTER DATABASE [Decoration] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Decoration] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Decoration] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Decoration] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Decoration] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Decoration] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Decoration', N'ON'
GO
ALTER DATABASE [Decoration] SET QUERY_STORE = OFF
GO
USE [Decoration]
GO
/****** Object:  Table [dbo].[заказ_клиента]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[заказ_клиента](
	[id_заказа_клиента] [int] NOT NULL,
	[дата_заказа] [datetime] NULL,
	[дата_доставки] [datetime] NULL,
	[id_пункт_выдачи] [int] NULL,
	[id_клиента] [int] NULL,
	[код_получения] [int] NULL,
	[id_статус_заказа] [int] NULL,
 CONSTRAINT [PK_заказ_клиента] PRIMARY KEY CLUSTERED 
(
	[id_заказа_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[категория_товара]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[категория_товара](
	[id_категории_товара] [int] NOT NULL,
	[наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_категория_товара] PRIMARY KEY CLUSTERED 
(
	[id_категории_товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[пользователи]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[пользователи](
	[id_пользователя] [int] NOT NULL,
	[фио] [nvarchar](100) NOT NULL,
	[логин] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[id_роли] [int] NOT NULL,
 CONSTRAINT [PK_пользователи] PRIMARY KEY CLUSTERED 
(
	[id_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[продукция]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[продукция](
	[id_продукции] [int] NOT NULL,
	[артикул] [nvarchar](50) NULL,
	[наименование] [nvarchar](50) NULL,
	[еденица_измерения] [nvarchar](50) NULL,
	[стоимость] [money] NULL,
	[размер_максимально_возможной_скидки] [int] NULL,
	[производитель] [nvarchar](50) NULL,
	[поставщик] [nvarchar](50) NULL,
	[id_категория_товара] [int] NULL,
	[действующая_скидка] [int] NULL,
	[количество_на_складе] [int] NULL,
	[описание] [nvarchar](50) NULL,
	[изображение] [nvarchar](50) NULL,
 CONSTRAINT [PK_продукция] PRIMARY KEY CLUSTERED 
(
	[id_продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[пункты_выдачи]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[пункты_выдачи](
	[id_пункта_выдачи] [int] NOT NULL,
	[адрес] [nvarchar](100) NULL,
 CONSTRAINT [PK_пункты_выдачи] PRIMARY KEY CLUSTERED 
(
	[id_пункта_выдачи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[роли_пользоваетелей]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[роли_пользоваетелей](
	[id_роли] [int] NOT NULL,
	[наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_роли_пользоваетелей] PRIMARY KEY CLUSTERED 
(
	[id_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[состав_заказа_клиента]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[состав_заказа_клиента](
	[id_состава_заказа] [int] NOT NULL,
	[id_продукции] [int] NOT NULL,
	[id_заказа_клиента] [int] NOT NULL,
	[количество] [int] NOT NULL,
 CONSTRAINT [PK_состав_заказа_клиента] PRIMARY KEY CLUSTERED 
(
	[id_состава_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[статус_заказа]    Script Date: 31.03.2023 12:21:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[статус_заказа](
	[id_статуса_заказа] [int] NOT NULL,
	[наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_статус_заказа] PRIMARY KEY CLUSTERED 
(
	[id_статуса_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (1, CAST(N'2022-05-01T00:00:00.000' AS DateTime), CAST(N'2022-05-07T00:00:00.000' AS DateTime), 2, 4, 111, 1)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (2, CAST(N'2022-05-02T00:00:00.000' AS DateTime), CAST(N'2022-05-08T00:00:00.000' AS DateTime), 8, NULL, 112, 1)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (3, CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-05-09T00:00:00.000' AS DateTime), 10, NULL, 113, 1)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (4, CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 12, NULL, 114, 2)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (5, CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 15, NULL, 115, 1)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (6, CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 18, 36, 116, 1)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (7, CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 20, NULL, 117, 2)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (8, CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 25, NULL, 118, 1)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (9, CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 30, NULL, 119, 2)
INSERT [dbo].[заказ_клиента] ([id_заказа_клиента], [дата_заказа], [дата_доставки], [id_пункт_выдачи], [id_клиента], [код_получения], [id_статус_заказа]) VALUES (10, CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 36, 40, 120, 1)
GO
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (1, N'Ароматы для дома')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (2, N'Вазы')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (3, N'Горшки и подставки')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (4, N'Интерьерные аксессуары')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (5, N'Картины и фоторамки')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (6, N'Свечи')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (7, N'Часы')
INSERT [dbo].[категория_товара] ([id_категории_товара], [наименование]) VALUES (8, N'Шкатулки и подставки')
GO
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (1, N'Алексеев  Владислав Аркадьевич', N'loginDEbct2018', N'Qg3gff', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (2, N'Савельева  Евфросиния Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (3, N'Никонов  Мэлс Лукьевич', N'loginDEuro2018', N'a1MIcO', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (4, N'Горшкова  Агафья Онисимовна', N'loginDEpst2018', N'0CyGnX', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (5, N'Горбачёв  Пантелеймон Германович', N'loginDEpsu2018', N'Vx9cQ{', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (6, N'Ершова  Иванна Максимовна', N'loginDEzqs2018', N'qM9p7i', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (7, N'Туров  Денис Геласьевич', N'loginDEioe2018', N'yMPu&2', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (8, N'Носова  Наина Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (9, N'Куликов  Андрей Святославович', N'loginDEfsp2018', N'&dtlI+', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (10, N'Нестеров  Агафон Георгьевич', N'loginDExcd2018', N'SZXZNL', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (11, N'Козлов  Геласий Христофорович', N'loginDEvlf2018', N'O5mXc2', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (12, N'Борисова  Анжелика Анатольевна', N'loginDEanv2018', N'Xiq}M3', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (13, N'Суханов  Станислав Фролович', N'loginDEzde2018', N'tlO3x&', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (14, N'Тетерина  Феврония Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (15, N'Муравьёва  Александра Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (16, N'Новикова  Лукия Ярославовна', N'loginDEwjv2018', N'ZfseKA', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (17, N'Агафонова  Лариса Михаиловна', N'loginDEiry2018', N'5zu7+}', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (18, N'Сергеева  Агата Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (19, N'Колобова  Елена Евгеньевна', N'loginDExxv2018', N'+daE|T', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (20, N'Ситников  Николай Филатович', N'loginDEbto2018', N'b1iYMI', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (21, N'Белов  Роман Иринеевич', N'loginDEfbs2018', N'v90Rep', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (22, N'Волкова  Алла Лукьевна', N'loginDEple2018', N'WlW+l8', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (23, N'Кудрявцева  Таисия Игоревна', N'loginDEhhx2018', N'hmCHeQ', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (24, N'Семёнова  Октябрина Христофоровна', N'loginDEayn2018', N'Ka2Fok', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (25, N'Смирнов  Сергей Яковович', N'loginDEwld2018', N'y9HStF', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (26, N'Брагина  Алина Валерьевна', N'loginDEhuu2018', N'X31OEf', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (27, N'Евсеев  Игорь Донатович', N'loginDEmjb2018', N'5mm{ch', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (28, N'Суворов  Илья Евсеевич', N'loginDEdgp2018', N'1WfJjo', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (29, N'Котов  Денис Мартынович', N'loginDEgyi2018', N'|7nYPc', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (30, N'Бобылёва  Юлия Егоровна', N'loginDEmvn2018', N'Mrr9e0', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (31, N'Брагин  Бронислав Георгьевич', N'loginDEfoj2018', N'nhGc+D', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (32, N'Александров  Владимир Дамирович', N'loginDEuuo2018', N'42XmH1', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (33, N'Фокин  Ириней Ростиславович', N'loginDEhsj2018', N's+jrMW', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (34, N'Воронов  Митрофан Антонович', N'loginDEvht2018', N'zMyS8Z', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (35, N'Маслов  Мстислав Антонинович', N'loginDEeqo2018', N'l5CBqA', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (36, N'Щербаков  Георгий Богданович', N'loginDExrf2018', N'mhpRIT', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (37, N'Кириллова  Эмилия Федосеевна', N'loginDEfku2018', N'a1m+8c', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (38, N'Васильев  Серапион Макарович', N'loginDExix2018', N'hzxtnn', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (39, N'Галкина  Олимпиада Владленовна', N'loginDEqrf2018', N'mI8n58', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (40, N'Яковлева  Ксения Онисимовна', N'loginDEhlk2018', N'g0jSed', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (41, N'Калашникова  Александра Владимировна', N'loginDEwoe2018', N'yOtw2F', 1)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (42, N'Медведьева  Таисия Тихоновна', N'loginDExyu2018', N'7Fg}9p', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (43, N'Карпова  Ольга Лукьевна', N'loginDEcor2018', N'2cIrC8', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (44, N'Герасимов  Мстислав Дамирович', N'loginDEqon2018', N'YeFbh6', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (45, N'Тимофеева  Ксения Валерьевна', N'loginDEyfd2018', N'8aKdb0', 2)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (46, N'Горбунов  Вячеслав Станиславович', N'loginDEtto2018', N'qXYDuu', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (47, N'Кошелева  Кира Владиславовна', N'loginDEdal2018', N'cJWXL0', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (48, N'Панфилова  Марина Борисовна', N'loginDEbjs2018', N'Xap2ct', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (49, N'Кудрявцев  Матвей Игоревич', N'loginDEdof2018', N'kD|LRU', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (50, N'Зуев  Эдуард Пантелеймонович', N'loginDEsnh2018', N'2323423', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (51, N'Архипова Оливия Дмитриевна', N'loginSuper', N'super', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (52, N'Никонова Татьяна Захаровна', N'loginDuper', N'duper', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (53, N'Рябова Диана Павловна', N'loginKavo', N'kavo', 3)
INSERT [dbo].[пользователи] ([id_пользователя], [фио], [логин], [пароль], [id_роли]) VALUES (54, N'Бархатный Кефтемыч', N'123', N'123', 1)
GO
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (2, N'V783T5', N'Ваза', N'шт.', 1300.0000, 25, N'Home Philosophy', N'Стокманн', 2, 2, 13, N'Ваза из керамики Betty', N'V783T5.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (3, N'V483R7', N'Ваза', N'шт.', 100.0000, 15, N'Весна', N'Hoff', 2, 3, 7, N'Ваза «Весна» 18 см стекло, цвет прозрачный', N'V483R7.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (4, N'S563T4', N'Свеча', N'шт.', 1000.0000, 20, N'True Scents', N'Hoff', 6, 3, 12, N'Свеча в стакане True Scents', N'S563T4.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (5, N'P927R2', N'Подставка', N'шт.', 4000.0000, 15, N'Valley', N'Стокманн', 3, 2, 4, N'Подставка для цветочных горшков Valley', N'P927R2.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (6, N'F933T5', N'Кашпо', N'шт.', 1400.0000, 20, N'Cube Color', N'Hoff', 3, 4, 23, N'Настольное кашпо с автополивом Cube Color', N'F933T5.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (7, N'H023R8', N'Часы', N'шт.', 5600.0000, 15, N'Umbra', N'Стокманн', 7, 2, 6, N'Часы настенные Ribbon 30,5 см', N'H023R8.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (8, N'H937R3', N'Часы', N'шт.', 999.0000, 10, N'Umbra', N'Hoff', 7, 3, 4, N'Часы настенные 6500 30,2 см', N'H937R3.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (9, N'D034T5', N'Диффузор', N'шт.', 800.0000, 20, N'Miksdo', N'Hoff', 1, 2, 15, N'Диффузор Mikado intense Апельсин с корицей', N'D034T5.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (10, N'P936E4', N'Подставка', N'шт.', 3590.0000, 15, N'Umbra', N'Стокманн', 3, 4, 9, N'Подставка для газет и журналов Zina', N'P936E4.jpg')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (11, N'K937T4', N'Аромат', N'шт.', 7900.0000, 25, N'Esteban', N'Стокманн', 1, 2, 17, N'Деко-букет Кедр 250 мл', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (12, N'P846R4', N'Подставка', N'шт.', 1400.0000, 15, N'Valley', N'Стокманн', 3, 3, 12, N'Подставка для цветочных горшков 55x25x35 см Valley', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (13, N'S039T5', N'Свеча', N'шт.', 250.0000, 10, N'True Scents', N'Hoff', 6, 2, 18, N'Свеча True Moods Feel happy', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (14, N'D947R5', N'Диффузор', N'шт.', 500.0000, 5, N'Aroma', N'Hoff', 1, 4, 6, N'Диффузор Aroma Harmony Lavender', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (15, N'F903T5', N'Фоторамка', N'шт.', 600.0000, 15, N'Gallery', N'Hoff', 5, 2, 3, N'Фоторамка Gallery 20х30 см', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (16, N'S937T5', N'Подсвечник', N'шт.', 2600.0000, 10, N'Kersten', N'Стокманн', 1, 3, 23, N'Подсвечник 37 см', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (17, N'R836R5', N'Шкатулка', N'шт.', 8000.0000, 30, N'Umbra', N'Стокманн', 8, 5, 3, N'Шкатулка для украшений из дерева Stowit', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (18, N'F837T5', N'Фоторамка', N'шт.', 999.0000, 5, N'Gallery', N'Hoff', 5, 2, 15, N'Шкатулка для украшений из дерева Stowit', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (19, N'V432R6', N'Ваза', N'шт.', 1990.0000, 10, N'Kersten', N'Стокманн', 2, 3, 30, N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (20, N'F928T5', N'Фоторамка', N'шт.', 1590.0000, 25, N'Umbra', N'Стокманн', 5, 2, 13, N'Фоторамка Prisma 10х10 см', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (22, N'K083T5', N'Аромат', N'шт.', 2790.0000, 20, N'Esteban', N'Стокманн', 1, 2, 6, N'Сменный аромат Figue noire 250 мл', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (24, N'R922T5', N'Шкатулка', N'шт.', 690.0000, 10, N'Home Philosophy', N'Стокманн', 8, 2, 4, N'Шкатулка из керамики Lana 6х7 см', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (25, N'B025Y5', N'Блюдо', N'шт.', 1890.0000, 5, N'Home Philosophy', N'Стокманн', 4, 3, 8, N'Блюдо декоративное flower 35 см Home Philosophy', N'')
INSERT [dbo].[продукция] ([id_продукции], [артикул], [наименование], [еденица_измерения], [стоимость], [размер_максимально_возможной_скидки], [производитель], [поставщик], [id_категория_товара], [действующая_скидка], [количество_на_складе], [описание], [изображение]) VALUES (26, N'D826T5', N'Диффузор', N'шт.', 600.0000, 5, N'True Scents', N'Hoff', 1, 2, 13, N'Диффузор True Scents 45 мл манго', N'')
GO
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (1, N'344288, г. Ковров, ул. Чехова, 1')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (2, N'614164, г.Ковров,  ул. Степная, 30')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (3, N'394242, г. Ковров, ул. Коммунистическая, 43')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (4, N'660540, г. Ковров, ул. Солнечная, 25')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (5, N'125837, г. Ковров, ул. Шоссейная, 40')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (6, N'125703, г. Ковров, ул. Партизанская, 49')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (7, N'625283, г. Ковров, ул. Победы, 46')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (8, N'614611, г. Ковров, ул. Молодежная, 50')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (9, N'454311, г.Ковров, ул. Новая, 19')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (10, N'660007, г.Ковров, ул. Октябрьская, 19')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (11, N'603036, г. Ковров, ул. Садовая, 4')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (12, N'450983, г.Ковров, ул. Комсомольская, 26')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (13, N'394782, г. Ковров, ул. Чехова, 3')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (14, N'603002, г. Ковров, ул. Дзержинского, 28')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (15, N'450558, г. Ковров, ул. Набережная, 30')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (16, N'394060, г.Ковров, ул. Фрунзе, 43')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (17, N'410661, г. Ковров, ул. Школьная, 50')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (18, N'625590, г. Ковров, ул. Коммунистическая, 20')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (19, N'625683, г. Ковров, ул. 8 Марта')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (20, N'400562, г. Ковров, ул. Зеленая, 32')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (21, N'614510, г. Ковров, ул. Маяковского, 47')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (22, N'410542, г. Ковров, ул. Светлая, 46')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (23, N'620839, г. Ковров, ул. Цветочная, 8')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (24, N'443890, г. Ковров, ул. Коммунистическая, 1')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (25, N'603379, г. Ковров, ул. Спортивная, 46')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (26, N'603721, г. Ковров, ул. Гоголя, 41')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (27, N'410172, г. Ковров, ул. Северная, 13')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (28, N'420151, г. Ковров, ул. Вишневая, 32')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (29, N'125061, г. Ковров, ул. Подгорная, 8')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (30, N'630370, г. Ковров, ул. Шоссейная, 24')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (31, N'614753, г. Ковров, ул. Полевая, 35')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (32, N'426030, г. Ковров, ул. Маяковского, 44')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (33, N'450375, г. Ковров ул. Клубная, 44')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (34, N'625560, г. Ковров, ул. Некрасова, 12')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (35, N'630201, г. Ковров, ул. Комсомольская, 17')
INSERT [dbo].[пункты_выдачи] ([id_пункта_выдачи], [адрес]) VALUES (36, N'190949, г. Ковров, ул. Мичурина, 26')
GO
INSERT [dbo].[роли_пользоваетелей] ([id_роли], [наименование]) VALUES (1, N'Администратор')
INSERT [dbo].[роли_пользоваетелей] ([id_роли], [наименование]) VALUES (2, N'Менеджер')
INSERT [dbo].[роли_пользоваетелей] ([id_роли], [наименование]) VALUES (3, N'Клиент')
GO
ALTER TABLE [dbo].[заказ_клиента]  WITH CHECK ADD  CONSTRAINT [FK_заказ_клиента_пользователи] FOREIGN KEY([id_клиента])
REFERENCES [dbo].[пользователи] ([id_пользователя])
GO
ALTER TABLE [dbo].[заказ_клиента] CHECK CONSTRAINT [FK_заказ_клиента_пользователи]
GO
ALTER TABLE [dbo].[заказ_клиента]  WITH CHECK ADD  CONSTRAINT [FK_заказ_клиента_пункты_выдачи] FOREIGN KEY([id_пункт_выдачи])
REFERENCES [dbo].[пункты_выдачи] ([id_пункта_выдачи])
GO
ALTER TABLE [dbo].[заказ_клиента] CHECK CONSTRAINT [FK_заказ_клиента_пункты_выдачи]
GO
ALTER TABLE [dbo].[пользователи]  WITH CHECK ADD  CONSTRAINT [FK_пользователи_роли_пользоваетелей] FOREIGN KEY([id_роли])
REFERENCES [dbo].[роли_пользоваетелей] ([id_роли])
GO
ALTER TABLE [dbo].[пользователи] CHECK CONSTRAINT [FK_пользователи_роли_пользоваетелей]
GO
ALTER TABLE [dbo].[продукция]  WITH CHECK ADD  CONSTRAINT [FK_продукция_категория_товара] FOREIGN KEY([id_категория_товара])
REFERENCES [dbo].[категория_товара] ([id_категории_товара])
GO
ALTER TABLE [dbo].[продукция] CHECK CONSTRAINT [FK_продукция_категория_товара]
GO
ALTER TABLE [dbo].[состав_заказа_клиента]  WITH CHECK ADD  CONSTRAINT [FK_состав_заказа_клиента_заказ_клиента] FOREIGN KEY([id_заказа_клиента])
REFERENCES [dbo].[заказ_клиента] ([id_заказа_клиента])
GO
ALTER TABLE [dbo].[состав_заказа_клиента] CHECK CONSTRAINT [FK_состав_заказа_клиента_заказ_клиента]
GO
ALTER TABLE [dbo].[состав_заказа_клиента]  WITH CHECK ADD  CONSTRAINT [FK_состав_заказа_клиента_продукция] FOREIGN KEY([id_продукции])
REFERENCES [dbo].[продукция] ([id_продукции])
GO
ALTER TABLE [dbo].[состав_заказа_клиента] CHECK CONSTRAINT [FK_состав_заказа_клиента_продукция]
GO
USE [master]
GO
ALTER DATABASE [Decoration] SET  READ_WRITE 
GO
