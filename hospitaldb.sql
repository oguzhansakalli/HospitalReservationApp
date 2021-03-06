USE [master]
GO
/****** Object:  Database [HospitalReservationSystem]    Script Date: 19/12/2019 21:24:54 ******/
CREATE DATABASE [HospitalReservationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HospitalReservationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HospitalReservationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HospitalReservationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HospitalReservationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HospitalReservationSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HospitalReservationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HospitalReservationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HospitalReservationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HospitalReservationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HospitalReservationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HospitalReservationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HospitalReservationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [HospitalReservationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HospitalReservationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HospitalReservationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HospitalReservationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HospitalReservationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HospitalReservationSystem] SET QUERY_STORE = OFF
GO
USE [HospitalReservationSystem]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 19/12/2019 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[PersonnelID] [int] NOT NULL,
	[SessionID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[AStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 19/12/2019 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DName] [nvarchar](30) NOT NULL,
	[DStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 19/12/2019 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[PersonnelID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[PName] [nvarchar](25) NOT NULL,
	[PLastname] [nvarchar](25) NOT NULL,
	[PStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[PersonnelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientInformations]    Script Date: 19/12/2019 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientInformations](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Lastname] [nvarchar](30) NOT NULL,
	[TCNo] [nvarchar](11) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Birthdate] [datetime] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PatientInformations] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 19/12/2019 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[STime] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 19/12/2019 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](16) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[UType] [int] NOT NULL,
	[UStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [PatientID], [PersonnelID], [SessionID], [Date], [AStatus]) VALUES (1, 1, 3, 4, CAST(N'2019-12-25T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentID], [PatientID], [PersonnelID], [SessionID], [Date], [AStatus]) VALUES (2, 2, 4, 6, CAST(N'2019-12-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentID], [PatientID], [PersonnelID], [SessionID], [Date], [AStatus]) VALUES (3, 1, 4, 2, CAST(N'2019-12-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentID], [PatientID], [PersonnelID], [SessionID], [Date], [AStatus]) VALUES (4, 3, 6, 1, CAST(N'2019-12-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Appointments] ([AppointmentID], [PatientID], [PersonnelID], [SessionID], [Date], [AStatus]) VALUES (5, 2, 5, 2, CAST(N'2019-12-24T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (1, N'Çocuk Hastalıkları', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (2, N'Diş ve Ağız Sağlığı', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (3, N'Cildiye', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (4, N'Dahiliye', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (6, N'Kulak-Burun-Boğaz', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (7, N'Resepsiyon', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DName], [DStatus]) VALUES (8, N'Beyin Cerrahi', 0)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (1, 3, 7, N'Fatma', N'Yenilmez', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (3, 4, 2, N'Ayhan', N'Mutlu', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (4, 2, 3, N'Pelin', N'Işık', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (5, 10, 2, N'Hakan', N'Yıldırım', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (6, 12, 6, N'Seyhan', N'Zeki', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (7, 13, 8, N'Ali', N'Akın', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (8, 9, 1, N'Ayşe', N'Durmaz', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (9, 14, 4, N'Kaya', N'Çilingir', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (10, 15, 6, N'Günay', N'Çevik', 1)
INSERT [dbo].[Employees] ([PersonnelID], [UserID], [DepartmentID], [PName], [PLastname], [PStatus]) VALUES (11, 16, 1, N'Lale', N'Demir', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[PatientInformations] ON 

INSERT [dbo].[PatientInformations] ([PatientID], [Name], [Lastname], [TCNo], [Gender], [Birthdate], [Phone], [Address]) VALUES (1, N'Özgür', N'Bıkmaz', N'52958910272', 0, CAST(N'1995-05-17T00:00:00.000' AS DateTime), N'(543) 654-1235', N'Bahçelievler')
INSERT [dbo].[PatientInformations] ([PatientID], [Name], [Lastname], [TCNo], [Gender], [Birthdate], [Phone], [Address]) VALUES (2, N'Nurullah', N'Karataş', N'57965412305', 0, CAST(N'1997-09-16T00:00:00.000' AS DateTime), N'(536) 432-7891', N'Mecidiyeköy/İstanbul')
INSERT [dbo].[PatientInformations] ([PatientID], [Name], [Lastname], [TCNo], [Gender], [Birthdate], [Phone], [Address]) VALUES (3, N'Butkan', N'Ün', N'54627089622', 0, CAST(N'1996-04-03T10:06:07.000' AS DateTime), N'(543) 654-7891', N'Maltepe/İstanbul')
SET IDENTITY_INSERT [dbo].[PatientInformations] OFF
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (1, N'09:00 - 10:00')
INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (2, N'10:00 - 11:00')
INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (3, N'11:00 - 12:00')
INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (4, N'13:00 - 14:00')
INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (5, N'14:00 - 15:00')
INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (6, N'15:00 - 16:00')
INSERT [dbo].[Sessions] ([SessionID], [STime]) VALUES (7, N'16:00 - 17:00')
SET IDENTITY_INSERT [dbo].[Sessions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (1, N'admin', N'12345', 0, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (2, N'personel001', N'asd123', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (3, N'recept01', N'deneme', 2, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (4, N'personel003', N'asd', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (5, N'admin', N'asdf', 0, 0)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (9, N'personel004', N'1234', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (10, N'personel005', N'1234', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (12, N'personel006', N'1234', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (13, N'personel007', N'1234', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (14, N'personel008', N'1234', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (15, N'personel009', N'1234', 1, 1)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [UType], [UStatus]) VALUES (16, N'personel010', N'1234', 1, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Employees] FOREIGN KEY([PersonnelID])
REFERENCES [dbo].[Employees] ([PersonnelID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Employees]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_PatientInformations] FOREIGN KEY([PatientID])
REFERENCES [dbo].[PatientInformations] ([PatientID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_PatientInformations]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Sessions] FOREIGN KEY([SessionID])
REFERENCES [dbo].[Sessions] ([SessionID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Sessions]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Users]
GO
USE [master]
GO
ALTER DATABASE [HospitalReservationSystem] SET  READ_WRITE 
GO
