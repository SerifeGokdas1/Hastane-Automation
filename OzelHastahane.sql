USE [master]
GO
/****** Object:  Database [OzelHastane]    Script Date: 25.12.2022 15:56:33 ******/
CREATE DATABASE [OzelHastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OzelHastane', FILENAME = N'C:\Users\Şerife GÖKDAŞ\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\OzelHastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OzelHastane_log', FILENAME = N'C:\Users\Şerife GÖKDAŞ\Desktop\MSSQL15.SQLEXPRESS\MSSQL\DATA\OzelHastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [OzelHastane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OzelHastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OzelHastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OzelHastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OzelHastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OzelHastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OzelHastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [OzelHastane] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OzelHastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OzelHastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OzelHastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OzelHastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OzelHastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OzelHastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OzelHastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OzelHastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OzelHastane] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OzelHastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OzelHastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OzelHastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OzelHastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OzelHastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OzelHastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OzelHastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OzelHastane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OzelHastane] SET  MULTI_USER 
GO
ALTER DATABASE [OzelHastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OzelHastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OzelHastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OzelHastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OzelHastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OzelHastane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OzelHastane] SET QUERY_STORE = OFF
GO
USE [OzelHastane]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[DoktorAdSoyad] [varchar](50) NULL,
	[DoktorTCNo] [char](11) NULL,
	[UzmanlikAlani] [varchar](50) NULL,
	[Unvani] [varchar](50) NULL,
	[Telefon] [char](11) NULL,
	[Adres] [varchar](50) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[PoliklinikNo] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaTCNo] [char](11) NULL,
	[DogumTarihi] [varchar](50) NULL,
	[Boy] [int] NULL,
	[Yas] [int] NULL,
	[Recete] [varchar](50) NULL,
	[RaporDurumu] [varchar](50) NULL,
	[RandevuTarihi] [varchar](50) NULL,
	[DoktorNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NULL,
	[Sifre] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[Telefon] [char](11) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinikler]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinikler](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[PoliklinikAdi] [varchar](50) NULL,
	[UzmanSayisi] [int] NULL,
	[Baskani] [varchar](50) NULL,
	[BasHemsiresi] [varchar](50) NULL,
	[YatakSayisi] [int] NULL,
 CONSTRAINT [PK_Poliklinikler] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTCNo], [UzmanlikAlani], [Unvani], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (1, N'g', N'12         ', N'sdfds', N'sd', N'(111) 111-1', N'ds', N'11.11.1111', 2)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTCNo], [UzmanlikAlani], [Unvani], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (2, N'a', N'1          ', N'a', N'aaaaa', N'(222) 222-2', N'a', N'11.11.1111', 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTCNo], [UzmanlikAlani], [Unvani], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (3, N'a', N'1          ', N'a', N'aaaaa', N'(222) 222-2', N'a', N'11.11.1111', 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTCNo], [UzmanlikAlani], [Unvani], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (4, N'grwerwerwer', N'12         ', N'sd', N'sd', N'(111) 111-1', N'ds', N'11.11.1111', 2)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTCNo], [UzmanlikAlani], [Unvani], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (5, N'', N'           ', N'', N'', N'(   )    - ', N'', N'  .  .', 0)
INSERT [dbo].[Doktorlar] ([DoktorNo], [DoktorAdSoyad], [DoktorTCNo], [UzmanlikAlani], [Unvani], [Telefon], [Adres], [DogumTarihi], [PoliklinikNo]) VALUES (6, N'dgdfg', N'12         ', N'dsgsd', N'sdgsd', N'(111) 111-1', N'dgsd', N'11.11.1111', 11)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [HastaTCNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (1, N'12121212121', N'4545', 1231, 12, N'fdgg', N'fgg', N'12134', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaTCNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (2, N'12         ', N'12', 21, 21, N'gerg', N'dfgerfg', N'21', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaTCNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (3, N'212        ', N'2121', 212, 1, N'dfgd', N'dfgdrfgfsdg<sfgsgd', N'111', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaTCNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (4, N'           ', N'111', 12, 12, N'dg', N'sfsdf', N'11111', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaTCNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (5, N'12345      ', N'2', 1, 1, N'21', N'k', N'21', 3)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaTCNo], [DogumTarihi], [Boy], [Yas], [Recete], [RaporDurumu], [RandevuTarihi], [DoktorNo]) VALUES (6, N'453        ', N'23', 14, 1, N'1', N'iş', N'54', 4)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (1, N'ghrg', N'gtg', N'gsthg', N'11212      ')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (2, N'serife', N'147', N'ffff', N'45         ')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (3, N'dd', N'dd', N'd', N'd          ')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (4, N'fg', N'gfd', N'fg', N'fg         ')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (5, N'gf', N'gf', N'gf', N'gf         ')
INSERT [dbo].[Kullanicilar] ([KullaniciNo], [KullaniciAdi], [Sifre], [Mail], [Telefon]) VALUES (6, N'aaa', N'aaa', N'aaa', N'121        ')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinikler] ON 

INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [UzmanSayisi], [Baskani], [BasHemsiresi], [YatakSayisi]) VALUES (1, N'fghdff', 12, N'fg', N'lkfg', 12)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [UzmanSayisi], [Baskani], [BasHemsiresi], [YatakSayisi]) VALUES (2, N'a', 1, N'a', N'aa', 1)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [UzmanSayisi], [Baskani], [BasHemsiresi], [YatakSayisi]) VALUES (3, N'asa', 211, N'asff', N'asfaf', 12)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [UzmanSayisi], [Baskani], [BasHemsiresi], [YatakSayisi]) VALUES (4, N'dr', 12, N'fdfhgsdfhsfghd', N'fd', 12)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [UzmanSayisi], [Baskani], [BasHemsiresi], [YatakSayisi]) VALUES (5, N'a', 1, N'a', N'a', 1)
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [PoliklinikAdi], [UzmanSayisi], [Baskani], [BasHemsiresi], [YatakSayisi]) VALUES (6, N'sdfsd', 21, N'd', N'', 0)
SET IDENTITY_INSERT [dbo].[Poliklinikler] OFF
GO
/****** Object:  StoredProcedure [dbo].[DoktorArama]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DoktorArama]
@DoktorNo int
as begin 
select * from Doktorlar where DoktorNo=@DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorEkle]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DoktorEkle]
@DoktorAdSoyad varchar(50),
@DoktorTCNo char(11),
@UzmanlikAlani varchar(50),
@Unvani varchar(50),
@Telefon char (11),
@Adres varchar(50),
@DogumTarihi varchar(50),
@PoliklinikNo int 
as begin 
insert into Doktorlar(DoktorAdSoyad, DoktorTCNo, UzmanlikAlani, Unvani, Telefon, Adres, DogumTarihi, PoliklinikNo) 
Values (@DoktorAdSoyad, @DoktorTCNo, @UzmanlikAlani, @Unvani, @Telefon, @Adres, @DogumTarihi, @PoliklinikNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorListele]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DoktorListele]
as begin 
select * from Doktorlar
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorSil]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DoktorSil]
@DoktorNo int
as begin 
delete from Doktorlar where  DoktorNo=@DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorYenile]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DoktorYenile]
@DoktorNo int,
@DoktorAdSoyad varchar(50),
@DoktorTCNo char(11),
@UzmanlikAlani varchar(50),
@Unvani varchar(50),
@Telefon char (11),
@Adres varchar(50),
@DogumTarihi varchar(50),
@PoliklinikNo int 
as begin 
Update Doktorlar  SET DoktorAdSoyad=@DoktorAdSoyad , DoktorTCNo=@DoktorTCNo, UzmanlikAlani=@UzmanlikAlani, 
Unvani= @Unvani, Telefon=@Telefon, Adres=@Adres, DogumTarihi=@DogumTarihi, PoliklinikNo =@PoliklinikNo
where DoktorNo=@DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Giris]
@KullaniciAdi varchar (50),
@Sifre varchar (50)
as begin
select * from Kullanicilar where KullaniciAdi=@KullaniciAdi and Sifre= @Sifre
end
GO
/****** Object:  StoredProcedure [dbo].[HastaArama]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaArama]
@HastaNo int
as begin
select * from Hastalar where HastaNo= @HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastaEkle]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HastaEkle]
@HastaTCNo char(11),
@DogumTarihi varchar(50),
@Boy int,
@Yas int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi varchar(50),
@DoktorNo int
as begin  
insert into Hastalar (HastaTCNo, DogumTarihi, Boy, Yas, Recete, RaporDurumu, RandevuTarihi, DoktorNo) 
Values (@HastaTCNo, @DogumTarihi, @Boy, @Yas, @Recete, @RaporDurumu, @RandevuTarihi, @DoktorNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HastaListele]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HastaListele]
as begin 
select *from Hastalar
end
GO
/****** Object:  StoredProcedure [dbo].[HastaSil]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HastaSil]
@HastaNo int
as begin 
delete from Hastalar where HastaNo=@HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastayaGoreDoktor]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastayaGoreDoktor]
as begin 
select * from Hastalar h left join Doktorlar d on h.DoktorNo= d.DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastaYenile]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HastaYenile]
@HastaNo int,
@HastaTCNo char(11),
@DogumTarihi varchar(50),
@Boy int,
@Yas int,
@Recete varchar(50),
@RaporDurumu varchar(50),
@RandevuTarihi varchar(50),
@DoktorNo int
as begin  
Update Hastalar  set HastaTCNo=@HastaTCNo, DogumTarihi=@DogumTarihi, Boy=@Boy, Yas=@Yas, Recete=@Recete, 
RaporDurumu=@RaporDurumu, RandevuTarihi=@RandevuTarihi, DoktorNo= @DoktorNo
where HastaNo=@HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[KullaniciEkle]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KullaniciEkle]
@KullaniciAdi varchar(50),
@Sifre varchar(50),
@Mail varchar (50),
@Telefon char(11)
as begin 
insert into Kullanicilar(KullaniciAdi, Sifre, Mail, Telefon)
Values (@KullaniciAdi, @Sifre, @Mail, @Telefon)
end
GO
/****** Object:  StoredProcedure [dbo].[KullaniciListele]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KullaniciListele]
as begin 
select * from Kullanicilar
end
GO
/****** Object:  StoredProcedure [dbo].[KullaniciYenile]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KullaniciYenile]
@KullaniciNo int,
@KullaniciAdi varchar(50),
@Sifre varchar(50),
@Mail varchar (50),
@Telefon char(11)
as begin 
Update Kullanicilar set KullaniciAdi=@KullaniciAdi, Sifre=@Sifre, Mail=@Mail, Telefon=@Telefon
where KullaniciNo=@KullaniciNo
end
GO
/****** Object:  StoredProcedure [dbo].[KulliciSil]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[KulliciSil]
@KullaniciNo int
as begin 
delete from Kullanicilar where KullaniciNo=@KullaniciNo
end
GO
/****** Object:  StoredProcedure [dbo].[OrtakHastaDoktor]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrtakHastaDoktor]
as begin 
select * from Hastalar inner join Doktorlar on Hastalar.DoktorNo=Doktorlar.DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikEkle]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PoliklinikEkle]
@PoliklinikAdi varchar(50),
@UzmanSayisi int,
@Baskani varchar(50),
@BasHemsiresi varchar(50),
@YatakSayisi int
as begin 
insert into Poliklinikler(PoliklinikAdi, UzmanSayisi, Baskani, BasHemsiresi, YatakSayisi)
Values (@PoliklinikAdi, @UzmanSayisi, @Baskani, @BasHemsiresi, @YatakSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikHasta]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikHasta]
as begin 
select *  from Poliklinikler p full join Hastalar h on p.PoliklinikNo=h.HastaNo 
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikListele]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PoliklinikListele]
as begin 
select * from Poliklinikler
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikNoSorgu]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikNoSorgu]
as begin 
select DoktorAdSoyad, UzmanlikAlani, Unvani, PoliklinikAdi, Baskani from Doktorlar d inner join Poliklinikler p on d.PoliklinikNo= p.PoliklinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikSil]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PoliklinikSil]
@PoliklinikNo int
as begin 
delete from Poliklinikler where PoliklinikNo=@PoliklinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikYenile]    Script Date: 25.12.2022 15:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PoliklinikYenile]
@PoliklinikNo int,
@PoliklinikAdi varchar(50),
@UzmanSayisi int,
@Baskani varchar(50),
@BasHemsiresi varchar(50),
@YatakSayisi int
as begin 
Update Poliklinikler set PoliklinikAdi=@PoliklinikAdi, UzmanSayisi=@UzmanSayisi, Baskani=@Baskani, BasHemsiresi=@BasHemsiresi, YatakSayisi=@YatakSayisi
where PoliklinikNo=@PoliklinikNo
end
GO
USE [master]
GO
ALTER DATABASE [OzelHastane] SET  READ_WRITE 
GO
