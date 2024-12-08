USE [master]
GO
/****** Object:  Database [Project_Test]    Script Date: 8/19/2024 10:55:57 PM ******/
CREATE DATABASE [Project_Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_Test', FILENAME = N'/var/opt/mssql/data/Project_Test.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_Test_log', FILENAME = N'/var/opt/mssql/data/Project_Test_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Project_Test] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_Test] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_Test] SET  MULTI_USER 
GO
ALTER DATABASE [Project_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_Test', N'ON'
GO
ALTER DATABASE [Project_Test] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project_Test] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project_Test]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id_Activity] [int] IDENTITY(1,1) NOT NULL,
	[Sets] [int] NULL,
	[Reps] [int] NULL,
	[Time] [decimal](3, 1) NULL,
	[RestTime] [int] NULL,
	[Weight] [decimal](3, 1) NULL,
	[Id_Exercise] [int] NOT NULL,
	[Id_Routine] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Activity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id_Appointment] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
	[Date] [date] NULL,
	[Hour] [time](7) NULL,
	[CreationDate] [date] NULL,
	[Id_Trainer] [int] NULL,
	[Id_Client] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Appointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id_Client] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
	[PaymentDate] [date] NULL,
	[CreationDate] [date] NULL,
	[Id_User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id_Coupon] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](15) NOT NULL,
	[Value] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[Uses] [int] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id_Coupon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id_Employee] [int] IDENTITY(1,1) NOT NULL,
	[HiringDate] [date] NULL,
	[CreationDate] [date] NULL,
	[Id_User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id_Equipment] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[Img] [varchar](255) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Id_Equipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exercises]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exercises](
	[Id_Exercise] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[CreationDate] [varchar](50) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[FK_Id_Equipment] [int] NOT NULL,
 CONSTRAINT [PK_Exercises] PRIMARY KEY CLUSTERED 
(
	[Id_Exercise] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupClasses]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupClasses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[className] [varchar](255) NOT NULL,
	[classDescription] [text] NOT NULL,
	[maxCapacity] [int] NOT NULL,
	[classTime] [time](7) NULL,
	[classDuration] [int] NOT NULL,
	[days] [varchar](255) NOT NULL,
	[creationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InactiveDiscount]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InactiveDiscount](
	[Id_Discount] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NULL,
	[CreationDate] [date] NOT NULL,
	[Months] [int] NOT NULL,
 CONSTRAINT [PK_InactiveDiscount] PRIMARY KEY CLUSTERED 
(
	[Id_Discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[PdfDocument] [varbinary](max) NOT NULL,
	[XmlDocument] [varbinary](max) NOT NULL,
	[PaymentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[Id_Measurement] [int] IDENTITY(1,1) NOT NULL,
	[Height] [int] NOT NULL,
	[FatPercentage] [float] NOT NULL,
	[Weight] [float] NOT NULL,
	[Id_Appointment] [int] NOT NULL,
	[MusclePercentage] [float] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Measurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Membership]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Membership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NULL,
	[GroupsLimit] [int] NOT NULL,
	[CreationDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewClientDiscount]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewClientDiscount](
	[Id_Discount] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NULL,
	[CreationDate] [date] NOT NULL,
 CONSTRAINT [PK_NewClientDiscount] PRIMARY KEY CLUSTERED 
(
	[Id_Discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Password]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Password](
	[Id_Password] [int] IDENTITY(1,1) NOT NULL,
	[PasswordEncrypted] [nvarchar](255) NOT NULL,
	[FKIdUser] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id_Payment] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
	[Date] [date] NULL,
	[Method] [varchar](20) NULL,
	[Amount] [float] NULL,
	[Enrollment_fee] [float] NULL,
	[Id_User] [int] NULL,
	[Document] [varbinary](max) NULL,
	[MembershipId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Payment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonalTrainer]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonalTrainer](
	[Id_PersonalTrainer] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](20) NULL,
	[Date] [date] NULL,
	[Hour] [time](7) NULL,
	[CreationDate] [date] NULL,
	[Id_Trainer] [int] NULL,
	[Id_Client] [int] NULL,
 CONSTRAINT [PK_PersonalTrainer] PRIMARY KEY CLUSTERED 
(
	[Id_PersonalTrainer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id_Role] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[Permission] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Routine]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Routine](
	[Id_Routine] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NULL,
	[Name] [varchar](40) NULL,
	[Comments] [varchar](100) NULL,
	[CreationDate] [date] NULL,
	[Id_TrainingPlan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Routine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[Id_Token] [int] IDENTITY(1,1) NOT NULL,
	[Value] [varchar](6) NULL,
	[CreationDate] [date] NULL,
	[Id_User] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingPlan]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingPlan](
	[Id_TrainingPlan] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](40) NULL,
	[Goal] [varchar](50) NULL,
	[DaysNumber] [int] NULL,
	[CreationDate] [date] NULL,
	[ExpireDate] [date] NULL,
	[Id_Measurement] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_TrainingPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingRecord]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingRecord](
	[TrainingRecordId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityId] [int] NULL,
	[Id_User] [int] NULL,
	[CreationDate] [date] NOT NULL,
	[Sets] [int] NULL,
	[Weight] [decimal](3, 1) NULL,
	[Time] [int] NULL,
	[EX_Name] [varchar](255) NULL,
	[RestTime] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrainingRecordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TuitionDiscount]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuitionDiscount](
	[Id_Discount] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NULL,
	[CreationDate] [date] NOT NULL,
 CONSTRAINT [PK_TuitionDiscount] PRIMARY KEY CLUSTERED 
(
	[Id_Discount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_GROUPS]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_GROUPS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FK_ID_GROUPS] [int] NOT NULL,
	[FK_ID_USER] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id_User] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[LastName1] [varchar](255) NOT NULL,
	[LastName2] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Gender] [varchar](255) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[UserType] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Exercise] FOREIGN KEY([Id_Exercise])
REFERENCES [dbo].[Exercises] ([Id_Exercise])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Exercise]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_Routine] FOREIGN KEY([Id_Routine])
REFERENCES [dbo].[Routine] ([Id_Routine])
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_Routine]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Client] FOREIGN KEY([Id_Client])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Client]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Trainer] FOREIGN KEY([Id_Trainer])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Trainer]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[Exercises]  WITH CHECK ADD  CONSTRAINT [FK_Exercise_Equipment] FOREIGN KEY([FK_Id_Equipment])
REFERENCES [dbo].[Equipment] ([Id_Equipment])
GO
ALTER TABLE [dbo].[Exercises] CHECK CONSTRAINT [FK_Exercise_Equipment]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([id_Payment])
GO
ALTER TABLE [dbo].[Measurement]  WITH CHECK ADD  CONSTRAINT [FK_Measurement_Appointment] FOREIGN KEY([Id_Appointment])
REFERENCES [dbo].[Appointment] ([Id_Appointment])
GO
ALTER TABLE [dbo].[Measurement] CHECK CONSTRAINT [FK_Measurement_Appointment]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Membership] FOREIGN KEY([MembershipId])
REFERENCES [dbo].[Membership] ([Id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Membership]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_User]
GO
ALTER TABLE [dbo].[Routine]  WITH CHECK ADD  CONSTRAINT [FK_Routine_TrainingPlan] FOREIGN KEY([Id_TrainingPlan])
REFERENCES [dbo].[TrainingPlan] ([Id_TrainingPlan])
GO
ALTER TABLE [dbo].[Routine] CHECK CONSTRAINT [FK_Routine_TrainingPlan]
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD  CONSTRAINT [FK_Token_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Token] CHECK CONSTRAINT [FK_Token_User]
GO
ALTER TABLE [dbo].[TrainingPlan]  WITH CHECK ADD  CONSTRAINT [FK_TrainingPlan_Measurement] FOREIGN KEY([Id_Measurement])
REFERENCES [dbo].[Measurement] ([Id_Measurement])
GO
ALTER TABLE [dbo].[TrainingPlan] CHECK CONSTRAINT [FK_TrainingPlan_Measurement]
GO
ALTER TABLE [dbo].[TrainingRecord]  WITH CHECK ADD  CONSTRAINT [FK_TrainingRecord_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([Id_Activity])
GO
ALTER TABLE [dbo].[TrainingRecord] CHECK CONSTRAINT [FK_TrainingRecord_Activity]
GO
ALTER TABLE [dbo].[TrainingRecord]  WITH CHECK ADD  CONSTRAINT [FK_TrainingRecord_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[TrainingRecord] CHECK CONSTRAINT [FK_TrainingRecord_User]
GO
ALTER TABLE [dbo].[USER_GROUPS]  WITH CHECK ADD  CONSTRAINT [FK_USER_GROUPS_GroupClasses] FOREIGN KEY([FK_ID_GROUPS])
REFERENCES [dbo].[GroupClasses] ([id])
GO
ALTER TABLE [dbo].[USER_GROUPS] CHECK CONSTRAINT [FK_USER_GROUPS_GroupClasses]
GO
ALTER TABLE [dbo].[USER_GROUPS]  WITH CHECK ADD  CONSTRAINT [FK_USER_GROUPS_Users] FOREIGN KEY([FK_ID_USER])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[USER_GROUPS] CHECK CONSTRAINT [FK_USER_GROUPS_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([UserType])
REFERENCES [dbo].[Role] ([Id_Role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ACTIVITY_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CREATE_ACTIVITY_PR]
	@p_Sets INT = NULL,
    @p_Reps INT = NULL,
	@p_Time DECIMAL(3,1) = NULL,
    @p_RestTime INT = NULL,
	@p_Weight DECIMAL(3,1) = NULL,
    @p_Id_Exercise INT,
	@p_Id_Routine INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
    	IF NOT EXISTS (SELECT 1 FROM Routine WHERE Id_Routine = @P_Id_Routine)
        BEGIN
            THROW 50000, 'La rutina con el ID proporcionado no existe.', 1;
        END
        
        INSERT INTO Activity (Sets, Reps, Time, RestTime, Weight, Id_Exercise, Id_Routine, CreationDate)
        VALUES (@p_Sets, @p_Reps, @p_Time,@p_RestTime , @p_Weight,@p_Id_Exercise, @P_Id_Routine, GETDATE());
       
     COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_APPOINTMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_APPOINTMENT_PR]
    @p_Status VARCHAR(20),
    @p_Date DATE,
    @p_Hour TIME,
    @p_Id_Trainer INT,
    @p_Id_Client INT
AS
BEGIN
    INSERT INTO Appointment (Status, Date, Hour, CreationDate, Id_Trainer, Id_Client)
    VALUES (@p_Status, @p_Date, @p_Hour, GETDATE(), @p_Id_Trainer, @p_Id_Client);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_CLIENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_CLIENT_PR]
    @p_Status VARCHAR(20),
    @p_PaymentDate DATE,
	@p_Id_User INT
AS
BEGIN
    INSERT INTO Client (Status, PaymentDate,CreationDate,Id_User)
    VALUES (@p_Status, @p_PaymentDate,GETDATE(),@p_Id_User);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_COUPON_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_COUPON_PR]
(
    @P_Value int,
    @P_CreationDate DATETIME,
	@P_Code varchar(15),
	@P_ExpirationDate DATETIME,
	@P_Uses int
)
AS
BEGIN
    
    INSERT INTO Coupon (Value, CreationDate,Code, ExpirationDate, Uses)
    VALUES (@P_Value, @P_CreationDate, @P_Code, @P_ExpirationDate, @P_Uses );
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE_PR]
    @p_HiringDate DATE,
    @p_Id_User INT
AS
BEGIN
    INSERT INTO Employee (HiringDate,CreationDate ,Id_User)
    VALUES (@p_HiringDate,GETDATE(), @p_Id_User);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EQUIPMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_EQUIPMENT_PR]
	
	@P_Name NVARCHAR(50),
	@P_Location NVARCHAR(50),
	@P_Img NVARCHAR(50),
	@P_CreationDate DATETIME
	
AS
	INSERT INTO Equipment (Name,Location, Img, CreationDate)
	VALUES(@P_Name,@P_Location,@P_Img,@P_CreationDate)
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EXERCISE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_EXERCISE_PR]
    @P_Name NVARCHAR(100),
    @P_Type NVARCHAR(50),
    @P_Description NVARCHAR(255),
    @P_CreationDate DATETIME,
    @P_FK_Id_Equipment INT
AS
BEGIN
    INSERT INTO Exercises (Name, Type, Description, CreationDate, FK_Id_Equipment)
    VALUES (@P_Name, @P_Type, @P_Description, @P_CreationDate, @P_FK_Id_Equipment);
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_INACTIVE_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_INACTIVE_DISCOUNT_PR]
(
    @P_Value int,
    @P_CreationDate DATETIME,
	@P_Months int
)
AS
BEGIN
    
    INSERT INTO InactiveDiscount (Value, CreationDate, Months)
    VALUES (@P_Value, @P_CreationDate, @P_Months);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_INVOICE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_INVOICE_PR]
    @PaymentId INT,
    @CreationDate DATETIME,
    @PdfDocument VARBINARY(MAX),
    @XmlDocument VARBINARY(MAX)
AS
BEGIN
    INSERT INTO Invoice (PaymentId, CreationDate, PdfDocument, XmlDocument)
    VALUES (@PaymentId, @CreationDate, @PdfDocument, @XmlDocument);
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_MEASUREMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_MEASUREMENT_PR]
(
    @P_Height int,
    @P_Weight float,
    @P_Fat_Percentage float,
	@P_Muscle_Percentage float,
    @P_Id_Appointment int,
	@P_CreationDate Datetime
)
AS
BEGIN
    INSERT INTO Measurement (Height, Weight, FatPercentage, MusclePercentage, Id_Appointment, CreationDate)
    VALUES (@P_Height, @P_Weight, @P_Fat_Percentage, @P_Muscle_Percentage, @P_Id_Appointment, @P_CreationDate);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_NEW_CLIENT_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_NEW_CLIENT_DISCOUNT_PR]
(
    @P_Value int,
    @P_CreationDate DATETIME
)
AS
BEGIN
    
    INSERT INTO NewClientDiscount (Value, CreationDate)
    VALUES (@P_Value, @P_CreationDate);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_PAYMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_PAYMENT_PR]
    @P_Status VARCHAR(20),
    @P_Date DATE,
    @P_MembershipId INT,
    @P_Method VARCHAR(20),
    @P_Amount FLOAT,
    @P_Enrollment_fee FLOAT,
    @P_Document VARBINARY(MAX) = NULL, 
    @p_Id_user INT

AS
BEGIN
   
    IF @P_Method = 'Paypal'
    BEGIN
        SET @P_Document = CONVERT(VARBINARY(MAX), '');
    END
    ELSE
    BEGIN
        
        IF @P_Document IS NULL
        BEGIN
            RAISERROR ('Document is required for payment methods other than PayPal.', 16, 1);
            RETURN; 
        END
    END
    INSERT INTO Payment (Status, Date, MembershipId, Method, Amount, Enrollment_fee, Document, Id_User)
    VALUES (@P_Status, @P_Date, @P_MembershipId, @P_Method, @P_Amount, @P_Enrollment_fee, @P_Document, @p_Id_user);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_PERSONAL_TRAINER_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_PERSONAL_TRAINER_PR]
    @p_Status VARCHAR(20),
    @p_Date DATE,
    @p_Hour TIME,
    @p_Id_Trainer INT,
    @p_Id_Client INT
AS
BEGIN
    INSERT INTO PERSONALTRAINER (Status, Date, Hour, CreationDate, Id_Trainer, Id_Client)
    VALUES (@p_Status, @p_Date, @p_Hour, GETDATE(), @p_Id_Trainer, @p_Id_Client);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ROLE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento para crear un nuevo rol
CREATE PROCEDURE [dbo].[CREATE_ROLE_PR]
    @P_Name VARCHAR(50),
    @P_Description VARCHAR(250),
    @P_Permission VARCHAR(50),
    @P_CreationDate DATETIME
AS
BEGIN
    INSERT INTO Role (Name, Description, Permission, CreationDate)
    VALUES (@P_Name, @P_Description, @P_Permission, @P_CreationDate)
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ROUTINE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CREATE_ROUTINE_PR]
	@P_Code VARCHAR(10),
    @P_Name VARCHAR(40),
    @P_Comments VARCHAR(100) = ' ',
    @P_Id_TrainingPlan INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
    	IF NOT EXISTS (SELECT 1 FROM TrainingPlan WHERE Id_TrainingPlan = @P_Id_TrainingPlan)
        BEGIN
            THROW 50000, 'El plan de entrenamiento con el ID proporcionado no existe.', 1;
        END
        
        INSERT INTO Routine(Code, Name, Comments, CreationDate, Id_TrainingPlan)
        VALUES (@P_Code, @P_Name, @P_Comments, GETDATE(), @P_Id_TrainingPlan);
       
        UPDATE TrainingPlan 
        SET DaysNumber = (DaysNumber + 1)
        WHERE Id_TrainingPlan = @P_Id_TrainingPlan;
       
     COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_TOKEN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_TOKEN_PR]
		@p_Value VARCHAR(6),
		@p_Id_User INT
AS
BEGIN
    INSERT INTO Token (Value, CreationDate, Id_User)
    VALUES (@p_Value,GETDATE(),@p_Id_User);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_TRAINING_PLAN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[CREATE_TRAINING_PLAN_PR]
    @P_Name VARCHAR(40),
    @P_Goal VARCHAR(50),
    @P_Id_Measurement INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO TrainingPlan(Name, Goal, DaysNumber, CreationDate, ExpireDate, Id_Measurement)
        VALUES (@P_Name, @P_Goal, 0, GETDATE(), DATEADD(MONTH, 2, GETDATE()), @P_Id_Measurement);
     COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_TRAINING_RECORD_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_TRAINING_RECORD_PR]
    @P_ActivityId INT,
    @P_UserId INT,
    @P_CreationDate DATE,
    @P_Sets INT,
    @P_Weight DECIMAL(3, 1),
    @P_Time INT,
    @P_EX_Name VARCHAR(255), 
    @P_RestTime INT         
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO TrainingRecord(ActivityId, Id_User, CreationDate, Sets, weight, time, EX_Name, RestTime)
    VALUES (@P_ActivityId, @P_UserId, @P_CreationDate, @P_Sets, @P_Weight, @P_Time, @P_EX_Name, @P_RestTime);
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_TUITION_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_TUITION_DISCOUNT_PR]
(
    @P_Value int,
    @P_CreationDate DATETIME
)
AS
BEGIN
    
    INSERT INTO TuitionDiscount (Value, CreationDate)
    VALUES (@P_Value, @P_CreationDate);
END;
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USERGROUP_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_USERGROUP_PR]
    @FK_ID_GROUPS INT,
    @FK_ID_USER INT
AS
BEGIN
    INSERT INTO USER_GROUPS (FK_ID_GROUPS, FK_ID_USER)
    VALUES (@FK_ID_GROUPS, @FK_ID_USER);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateGroupClass]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateGroupClass]
  @P_ClassName NVARCHAR(255),
  @P_ClassDescription TEXT,
  @P_MaxCapacity INT,
  @P_ClassTime NVARCHAR(255),
  @P_ClassDuration INT,
  @P_Days NVARCHAR(255),
  @P_CreationDate DATETIME
AS
BEGIN
  INSERT INTO GroupClasses (className, classDescription, maxCapacity, classTime, classDuration, days, creationDate)
  VALUES (@P_ClassName, @P_ClassDescription, @P_MaxCapacity, @P_ClassTime, @P_ClassDuration, @P_Days, @P_CreationDate);
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateMembership]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateMembership]
    @P_Name NVARCHAR(255),
    @P_Description NVARCHAR(MAX),
    @P_Price INT,
    @P_GroupsLimit INT,
    @P_CreationDate DATE
AS
BEGIN
    INSERT INTO Membership (Name, Description, Price, GroupsLimit, CreationDate)
    VALUES (@P_Name, @P_Description, @P_Price, @P_GroupsLimit, @P_CreationDate);
END
GO
/****** Object:  StoredProcedure [dbo].[CreatePassword]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePassword]
  @P_PasswordEncrypted NVARCHAR(255),
  @P_FKIdUser INT,
  @P_Active NVARCHAR(10),
  @P_CreationDate DATETIME
AS
BEGIN
  INSERT INTO Password (PasswordEncrypted, FKIdUser, Active, CreationDate)
  VALUES (@P_PasswordEncrypted, @P_FKIdUser, @P_Active, @P_CreationDate);
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]
  @P_Name NVARCHAR(255),
  @P_LastName1 NVARCHAR(255),
  @P_LastName2 NVARCHAR(255),
  @P_Email NVARCHAR(255),
  @P_Gender NVARCHAR(255),
  @P_PhoneNumber NVARCHAR(255),
  @P_BirthDate DATETIME,
  @P_CreationDate DATETIME,
  @P_UserType NVARCHAR(50),
  @P_Password NVARCHAR(255) -- Nuevo parámetro para la contraseña
AS
BEGIN
  INSERT INTO Users (Name, LastName1, LastName2, Email, Gender, PhoneNumber, BirthDate, CreationDate, UserType, Password)
  VALUES (@P_Name, @P_LastName1, @P_LastName2, @P_Email, @P_Gender, @P_PhoneNumber, @P_BirthDate, @P_CreationDate, @P_UserType, @P_Password);
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_ACTIVITY_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DELETE_ACTIVITY_PR]
	@P_Id_Activity INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Activity WHERE Id_Activity = @P_Id_Activity)
        BEGIN
            THROW 50000, 'La actividad con el ID proporcionado no existe.', 1;
        END

        DELETE FROM Activity WHERE Id_Activity = @P_Id_Activity;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informaci�n del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_APPOINTMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_APPOINTMENT_PR]
    @Id_Appointment INT
AS
BEGIN
    DELETE FROM Appointment
    WHERE Id_Appointment = @Id_Appointment;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_CLIENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_CLIENT_PR]
    @p_Id_Client INT
AS
BEGIN
    DELETE FROM Client
    WHERE Id_Client = @p_Id_Client;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_COUPON_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_COUPON_PR]
    @P_Id_Coupon INT
AS
BEGIN
    DELETE FROM Coupon
    WHERE Id_Coupon = @P_Id_Coupon
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_EQUIPMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_EQUIPMENT_PR]
    @P_Id_Equipment INT
AS
    DELETE FROM Equipment
    WHERE Id_Equipment = @P_Id_Equipment;
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[DELETE_EXERCISE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_EXERCISE_PR]
    @P_Id_Exercise INT
AS
BEGIN
    DELETE FROM Exercises
    WHERE Id_Exercise = @P_Id_Exercise;
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_GROUP_CLASS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_GROUP_CLASS_PR]
  @P_Id INT
AS
BEGIN
  DELETE FROM GroupClasses
  WHERE id = @P_Id;
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_MEASUREMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_MEASUREMENT_PR]
(
    @P_Id_Measurement INT
)
AS
BEGIN
    DELETE FROM Measurement
    WHERE Id_Measurement = @P_Id_Measurement;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_MEMBERSHIP_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_MEMBERSHIP_PR]
    @P_Id INT
AS
BEGIN
    DELETE FROM Membership WHERE Id = @P_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_PASSWORD_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_PASSWORD_PR]
  @P_Id INT
AS
BEGIN
  DELETE FROM Password
  WHERE Id_Password = @P_Id;
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_PAYMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_PAYMENT_PR]
    @P_id_Payment INT
AS
BEGIN
    DELETE FROM Payment WHERE id_Payment = @P_id_Payment;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_PERSONAL_TRAINER_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_PERSONAL_TRAINER_PR]
    @Id_PersonalTrainer INT
AS
BEGIN
    DELETE FROM PersonalTrainer
    WHERE Id_PersonalTrainer = @Id_PersonalTrainer;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_ROLE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para eliminar un rol
CREATE PROCEDURE [dbo].[DELETE_ROLE_PR]
    @P_Id_Role INT
AS
BEGIN
    DELETE FROM Role
    WHERE Id_Role = @P_Id_Role
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_ROUTINE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DELETE_ROUTINE_PR]
	@P_Id_Routine INT
AS
BEGIN
	DECLARE @Id_TrainingPlan INT = 0;
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Routine WHERE Id_Routine = @P_Id_Routine)
        BEGIN
            THROW 50000, 'La rutina con el ID proporcionado no existe.', 1;
        END
        
        IF EXISTS (SELECT 1 FROM Activity WHERE Id_Routine = @P_Id_Routine)
        BEGIN
            THROW 50000, 'La rutina posee actividades, no se puede eliminar.', 1;
        END

        SET @Id_TrainingPlan = (SELECT Id_TrainingPlan FROM Routine WHERE Id_Routine = @P_Id_Routine);
       
        UPDATE TrainingPlan 
        SET DaysNumber = (DaysNumber - 1)
        WHERE Id_TrainingPlan = @Id_TrainingPlan;
       
        DELETE FROM Routine WHERE Id_Routine = @P_Id_Routine;
       
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informaci�n del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_TOKEN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_TOKEN_PR]
    @p_Token_Value VARCHAR(6)
AS
BEGIN
    DELETE FROM Token
    WHERE Value = @p_Token_Value;
END;
GO
/****** Object:  StoredProcedure [dbo].[DELETE_TRAINING_PLAN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DELETE_TRAINING_PLAN_PR]
	@P_Id_TrainingPlan INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM TrainingPlan WHERE Id_TrainingPlan = @P_Id_TrainingPlan)
        BEGIN
            THROW 50000, 'El plan de entrenamiento con el ID proporcionado no existe.', 1;
        END
        
        IF EXISTS (SELECT 1 FROM Routine WHERE Id_TrainingPlan = @P_Id_TrainingPlan)
        BEGIN
            THROW 50000, 'El plan de entrenamiento posee rutinas asociadas, no puede eliminarse.', 1;
        END

        DELETE FROM TrainingPlan WHERE Id_TrainingPlan = @P_Id_TrainingPlan;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informaci�n del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[DELETE_TRAINING_RECORD_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_TRAINING_RECORD_PR]
    @P_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM TrainingRecord WHERE TrainingRecordId = @P_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[DELETE_USER_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_USER_PR]
    @P_Id INT
AS
    DELETE FROM Users
    WHERE Id_User = @P_Id;
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[DELETE_USERGROUP_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DELETE_USERGROUP_PR]
    @ID INT
AS
BEGIN
    DELETE FROM USER_GROUPS
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteGroupClass]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteGroupClass]
  @P_Id INT
AS
BEGIN
  DELETE FROM GroupClasses
  WHERE id = @P_Id;
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetLastPaymentByUserId]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastPaymentByUserId]
    @Id_User INT
AS
BEGIN
    SELECT TOP 1
        p.id_Payment,
        p.Status,
        p.Date,
        p.Method,
        p.Amount,
        p.Enrollment_fee,
        p.Document,
        Client.Id_User AS ClientId,
        Client.Name AS ClientName,
        Client.LastName1 AS ClientLastName1,
        Client.LastName2 AS ClientLastName2,
		Client.Email AS ClientEmail,
		Client.PhoneNumber AS ClientPhoneNumber,
        m.Id AS MembershipId,
        m.Name AS Name,
        m.Description AS Description,
        m.Price AS Price
    FROM 
        Payment p
    INNER JOIN 
        Users Client ON p.Id_User = Client.Id_User
    LEFT JOIN 
        Membership m ON p.MembershipId = m.Id
    WHERE 
        p.Id_User = @Id_User
    ORDER BY 
        p.Date DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetMeasurementsByUserId]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMeasurementsByUserId]
    @UserId INT
AS
BEGIN
    -- Obtener los Appointments correspondientes al UserId dado
    SELECT A.Id_Appointment AS AppointmentId
    INTO #TempAppointments
    FROM Appointment A
    WHERE A.Id_Client = @UserId;

    -- Obtener los Measurements correspondientes a los AppointmentIds obtenidos
    SELECT M.*
    FROM Measurement M
    INNER JOIN #TempAppointments TA
    ON M.Id_Appointment = TA.AppointmentId;

    -- Limpiar la tabla temporal
    DROP TABLE #TempAppointments;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentsByUserId]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentsByUserId]
    @Id_User INT
AS
BEGIN
    SELECT 
        p.id_Payment,
        p.Status,
        p.Date,
        p.Method,
        p.Amount,
        p.Enrollment_fee,
        p.Document,
        Client.Id_User AS ClientId,
        Client.Name AS ClientName,
        Client.LastName1 AS ClientLastName1,
        Client.LastName2 AS ClientLastName2,
        m.Id AS MembershipId,
        m.Name AS Name,
        m.Description AS Description,
        m.Price AS Price
    FROM 
        Payment p
    INNER JOIN 
        Users Client ON p.Id_User = Client.Id_User
    LEFT JOIN 
        Membership m ON p.MembershipId = m.Id
    WHERE 
        p.Id_User = @Id_User;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ACTIVITY_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ACTIVITY_BY_ID_PR]
    @P_Id_Activity INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
			a.Id_Activity,
            a.Sets,
            a.Reps,
			a.Time,
            a.RestTime,
            a.Weight,
            a.Id_Exercise,
            a.Id_Routine,
            a.CreationDate
        FROM 
            Activity AS a
        WHERE 
            a.Id_Activity = @P_Id_Activity;
    END TRY
    BEGIN CATCH
         -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ACTIVITIES_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_ACTIVITIES_PR]
AS
BEGIN
    SELECT Id_Activity,Sets,Reps,Time,RestTime, Weight,Id_Exercise,Id_Routine,CreationDate FROM Activity;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ACTIVITY_BY_ROUTINE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ALL_ACTIVITY_BY_ROUTINE_PR]
    @P_Id_Routine INT
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRANSACTION;

    BEGIN TRY
        SELECT 
			a.Id_Activity,
            a.Sets,
            a.Reps,
			a.Time,
            a.RestTime,
            a.Weight,
            a.Id_Exercise,
            a.Id_Routine,
            a.CreationDate
        FROM 
            Activity AS a
        WHERE a.Id_Routine = @P_Id_Routine;

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ACTIVITY_BY_TRAINING_PLAN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ALL_ACTIVITY_BY_TRAINING_PLAN_PR]
    @P_Id_Routine INT
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRANSACTION;

    BEGIN TRY
        SELECT 
			a.Id_Activity,
            a.Sets,
            a.Reps,
			a.Time,
            a.RestTime,
            a.Weight,
            a.Id_Exercise,
            a.Id_Routine
        FROM 
            Activity AS a
        WHERE Id_Routine = @P_Id_Routine;

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ACTIVITY_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ALL_ACTIVITY_PR]
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRANSACTION;

    BEGIN TRY
        SELECT 
			a.Id_Activity,
            a.Sets,
            a.Reps,
			a.Time,
            a.RestTime,
            a.Weight,
            a.Id_Exercise,
            a.Id_Routine,
            a.CreationDate
        FROM 
            Activity AS a;

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_APPOINTMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_APPOINTMENT_PR]
AS
BEGIN
  SELECT 
    Trainer.Id_User AS TrainerId,
    Trainer.Name AS TrainerName,
    Trainer.LastName1 AS TrainerLastName1,
    Trainer.LastName2 AS TrainerLastName2,
    Trainer.Email AS TrainerEmail,
    Trainer.Gender AS TrainerGender,
    Trainer.PhoneNumber AS TrainerPhoneNumber,
    Trainer.BirthDate AS TrainerBirthDate,
    Trainer.CreationDate AS TrainerCreationDate,
    Trainer.UserType AS TrainerUserType,
    Trainer.Password AS TrainerPassword,
    Client.Id_User AS ClientId,
    Client.Name AS ClientName,
    Client.LastName1 AS ClientLastName1,
    Client.LastName2 AS ClientLastName2,
    Client.Email AS ClientEmail,
    Client.Gender AS ClientGender,
    Client.PhoneNumber AS ClientPhoneNumber,
    Client.BirthDate AS ClientBirthDate,
    Client.CreationDate AS ClientCreationDate,
    Client.UserType AS ClientUserType,
    Client.Password AS ClientPassword,
    A.Id_Appointment,
    A.Status,
    A.Date,
    A.Hour,
    A.CreationDate AS AppointmentCreationDate,
    A.Id_Trainer,
    A.Id_Client
FROM 
    [Project_Test].[dbo].[Appointment] A
INNER JOIN 
    [Project_Test].[dbo].[Users] Trainer
ON 
    A.Id_Trainer = Trainer.Id_User
INNER JOIN 
    [Project_Test].[dbo].[Users] Client
ON 
    A.Id_Client = Client.Id_User;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_CLIENTS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_CLIENTS_PR]
AS
BEGIN
    SELECT Id_Client, Status, PaymentDate,CreationDate,Id_User
	FROM Client;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_COUPON_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_COUPON_PR]
AS
BEGIN
    
    -- Selecciona todos los registros de la tabla de cupones
    SELECT 
        Id_Coupon AS Id,          
        Value AS Value,    
        CreationDate AS CreationDate,
		ExpirationDate AS ExpirationDate,
		Code AS Code,
		Uses AS Uses
    FROM 
        Coupon           -- Nombre de la tabla que contiene cupones
   
        
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_EMPLOYEE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_EMPLOYEE_PR]
AS
BEGIN
    SELECT Id_Employee, HiringDate, CreationDate ,Id_User FROM Employee;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_EQUIPMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_EQUIPMENT_PR]

AS
	SELECT  Id_Equipment,Name,Location, Img, CreationDate FROM Equipment
	
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_EXERCISE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_EXERCISE_PR]
AS
    SELECT Id_Exercise, Name, Type, Description, CreationDate, FK_Id_Equipment
    FROM Exercises;
RETURN 0;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_GROUP_CLASSES_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_GROUP_CLASSES_PR]
AS
BEGIN
  SELECT id, className, classDescription, maxCapacity, classTime, classDuration, days, creationDate
  FROM GroupClasses;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_INACTIVE_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_INACTIVE_DISCOUNT_PR]
AS
BEGIN
    
    SELECT 
        Id_Discount AS Id,          
        Value AS Value,    -- Valor del descuento
        CreationDate AS CreationDate, -- Fecha de creación del descuento
		Months As Months
    FROM 
        InactiveDiscount           -- Nombre de la tabla que contiene los descuentos
   
        
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_MEASUREMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_MEASUREMENT_PR]
AS
BEGIN
    
   
    SELECT 
        Id_Measurement AS Id,          
        Height AS Height,    
        Weight AS Weight,
        FatPercentage AS FatPercentage,
		MusclePercentage AS MusclePercentage,
        Id_Appointment AS IdAppointment,
		CreationDate AS CreationDate
    FROM 
        Measurement;           
        
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_MEMBERSHIPS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_MEMBERSHIPS_PR]
AS
BEGIN
    SELECT Id, Name, Description, Price, GroupsLimit, CreationDate
    FROM Membership;
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_NEW_CLIENT_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_NEW_CLIENT_DISCOUNT_PR]
AS
BEGIN
    
    -- Selecciona todos los registros de la tabla de descuentos para nuevos clientes
    SELECT 
        Id_Discount AS Id,          
        Value AS Value,    -- Valor del descuento
        CreationDate AS CreationDate -- Fecha de creación del descuento
    FROM 
        NewClientDiscount           -- Nombre de la tabla que contiene los descuentos
   
        
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_PASSWORDS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_PASSWORDS_PR]
AS
BEGIN
  SELECT Id_Password, PasswordEncrypted, FKIdUser
  FROM Password;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_PAYMENTS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_PAYMENTS_PR]
AS
BEGIN
    SELECT 
        p.id_Payment,
        p.Status,
        p.Date,
        p.Method,
        p.Amount,
        p.Enrollment_fee,
        p.Document,
        Client.Id_User AS ClientId,
        Client.Name AS ClientName,
        Client.LastName1 AS ClientLastName1,
        Client.LastName2 AS ClientLastName2,
        Client.Email AS ClientEmail,
        Client.Gender AS ClientGender,
        Client.PhoneNumber AS ClientPhoneNumber,
        Client.BirthDate AS ClientBirthDate,
        Client.CreationDate AS ClientCreationDate,
        Client.UserType AS ClientUserType,
        Client.Password AS ClientPassword,
        m.Id AS MembershipId,
        m.Name AS Name,
        m.Description AS Description,
        m.Price AS Price
    FROM 
        Payment p
    INNER JOIN 
        Users Client ON p.Id_User = Client.Id_User
    LEFT JOIN 
        Membership m ON p.MembershipId = m.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_PERSONAL_TRAINER_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_PERSONAL_TRAINER_PR]
AS
BEGIN
  SELECT 
    Trainer.Id_User AS TrainerId,
    Trainer.Name AS TrainerName,
    Trainer.LastName1 AS TrainerLastName1,
    Trainer.LastName2 AS TrainerLastName2,
    Trainer.Email AS TrainerEmail,
    Trainer.Gender AS TrainerGender,
    Trainer.PhoneNumber AS TrainerPhoneNumber,
    Trainer.BirthDate AS TrainerBirthDate,
    Trainer.CreationDate AS TrainerCreationDate,
    Trainer.UserType AS TrainerUserType,
    Trainer.Password AS TrainerPassword,
    Client.Id_User AS ClientId,
    Client.Name AS ClientName,
    Client.LastName1 AS ClientLastName1,
    Client.LastName2 AS ClientLastName2,
    Client.Email AS ClientEmail,
    Client.Gender AS ClientGender,
    Client.PhoneNumber AS ClientPhoneNumber,
    Client.BirthDate AS ClientBirthDate,
    Client.CreationDate AS ClientCreationDate,
    Client.UserType AS ClientUserType,
    Client.Password AS ClientPassword,
    A.Id_PersonalTrainer,
    A.Status,
    A.Date,
    A.Hour,
    A.CreationDate AS PersonalTrainerCreationDate,
    A.Id_Trainer,
    A.Id_Client
FROM 
    [Project_Test].[dbo].[PersonalTrainer] A
INNER JOIN 
    [Project_Test].[dbo].[Users] Trainer
ON 
    A.Id_Trainer = Trainer.Id_User
INNER JOIN 
    [Project_Test].[dbo].[Users] Client
ON 
    A.Id_Client = Client.Id_User;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ROLE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para recuperar todos los roles
CREATE PROCEDURE [dbo].[RET_ALL_ROLE_PR]
AS
BEGIN
    SELECT Id_Role, Name, Description, Permission, CreationDate
    FROM Role
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ROUTINE_BY_TRAINING_PLAN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ALL_ROUTINE_BY_TRAINING_PLAN_PR]
    @P_Id_TrainingPlan INT
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRANSACTION;

    BEGIN TRY
        SELECT 
			r.Id_Routine,
            r.Code,
            r.Name,
			r.Comments,
            r.CreationDate,
            r.Id_TrainingPlan
        FROM 
            Routine AS r
        WHERE Id_TrainingPlan = @P_Id_TrainingPlan;

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_ROUTINE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ALL_ROUTINE_PR]
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRANSACTION;

    BEGIN TRY
        SELECT 
			r.Id_Routine,
            r.Code,
            r.Name,
			r.Comments,
            r.CreationDate,
            r.Id_TrainingPlan
        FROM 
            Routine AS r;

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_TRAINING_PLAN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ALL_TRAINING_PLAN_PR]
AS
BEGIN
    SET NOCOUNT ON;

	BEGIN TRANSACTION;

    BEGIN TRY
        SELECT 
			tp.Id_TrainingPlan,
            tp.Name,
            tp.Goal,
			tp.DaysNumber,
            tp.CreationDate,
            tp.ExpireDate,
            tp.Id_Measurement
        FROM 
            TrainingPlan AS tp;

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_TRAINING_RECORDS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_TRAINING_RECORDS_PR]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT TrainingRecordId,ActivityId, Id_User, CreationDate, Sets, weight, time, EX_Name as ExerciseName, RestTime FROM TrainingRecord;
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_TUITION_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_TUITION_DISCOUNT_PR]
AS
BEGIN
    
    -- Selecciona todos los registros de la tabla de descuentos para matrícula
    SELECT 
        Id_Discount AS Id,          
        Value AS Value,    -- Valor del descuento
        CreationDate AS CreationDate -- Fecha de creación del descuento
    FROM 
        TuitionDiscount           -- Nombre de la tabla que contiene los descuentos
   
        
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_USERGROUP_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_USERGROUP_PR]
AS
BEGIN
    SELECT * FROM USER_GROUPS;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_USERS_BY_USERTYPE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_USERS_BY_USERTYPE_PR]
@p_userType INT
AS
BEGIN
  SELECT Id_User, Name, LastName1, LastName2, Email, Gender, PhoneNumber, BirthDate, CreationDate,UserType, Password
    FROM Users
	WHERE UserType = @p_userType;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_ALL_USERS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_ALL_USERS_PR]
AS
BEGIN
    SELECT Id_User, Name, LastName1, LastName2, Email, Gender, PhoneNumber, BirthDate, CreationDate,UserType, Password
    FROM Users;
END
GO
/****** Object:  StoredProcedure [dbo].[RET_APPOINTMENT_BY_CLIENT_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_APPOINTMENT_BY_CLIENT_ID_PR]
@P_CLIENT_ID INT
AS
	SELECT Id_Appointment,Status,Date,Hour, CreationDate,Id_Employee,Id_Client
	FROM Appointment
	WHERE Id_Client=@P_CLIENT_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_APPOINTMENT_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_APPOINTMENT_BY_ID_PR]
@P_ID INT
AS
SELECT 
    Trainer.Id_User AS TrainerId,
    Trainer.Name AS TrainerName,
    Trainer.LastName1 AS TrainerLastName1,
    Trainer.LastName2 AS TrainerLastName2,
    Trainer.Email AS TrainerEmail,
    Trainer.Gender AS TrainerGender,
    Trainer.PhoneNumber AS TrainerPhoneNumber,
    Trainer.BirthDate AS TrainerBirthDate,
    Trainer.CreationDate AS TrainerCreationDate,
    Trainer.UserType AS TrainerUserType,
    Trainer.Password AS TrainerPassword,
    Client.Id_User AS ClientId,
    Client.Name AS ClientName,
    Client.LastName1 AS ClientLastName1,
    Client.LastName2 AS ClientLastName2,
    Client.Email AS ClientEmail,
    Client.Gender AS ClientGender,
    Client.PhoneNumber AS ClientPhoneNumber,
    Client.BirthDate AS ClientBirthDate,
    Client.CreationDate AS ClientCreationDate,
    Client.UserType AS ClientUserType,
    Client.Password AS ClientPassword,
    A.Id_Appointment,
    A.Status,
    A.Date,
    A.Hour,
    A.CreationDate AS AppointmentCreationDate,
    A.Id_Trainer,
    A.Id_Client
FROM 
    [Project_Test].[dbo].[Appointment] A
INNER JOIN 
    [Project_Test].[dbo].[Users] Trainer
ON 
    A.Id_Trainer = Trainer.Id_User
INNER JOIN 
    [Project_Test].[dbo].[Users] Client
ON 
    A.Id_Client = Client.Id_User
	WHERE Id_Appointment=@P_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_APPOINTMENT_BY_USER_ID_2]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_APPOINTMENT_BY_USER_ID_2]
@P_USER_ID INT
AS
SELECT 
    Trainer.Id_User AS TrainerId,
    Trainer.Name AS TrainerName,
    Trainer.LastName1 AS TrainerLastName1,
    Trainer.LastName2 AS TrainerLastName2,
    Trainer.Email AS TrainerEmail,
    Trainer.Gender AS TrainerGender,
    Trainer.PhoneNumber AS TrainerPhoneNumber,
    Trainer.BirthDate AS TrainerBirthDate,
    Trainer.CreationDate AS TrainerCreationDate,
    Trainer.UserType AS TrainerUserType,
    Trainer.Password AS TrainerPassword,
    Client.Id_User AS ClientId,
    Client.Name AS ClientName,
    Client.LastName1 AS ClientLastName1,
    Client.LastName2 AS ClientLastName2,
    Client.Email AS ClientEmail,
    Client.Gender AS ClientGender,
    Client.PhoneNumber AS ClientPhoneNumber,
    Client.BirthDate AS ClientBirthDate,
    Client.CreationDate AS ClientCreationDate,
    Client.UserType AS ClientUserType,
    Client.Password AS ClientPassword,
    A.Id_Appointment,
    A.Status,
    A.Date,
    A.Hour,
    A.CreationDate AS AppointmentCreationDate,
    A.Id_Trainer,
    A.Id_Client
FROM 
    [Project_Test].[dbo].[Appointment] A
INNER JOIN 
    [Project_Test].[dbo].[Users] Trainer
ON 
    A.Id_Trainer = Trainer.Id_User
INNER JOIN 
    [Project_Test].[dbo].[Users] Client
ON 
    A.Id_Client = Client.Id_User
	WHERE Id_Client =@P_USER_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_APPOINTMENT_BY_USER_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_APPOINTMENT_BY_USER_ID_PR]
@P_USER_ID INT
AS
	SELECT Id_Appointment,Status,Date,Hour, CreationDate, Id_Trainer, Id_Client
	FROM Appointment
	WHERE Id_Client=@P_USER_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_CHECK_COUPON_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_CHECK_COUPON_PR]
    @P_Code VARCHAR(10),
    @P_Date DATE
AS
BEGIN
    
    IF EXISTS (SELECT 1 FROM Coupon WHERE Code = @P_Code)
    BEGIN
        
        IF EXISTS (SELECT 1 FROM Coupon WHERE Code = @P_Code AND ExpirationDate >= @P_Date)
        BEGIN
            
            SELECT Id_Coupon AS Id,Code,Value,CreationDate,ExpirationDate,Uses 
            FROM Coupon 
            WHERE Code = @P_Code;
			
        END
        ELSE
        BEGIN
            
            SELECT 'Expired' AS CouponStatus;
        END
    END
    ELSE
    BEGIN
        
        SELECT 'Not Found' AS CouponStatus;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_CLIENT_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_CLIENT_BY_ID_PR]
@p_Id_Client INT
AS
	SELECT Id_Client,Status,PaymentDate,CreationDate, Id_User
	FROM Client
	WHERE Id_Client=@p_Id_Client
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_COUPON_BY_ID]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_COUPON_BY_ID]
    @Id INT 
AS
BEGIN
    
    SELECT 
        Id_Coupon AS Id,          
        Value AS Value,    
        CreationDate AS CreationDate,
		ExpirationDate AS ExpirationDate,
		Code AS Code,
		Uses AS Uses
    FROM
	Coupon           
    WHERE
        Id_Coupon = @Id;         

   
END
GO
/****** Object:  StoredProcedure [dbo].[RET_EMPLOYEE_BY_EMPLOYEE_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_EMPLOYEE_BY_EMPLOYEE_ID_PR]
@p_Id_Employee INT
AS
	SELECT Id_Employee,HiringDate,CreationDate,Id_User
	FROM Employee
	WHERE Id_Employee=@p_Id_Employee
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_EMPLOYEE_BY_User_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_EMPLOYEE_BY_User_ID_PR]
@p_Id_User INT
AS
	SELECT Id_Employee,HiringDate,CreationDate,Id_User
	FROM Employee
	WHERE Id_User=@p_Id_User
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_EMPLOYEE_USER_BY_EMPLOYEE_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_EMPLOYEE_USER_BY_EMPLOYEE_ID_PR]
@p_Id_Employee INT
AS
BEGIN
    SELECT 
        e.Id_Employee,
        e.HiringDate,
        e.CreationDate AS EmployeeCreationDate,
        e.Id_User,
        u.Name,
        u.LastName1,
        u.LastName2,
        u.Email,
        u.Gender,
        u.PhoneNumber,
        u.BirthDate,
        u.CreationDate AS UserCreationDate,
        u.UserType,
        u.Password
    FROM 
        Employee e
    JOIN 
        Users u
    ON 
        e.Id_User = u.Id_User
	WHERE 
        e.Id_Employee = @P_Id_Employee;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_EMPLOYEE_USER_BY_USER_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_EMPLOYEE_USER_BY_USER_ID_PR]
@p_Id_User INT
AS
BEGIN
    SELECT 
        e.Id_Employee,
        e.HiringDate,
        e.CreationDate AS EmployeeCreationDate,
        e.Id_User,
        u.Name,
        u.LastName1,
        u.LastName2,
        u.Email,
        u.Gender,
        u.PhoneNumber,
        u.BirthDate,
        u.CreationDate AS UserCreationDate,
        u.UserType,
        u.Password
    FROM 
        Employee e
    JOIN 
        Users u
    ON 
        e.Id_User = u.Id_User
	WHERE 
        e.Id_User = @P_Id_User;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_EQUIPMENT_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_EQUIPMENT_BY_ID_PR]
@P_ID_EQUIPMENT INT
AS
	SELECT  Id_Equipment,Name,Location, Img, CreationDate FROM Equipment
	WHERE Id_Equipment=@P_ID_EQUIPMENT
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_EXERCISE_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_EXERCISE_BY_ID_PR]
    @P_Id_Exercise INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
			e.Id_Exercise,
            e.Name,
			e.Type,
            e.CreationDate,
            e.Description,
           e.FK_Id_Equipment
        FROM 
            Exercises AS e
        WHERE 
            e.Id_Exercise = @P_Id_Exercise;
    END TRY
    BEGIN CATCH
         -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_GROUP_CLASS_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_GROUP_CLASS_BY_ID_PR]
  @P_Id INT
AS
BEGIN
  SELECT id, className, classDescription, maxCapacity, classTime, classDuration, days, creationDate
  FROM GroupClasses
  WHERE id = @P_Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_INACTIVE_DISCOUNT_BY_ID]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_INACTIVE_DISCOUNT_BY_ID]
    @Id INT 
AS
BEGIN
    
    SELECT 
        Id_Discount AS Id,          
        Value AS Value,    
        CreationDate AS CreationDate,
		Months as Months
    FROM 
        InactiveDiscount           
    WHERE
        Id_Discount = @Id;         

   
END
GO
/****** Object:  StoredProcedure [dbo].[RET_MEASUREMENT_BY_APPOINTMENT_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_MEASUREMENT_BY_APPOINTMENT_ID_PR]
(
    @Id_Appointment INT
)
AS
BEGIN
    
    SELECT 
        Id_Measurement AS Id,          
        Height AS Height,    
        Weight AS Weight,
		MusclePercentage AS MusclePercentage,
        FatPercentage AS FatPercentage,
        Id_Appointment AS IdAppointment
    FROM
        Measurement
    WHERE
        Id_Appointment = @Id_Appointment;
        
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_MEASUREMENT_BY_ID]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_MEASUREMENT_BY_ID]
(
    @Id INT
)
AS
BEGIN
    
    SELECT 
        Id_Measurement AS Id,          
        Height AS Height,    
        Weight AS Weight,
		MusclePercentage AS MusclePercentage,
        FatPercentage AS FatPercentage,
        Id_Appointment AS IdAppointment
    FROM
        Measurement
    WHERE
        Id_Measurement = @Id;
        
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_MEMBERSHIP_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_MEMBERSHIP_BY_ID_PR]
    @P_Id INT
AS
BEGIN
    SELECT Id, Name, Description, Price, GroupsLimit, CreationDate
    FROM Membership
    WHERE Id = @P_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[RET_NEW_CLIENT_DISCOUNT_BY_ID]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_NEW_CLIENT_DISCOUNT_BY_ID]
    @Id INT 
AS
BEGIN
    
    SELECT 
        Id_Discount AS Id,          
        Value AS Value,    
        CreationDate AS CreationDate 
    FROM 
        NewClientDiscount           
    WHERE
        Id_Discount = @Id;         

   
END

GO
/****** Object:  StoredProcedure [dbo].[RET_PASSWORD_BY_FKIDUSER]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PASSWORD_BY_FKIDUSER]
  @P_FKIdUser INT
AS
BEGIN
  SELECT Id_Password, PasswordEncrypted, FKIdUser, Active, CreationDate
  FROM Password
  WHERE FKIdUser = @P_FKIdUser;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_PASSWORD_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PASSWORD_BY_ID_PR]
  @P_ID INT
AS
BEGIN
  SELECT Id_Password, PasswordEncrypted, FKIdUser, Active, CreationDate
  FROM Password
  WHERE Id_Password = @P_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_PAYMENT_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PAYMENT_BY_ID_PR]
    @P_id_Payment INT
AS
BEGIN
SELECT 
p.id_Payment,
p.Status,
p.Date,
p.Type,
p.Method,
p.Amount,
p.Enrollment_fee,
p.Document,
u.Email
FROM 
Payment p
INNER JOIN 
Users u ON p.Id_User = u.Id_User 		
WHERE id_Payment = @P_id_Payment;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_PAYMENT_BY_METHOD_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PAYMENT_BY_METHOD_PR]
    @P_Method VARCHAR(30)
AS
BEGIN
SELECT p.id_Payment,
p.Status,
p.Date,
p.Type,
p.Method,
p.Amount,
p.Enrollment_fee,
p.Document,
Client.Id_User AS ClientId,
		Client.Name AS ClientName,
		Client.LastName1 AS ClientLastName1,
		Client.LastName2 AS ClientLastName2,
		Client.Email AS ClientEmail,
		Client.Gender AS ClientGender,
		Client.PhoneNumber AS ClientPhoneNumber,
		Client.BirthDate AS ClientBirthDate,
		Client.CreationDate AS ClientCreationDate,
		Client.UserType AS ClientUserType,
		Client.Password AS ClientPassword

FROM 
Payment p
INNER JOIN 
Users Client ON p.Id_User = Client.Id_User 	
WHERE Method = @P_Method;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_PAYMENT_BY_STATUS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PAYMENT_BY_STATUS_PR]
    @P_Status VARCHAR(30)
AS
BEGIN
    SELECT 
        p.id_Payment,
        p.Status,
        p.Date,
        p.Method,
        p.Amount,
        p.Enrollment_fee,
        p.Document,
        Client.Id_User AS ClientId,
        Client.Name AS ClientName,
        Client.LastName1 AS ClientLastName1,
        Client.LastName2 AS ClientLastName2,
		Client.Email AS ClientEmail,
		Client.PhoneNumber AS ClientPhoneNumber,
		Client.UserType AS ClientUserType,
        m.Id AS MembershipId,
        m.Name AS Name,
        m.Description AS Description,
        m.Price AS Price
    FROM 
        Payment p
    INNER JOIN 
        Users Client ON p.Id_User = Client.Id_User
    LEFT JOIN 
        Membership m ON p.MembershipId = m.Id
    WHERE 
        p.Status = @P_Status;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_PAYMENT_BY_TYPE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PAYMENT_BY_TYPE_PR]
    @P_Type VARCHAR(30)
AS
BEGIN
    SELECT Status, Date, Type, Method, Amount FROM Payment 
	WHERE Type = @P_Type;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_PERSONAL_TRAINER_BY_CLIENT_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PERSONAL_TRAINER_BY_CLIENT_ID_PR]
@P_CLIENT_ID INT
AS
	SELECT Id_PersonalTrainer,Status,Date,Hour, CreationDate,Id_Trainer,Id_Client
	FROM PersonalTrainer
	WHERE Id_Client=@P_CLIENT_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_PERSONAL_TRAINER_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PERSONAL_TRAINER_BY_ID_PR]
@P_ID INT
AS
SELECT 
    Trainer.Id_User AS TrainerId,
    Trainer.Name AS TrainerName,
    Trainer.LastName1 AS TrainerLastName1,
    Trainer.LastName2 AS TrainerLastName2,
    Trainer.Email AS TrainerEmail,
    Trainer.Gender AS TrainerGender,
    Trainer.PhoneNumber AS TrainerPhoneNumber,
    Trainer.BirthDate AS TrainerBirthDate,
    Trainer.CreationDate AS TrainerCreationDate,
    Trainer.UserType AS TrainerUserType,
    Trainer.Password AS TrainerPassword,
    Client.Id_User AS ClientId,
    Client.Name AS ClientName,
    Client.LastName1 AS ClientLastName1,
    Client.LastName2 AS ClientLastName2,
    Client.Email AS ClientEmail,
    Client.Gender AS ClientGender,
    Client.PhoneNumber AS ClientPhoneNumber,
    Client.BirthDate AS ClientBirthDate,
    Client.CreationDate AS ClientCreationDate,
    Client.UserType AS ClientUserType,
    Client.Password AS ClientPassword,
    A.Id_PersonalTrainer,
    A.Status,
    A.Date,
    A.Hour,
    A.CreationDate AS PersonalTrainerCreationDate,
    A.Id_Trainer,
    A.Id_Client
FROM 
    [Project_Test].[dbo].[PersonalTrainer] A
INNER JOIN 
    [Project_Test].[dbo].[Users] Trainer
ON 
    A.Id_Trainer = Trainer.Id_User
INNER JOIN 
    [Project_Test].[dbo].[Users] Client
ON 
    A.Id_Client = Client.Id_User
	WHERE Id_PersonalTrainer=@P_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_PERSONAL_TRAINER_BY_USER_ID_2]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_PERSONAL_TRAINER_BY_USER_ID_2]
@P_USER_ID INT
AS
SELECT 
    Trainer.Id_User AS TrainerId,
    Trainer.Name AS TrainerName,
    Trainer.LastName1 AS TrainerLastName1,
    Trainer.LastName2 AS TrainerLastName2,
    Trainer.Email AS TrainerEmail,
    Trainer.Gender AS TrainerGender,
    Trainer.PhoneNumber AS TrainerPhoneNumber,
    Trainer.BirthDate AS TrainerBirthDate,
    Trainer.CreationDate AS TrainerCreationDate,
    Trainer.UserType AS TrainerUserType,
    Trainer.Password AS TrainerPassword,
    Client.Id_User AS ClientId,
    Client.Name AS ClientName,
    Client.LastName1 AS ClientLastName1,
    Client.LastName2 AS ClientLastName2,
    Client.Email AS ClientEmail,
    Client.Gender AS ClientGender,
    Client.PhoneNumber AS ClientPhoneNumber,
    Client.BirthDate AS ClientBirthDate,
    Client.CreationDate AS ClientCreationDate,
    Client.UserType AS ClientUserType,
    Client.Password AS ClientPassword,
    A.Id_PersonalTrainer,
    A.Status,
    A.Date,
    A.Hour,
    A.CreationDate AS PersonalTrainerCreationDate,
    A.Id_Trainer,
    A.Id_Client
FROM 
    [Project_Test].[dbo].[PersonalTrainer] A
INNER JOIN 
    [Project_Test].[dbo].[Users] Trainer
ON 
    A.Id_Trainer = Trainer.Id_User
INNER JOIN 
    [Project_Test].[dbo].[Users] Client
ON 
    A.Id_Client = Client.Id_User
	WHERE Id_Client =@P_USER_ID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_ROLE_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para recuperar un rol por ID
CREATE PROCEDURE [dbo].[RET_ROLE_BY_ID_PR]
    @P_ID_ROLE INT
AS
BEGIN
    SELECT Id_Role, Name, Description, Permission, CreationDate
    FROM Role
    WHERE Id_Role = @P_ID_ROLE
END
GO
/****** Object:  StoredProcedure [dbo].[RET_ROUTINE_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_ROUTINE_BY_ID_PR]
    @P_Id_Routine INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
			r.Id_Routine,
            r.Code,
            r.Name,
			r.Comments,
            r.CreationDate,
            r.Id_TrainingPlan
        FROM 
            Routine AS r
        WHERE 
            r.Id_Routine = @P_Id_Routine;
    END TRY
    BEGIN CATCH
         -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[RET_TOKEN_BY_VAlUE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TOKEN_BY_VAlUE_PR]
    @p_Token_Value VARCHAR(6)
AS
BEGIN
    SELECT Id_Token, Value, CreationDate, Id_User FROM Token
    WHERE Value = @p_Token_Value;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_TRAINING_PLAN_BY_ID_MEASUREMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_TRAINING_PLAN_BY_ID_MEASUREMENT_PR]
    @P_Id_Measurement INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
			tp.Id_TrainingPlan,
            tp.Name,
            tp.Goal,
			tp.DaysNumber,
            tp.CreationDate,
            tp.ExpireDate,
            tp.Id_Measurement
        FROM 
            TrainingPlan AS tp
        WHERE 
            tp.Id_Measurement = @P_Id_Measurement;
    END TRY
    BEGIN CATCH
         -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[RET_TRAINING_PLAN_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[RET_TRAINING_PLAN_BY_ID_PR]
    @P_Id_TrainingPlan INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        SELECT 
			tp.Id_TrainingPlan,
            tp.Name,
            tp.Goal,
			tp.DaysNumber,
            tp.CreationDate,
            tp.ExpireDate,
            tp.Id_Measurement
        FROM 
            TrainingPlan AS tp
        WHERE 
            tp.Id_TrainingPlan = @P_Id_TrainingPlan;
    END TRY
    BEGIN CATCH
         -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informacion del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[RET_TRAINING_PLAN_BY_USER_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TRAINING_PLAN_BY_USER_ID_PR]
    @UserId INT
AS
BEGIN
    SELECT 
        tp.Name AS Name,
        tp.Goal,
		tp.DaysNumber,
		tp.CreationDate,
		tp.ExpireDate,
		tp.Id_Measurement,
		tp.Id_TrainingPlan     
    FROM 
        [dbo].[Users] u
    INNER JOIN 
        Appointment ap ON u.Id_User = ap.Id_Client
    INNER JOIN 
        Measurement m ON ap.Id_Appointment = m.Id_Appointment
    INNER JOIN 
        TrainingPlan tp ON m.Id_Measurement = tp.Id_Measurement
    WHERE 
        u.Id_User = 104;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_TRAINING_RECORD_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TRAINING_RECORD_BY_ID_PR]
    @P_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        tr.TrainingRecordId AS TrainingRecordId,
        tr.CreationDate,
        tr.Sets,
        tr.Weight,
        tr.Time,
        tr.EX_Name,       
        tr.RestTime,      
        u.Id_User AS Id_User,
        a.Id_Activity AS ActivityId
    FROM 
        TrainingRecord tr
    INNER JOIN 
        Users u ON tr.Id_User = u.Id_User
    INNER JOIN 
        Activity a ON tr.ActivityId = a.Id_Activity
    WHERE 
        u.Id_User = @P_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_TRAINING_RECORD_BY_USER_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TRAINING_RECORD_BY_USER_ID_PR]
    @P_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        TrainingRecordId AS TrainingRecordId,
        CreationDate,
        Sets,
        Weight,
        Time,
        EX_Name AS ExerciseName,       
        RestTime,      
        Id_User AS Id_User,
        ActivityId AS ActivityId
    FROM TrainingRecord 

    WHERE Id_User = @P_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_TUITION_DISCOUNT_BY_ID]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_TUITION_DISCOUNT_BY_ID]
    @Id INT 
AS
BEGIN
    
    SELECT 
        Id_Discount AS Id,          
        Value AS Value,    
        CreationDate AS CreationDate 
    FROM
	TuitionDiscount           
    WHERE
        Id_Discount = @Id;         

   
END
GO
/****** Object:  StoredProcedure [dbo].[RET_USER_BY_EMAIL_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_USER_BY_EMAIL_PR]
 @P_Email NVARCHAR(255)
 AS
 SELECT Id_User,Name, LastName1,LastName2,Email,Gender,PhoneNumber,BirthDate,CreationDate,UserType,Password
 FROM Users
 WHERE @P_Email = Email
 RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_USER_BY_ID]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_USER_BY_ID]
 @P_Id NVARCHAR(255)
 AS
 SELECT Id_User,Name, LastName1,LastName2,Email,Gender,PhoneNumber,BirthDate,CreationDate,UserType,Password
 FROM Users
 WHERE @P_Id = Id_User
 RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_USER_BY_ID_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_USER_BY_ID_PR]
 @P_Id NVARCHAR(255)
 AS
 SELECT Id_User,Name, LastName1,LastName2,Email,Gender,PhoneNumber,BirthDate,CreationDate,UserType,Password
 FROM Users
 WHERE @P_Id = Id_User
 RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[RET_USERGROUP_BY_FK_ID_GROUPS]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_USERGROUP_BY_FK_ID_GROUPS]
    @FK_ID_GROUPS INT
AS
BEGIN
    SELECT * FROM USER_GROUPS
    WHERE FK_ID_GROUPS = @FK_ID_GROUPS;
END;
GO
/****** Object:  StoredProcedure [dbo].[RET_USERGROUP_BY_FK_ID_USER]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RET_USERGROUP_BY_FK_ID_USER]
    @FK_ID_USER INT
AS
BEGIN
    SELECT * FROM USER_GROUPS
    WHERE FK_ID_USER = @FK_ID_USER;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ACTIVITY_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UPDATE_ACTIVITY_PR]
	@P_Id_Activity INT,
	@p_Sets INT = NULL,
    @p_Reps INT = NULL,
	@p_Time DECIMAL(3,1) = NULL,
    @p_RestTime INT = NULL,
	@p_Weight DECIMAL(3,1) = NULL,
    @p_Id_Exercise INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Activity WHERE Id_Activity = @P_Id_Activity)
        BEGIN
            THROW 50000, 'La actividad con el ID proporcionado no existe.', 1;
        END
        
        IF NOT EXISTS (SELECT 1 FROM Exercises WHERE Id_Exercise = @P_Id_Exercise)
        BEGIN
            THROW 50000, 'El ejercicio con el ID proporcionado no existe.', 1;
        END

        UPDATE Activity
        SET Sets = @p_Sets,
        	Reps = @p_Reps,
       		Time = @p_Time,
        	RestTime = @p_RestTime,
			Weight = @p_Weight,
			Id_Exercise = @p_Id_Exercise
    	WHERE Id_Activity = @p_Id_Activity;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informaci�n del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_APPOINTMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_APPOINTMENT_PR]
    @p_Id_Appointment INT,
    @p_Status VARCHAR(20),
    @p_Date DATE,
    @p_Hour TIME,
    @p_Id_Trainer INT,
    @p_Id_Client INT
AS
BEGIN
    UPDATE Appointment
    SET Status = @p_Status,
        Date = @p_Date,
        Hour = @p_Hour,
        Id_Trainer = @p_Id_Trainer,
        Id_Client = @p_Id_Client
    WHERE Id_Appointment = @p_Id_Appointment;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_CLIENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_CLIENT_PR]
   @p_Id_Client INT,
    @p_Status VARCHAR(20),
    @p_PaymentDate DATE,
	@p_Id_User INT
AS
BEGIN
    UPDATE Client
    SET Status = @p_Status,
        PaymentDate = @p_PaymentDate,
		Id_User = @p_Id_User
    WHERE Id_Client = @p_Id_Client;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_COUPON_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UPDATE_COUPON_PR]
    @P_Id_Coupon INT,
    @P_Value int,
    @P_CreationDate DATETIME,
	@P_Code varchar(15),
	@P_ExpirationDate DATETIME,
	@P_Uses int

AS
BEGIN
    UPDATE Coupon
    SET Value = @P_Value,
        CreationDate = @P_CreationDate,
		Code = @P_Code,
		ExpirationDate = @P_ExpirationDate,
		Uses = @P_Uses
    WHERE Id_Coupon = @P_Id_Coupon;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEE_PR]
	@p_Id_Employee INT,
    @p_HiringDate DATE,
    @p_Id_User INT
AS
BEGIN
    UPDATE Employee
    SET HiringDate = @p_HiringDate,
        Id_User = @p_Id_User
    WHERE Id_Employee = @p_Id_Employee;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EQUIPMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_EQUIPMENT_PR]
	@P_Id_Equipment INT,
    @P_Name NVARCHAR(50),
	@P_Location NVARCHAR(50),
	@P_Img NVARCHAR(50),
	@P_CreationDate DATETIME
AS
    UPDATE Equipment 
    SET 
		Name = @P_Name,
        Location = @P_Location,
		Img = @P_Img,
		CreationDate = @P_CreationDate

    WHERE
          Id_Equipment = @P_Id_Equipment; 

RETURN 0;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EXERCISE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_EXERCISE_PR]
    @P_Id_Exercise INT,
    @P_Name NVARCHAR(100),
    @P_Type NVARCHAR(50),
    @P_Description NVARCHAR(255),
    @P_CreationDate DATETIME,
    @P_FK_Id_Equipment INT
AS
BEGIN
    UPDATE Exercises
    SET Name = @P_Name,
        Type = @P_Type,
        Description = @P_Description,
        CreationDate = @P_CreationDate,
        FK_Id_Equipment = @P_FK_Id_Equipment
    WHERE Id_Exercise = @P_Id_Exercise;
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_GROUP_CLASS_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_GROUP_CLASS_PR]
  @P_Id INT,
  @P_ClassName NVARCHAR(255),
  @P_ClassDescription TEXT,
  @P_MaxCapacity INT,
  @P_ClassTime NVARCHAR(255),
  @P_ClassDuration INT,
  @P_Days NVARCHAR(255)
AS
BEGIN
  UPDATE GroupClasses
  SET className = @P_ClassName,
      classDescription = @P_ClassDescription,
      maxCapacity = @P_MaxCapacity,
      classTime = @P_ClassTime,
      classDuration = @P_ClassDuration,
      days = @P_Days
  WHERE id = @P_Id;
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_INACTIVE_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_INACTIVE_DISCOUNT_PR]
    @P_Id_Discount INT,
    @P_Value int,
    @P_CreationDate DATETIME,
	@P_Months INT
AS
BEGIN
    UPDATE InactiveDiscount
    SET Value = @P_Value,
		Months = @P_Months,
        CreationDate = @P_CreationDate
		
    WHERE Id_Discount = @P_Id_Discount;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MEASUREMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_MEASUREMENT_PR]
(
    @P_Id_Measurement INT,
    @P_Height INT,
    @P_Weight FLOAT,
    @P_Fat_Percentage FLOAT,
	@P_Muscle_Percentage FLOAT,
    @P_Id_Appointment INT
)
AS
BEGIN
    UPDATE Measurement
    SET Height = @P_Height,
        Weight = @P_Weight,
        FatPercentage = @P_Fat_Percentage,
		MusclePercentage = @P_Muscle_Percentage,
        Id_Appointment = @P_Id_Appointment
    WHERE Id_Measurement = @P_Id_Measurement;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MEMBERSHIP_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_MEMBERSHIP_PR]
    @P_Id INT,
    @P_Name NVARCHAR(255),
    @P_Description NVARCHAR(MAX),
    @P_Price INT,
    @P_GroupsLimit INT
AS
BEGIN
    UPDATE Membership
    SET Name = @P_Name,
        Description = @P_Description,
        Price = @P_Price,
        GroupsLimit = @P_GroupsLimit
    WHERE Id = @P_Id;
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_NEW_CLIENT_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_NEW_CLIENT_DISCOUNT_PR]
    @P_Id_Discount INT,
    @P_Value int,
    @P_CreationDate DATETIME
AS
BEGIN
    UPDATE NewClientDiscount
    SET Value = @P_Value,
        CreationDate = @P_CreationDate
    WHERE Id_Discount = @P_Id_Discount;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PASSWORD_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_PASSWORD_PR]
  @P_Id INT,
  @P_PasswordEncrypted NVARCHAR(255),
  @P_FKIdUser INT,
  @P_Active NVARCHAR(10)
AS
BEGIN
  UPDATE Password
  SET PasswordEncrypted = @P_PasswordEncrypted,
      FKIdUser = @P_FKIdUser,
      Active = @P_Active
  WHERE Id_Password = @P_Id;
  RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PAYMENT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_PAYMENT_PR]
    @P_id_Payment INT,
    @P_Status VARCHAR(20),
    @P_Date DATE,
	@P_MembershipId INT,
    @P_Method VARCHAR(20),
    @P_Amount FLOAT,
	@P_Enrollment_fee FLOAT,
	@P_Document varbinary(max),
	@P_Id_User INT
AS
BEGIN
    UPDATE Payment
    SET Status = @P_Status,
        Date = @P_Date,
        Method = @P_Method,
        Amount = @P_Amount,
		Enrollment_fee = @P_Enrollment_fee,
		Document = @P_Document,
		MembershipId = @P_MembershipId,
		Id_User = @P_Id_User


    WHERE id_Payment = @P_id_Payment;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_PERSONAL_TRAINER_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_PERSONAL_TRAINER_PR]
    @p_Id_PersonalTrainer INT,
    @p_Status VARCHAR(20),
    @p_Date DATE,
    @p_Hour TIME,
    @p_Id_Trainer INT,
    @p_Id_Client INT
AS
BEGIN
    UPDATE PersonalTrainer
    SET Status = @p_Status,
        Date = @p_Date,
        Hour = @p_Hour,
        Id_Trainer = @p_Id_Trainer,
        Id_Client = @p_Id_Client
    WHERE Id_PersonalTrainer = @p_Id_PersonalTrainer;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ROLE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Procedimiento para actualizar un rol
CREATE PROCEDURE [dbo].[UPDATE_ROLE_PR]
    @P_Id_Role INT,
    @P_Name VARCHAR(50),
    @P_Description VARCHAR(250),
    @P_Permission VARCHAR(50),
    @P_CreationDate DATETIME
AS
BEGIN
    UPDATE Role
    SET Name = @P_Name,
        Description = @P_Description,
        Permission = @P_Permission,
        CreationDate = @P_CreationDate
    WHERE Id_Role = @P_Id_Role
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ROUTINE_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UPDATE_ROUTINE_PR]
	@P_Id_Routine INT,
	@P_Code VARCHAR(10),
    @P_Name VARCHAR(40),
    @P_Comments VARCHAR(100) = NULL
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Routine WHERE Id_Routine = @P_Id_Routine)
        BEGIN
            THROW 50000, 'La rutina con el ID proporcionado no existe.', 1;
        END

        UPDATE Routine
        SET Code = @P_Code,
        	Name = @P_Name,
            Comments = @P_Comments
        WHERE Id_Routine = @P_Id_Routine;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informaci�n del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_TRAINING_PLAN_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UPDATE_TRAINING_PLAN_PR]
	@P_Id_TrainingPlan INT,
    @P_Name VARCHAR(40),
    @P_Goal VARCHAR(50)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM TrainingPlan WHERE Id_TrainingPlan = @P_Id_TrainingPlan)
        BEGIN
            THROW 50000, 'El plan de entrenamiento con el ID proporcionado no existe.', 1;
        END

        UPDATE TrainingPlan
        SET Name = @P_Name,
            Goal = @P_Goal
        WHERE Id_TrainingPlan = @P_Id_TrainingPlan;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Si hay un error, revertir la transacci�n
        ROLLBACK TRANSACTION;

        -- Devolver informaci�n del error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_TUITION_DISCOUNT_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_TUITION_DISCOUNT_PR]
    @P_Id_Discount INT,
    @P_Value int,
    @P_CreationDate DATETIME
AS
BEGIN
    UPDATE TuitionDiscount
    SET Value = @P_Value,
        CreationDate = @P_CreationDate
    WHERE Id_Discount = @P_Id_Discount;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_USER_PASSWORD_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_USER_PASSWORD_PR]
    @P_Id INT,
    @P_Password NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Actualización de la contraseña del usuario
    UPDATE Users
    SET Password = @P_Password
    WHERE Id_User = @P_Id;

    -- Verificación de éxito
    IF @@ROWCOUNT = 0
    BEGIN
        -- Si no se actualizó ninguna fila, lanzamos un error
        RAISERROR ('User with specified ID not found.', 16, 1);
    END
END

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_USER_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_USER_PR]
    @P_Id INT,
    @P_Name NVARCHAR(255),
    @P_LastName NVARCHAR(255),
    @P_LastName2 NVARCHAR(255),
    @P_Email NVARCHAR(255),
    @P_Gender NVARCHAR(255),
    @P_PhoneNumber NVARCHAR(255),
    @P_BirthDate DATETIME,
    @P_UserType NVARCHAR(50)
AS
BEGIN
    UPDATE Users
    SET Name = @P_Name,
        LastName1 = @P_LastName,
        LastName2 = @P_LastName2,
        Email = @P_Email,
        Gender = @P_Gender,
        PhoneNumber = @P_PhoneNumber,
        BirthDate = @P_BirthDate,
        UserType = @P_UserType

    WHERE Id_User = @P_Id;
    RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_USERGROUP]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_USERGROUP]
    @ID INT,
    @FK_ID_GROUPS INT,
    @FK_ID_USER INT
AS
BEGIN
    UPDATE USER_GROUPS
    SET FK_ID_GROUPS = @FK_ID_GROUPS,
        FK_ID_USER = @FK_ID_USER
    WHERE ID = @ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[USER_AUTHENTICATION_PR]    Script Date: 8/19/2024 10:55:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USER_AUTHENTICATION_PR]
    @P_Email NVARCHAR(255),
    @P_Password NVARCHAR(255)
AS
SELECT Id_User, Name,LastName1,LastName2,Email,Gender,PhoneNumber,BirthDate,CreationDate,UserType, Password
FROM Users
WHERE Email = @P_Email AND Password = @P_Password
RETURN 0
GO
USE [master]
GO
ALTER DATABASE [Project_Test] SET  READ_WRITE 
GO
