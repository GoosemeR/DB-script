USE [master]
GO
/****** Object:  Database [Marathon]    Script Date: 29.05.2020 19:24:39 ******/
CREATE DATABASE [Marathon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'01.06', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SSQLEXPRESS\MSSQL\DATA\Marathon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'01.06_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SSQLEXPRESS\MSSQL\DATA\Marathon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Marathon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Marathon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Marathon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Marathon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Marathon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Marathon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Marathon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Marathon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Marathon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Marathon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Marathon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Marathon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Marathon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Marathon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Marathon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Marathon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Marathon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Marathon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Marathon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Marathon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Marathon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Marathon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Marathon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Marathon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Marathon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Marathon] SET  MULTI_USER 
GO
ALTER DATABASE [Marathon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Marathon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Marathon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Marathon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Marathon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Marathon] SET QUERY_STORE = OFF
GO
USE [Marathon]
GO
/****** Object:  Table [dbo].[Charity]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charity](
	[Charityid] [int] NOT NULL,
	[CharityName] [varchar](100) NOT NULL,
	[CharityDescription] [varchar](2000) NULL,
	[CharityLogo] [varchar](50) NULL,
 CONSTRAINT [PK_Charity] PRIMARY KEY CLUSTERED 
(
	[Charityid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [char](3) NOT NULL,
	[CountryName] [varchar](100) NOT NULL,
	[CountryFlag] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[Eventid] [char](6) NOT NULL,
	[EventName] [varchar](50) NOT NULL,
	[EventTypeid] [char](2) NOT NULL,
	[Marathonid] [tinyint] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[Cost] [decimal](10, 2) NULL,
	[MaxParticipants] [smallint] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[Eventid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[EventTypeid] [char](2) NOT NULL,
	[EventTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EventType] PRIMARY KEY CLUSTERED 
(
	[EventTypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marathon]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marathon](
	[Marathonid] [tinyint] NOT NULL,
	[MarathonName] [varchar](80) NOT NULL,
	[CityName] [varchar](80) NULL,
	[CountryCode] [char](3) NOT NULL,
	[YearHeld] [smallint] NULL,
 CONSTRAINT [PK_Marathon] PRIMARY KEY CLUSTERED 
(
	[Marathonid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Positionid] [smallint] NOT NULL,
	[PositionName] [varchar](50) NOT NULL,
	[PositionDescription] [varchar](1000) NULL,
	[PayPeriod] [varchar](10) NOT NULL,
	[Payrate] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Positionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaceKitOption]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaceKitOption](
	[RaceKitOptionid] [char](1) NOT NULL,
	[RaceKitOption] [varchar](80) NOT NULL,
	[RaceKitCost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_RaceKitOption] PRIMARY KEY CLUSTERED 
(
	[RaceKitOptionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Registrationid] [int] NOT NULL,
	[Runnerid] [int] NOT NULL,
	[RegistrationDataTime] [datetime] NOT NULL,
	[RaceKitOptionid] [char](1) NOT NULL,
	[RegistrationStatusid] [tinyint] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Charityid] [int] NOT NULL,
	[SponsorshipTarget] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Registrationid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationEvent]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationEvent](
	[RegistrationEventid] [int] NOT NULL,
	[Registrationid] [int] NOT NULL,
	[Eventid] [char](6) NOT NULL,
	[BibNumber] [smallint] NULL,
	[RaceTime] [int] NULL,
 CONSTRAINT [PK_RegistrationEvent] PRIMARY KEY CLUSTERED 
(
	[RegistrationEventid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationStatus]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationStatus](
	[RegistrationStatusid] [tinyint] NOT NULL,
	[RegistrationStatus] [varchar](80) NOT NULL,
 CONSTRAINT [PK_RegistrationStatus] PRIMARY KEY CLUSTERED 
(
	[RegistrationStatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Roleid] [char](1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Runner]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Runner](
	[Runnerid] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Gender] [varchar](100) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[CountryCode] [char](3) NOT NULL,
 CONSTRAINT [PK_Runner] PRIMARY KEY CLUSTERED 
(
	[Runnerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsorship]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsorship](
	[Sponsorshipid] [int] NOT NULL,
	[SponsorshipName] [varchar](150) NOT NULL,
	[Registrationid] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Sponsorship] PRIMARY KEY CLUSTERED 
(
	[Sponsorshipid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staffid] [int] NOT NULL,
	[FistName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Positionid] [smallint] NOT NULL,
	[Comments] [varchar](2000) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Staffid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[Timesheetid] [int] NOT NULL,
	[Staffid] [int] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[PayAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[Timesheetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[Roleid] [char](1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 29.05.2020 19:24:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[Volunteerid] [int] NOT NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[CountryCode] [char](3) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[Volunteerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventType] FOREIGN KEY([EventTypeid])
REFERENCES [dbo].[EventType] ([EventTypeid])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventType]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Marathon] FOREIGN KEY([Marathonid])
REFERENCES [dbo].[Marathon] ([Marathonid])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Marathon]
GO
ALTER TABLE [dbo].[Marathon]  WITH CHECK ADD  CONSTRAINT [FK_Marathon_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Marathon] CHECK CONSTRAINT [FK_Marathon_Country]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Charity] FOREIGN KEY([Charityid])
REFERENCES [dbo].[Charity] ([Charityid])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Charity]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_RaceKitOption] FOREIGN KEY([RaceKitOptionid])
REFERENCES [dbo].[RaceKitOption] ([RaceKitOptionid])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_RaceKitOption]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_RegistrationStatus] FOREIGN KEY([RegistrationStatusid])
REFERENCES [dbo].[RegistrationStatus] ([RegistrationStatusid])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_RegistrationStatus]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Runner] FOREIGN KEY([Runnerid])
REFERENCES [dbo].[Runner] ([Runnerid])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Runner]
GO
ALTER TABLE [dbo].[RegistrationEvent]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationEvent_Event] FOREIGN KEY([Eventid])
REFERENCES [dbo].[Event] ([Eventid])
GO
ALTER TABLE [dbo].[RegistrationEvent] CHECK CONSTRAINT [FK_RegistrationEvent_Event]
GO
ALTER TABLE [dbo].[RegistrationEvent]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationEvent_Registration] FOREIGN KEY([Registrationid])
REFERENCES [dbo].[Registration] ([Registrationid])
GO
ALTER TABLE [dbo].[RegistrationEvent] CHECK CONSTRAINT [FK_RegistrationEvent_Registration]
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD  CONSTRAINT [FK_Runner_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Runner] CHECK CONSTRAINT [FK_Runner_Country]
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD  CONSTRAINT [FK_Runner_User] FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Runner] CHECK CONSTRAINT [FK_Runner_User]
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorship_Registration] FOREIGN KEY([Registrationid])
REFERENCES [dbo].[Registration] ([Registrationid])
GO
ALTER TABLE [dbo].[Sponsorship] CHECK CONSTRAINT [FK_Sponsorship_Registration]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Position] FOREIGN KEY([Positionid])
REFERENCES [dbo].[Position] ([Positionid])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Position]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Staff] FOREIGN KEY([Staffid])
REFERENCES [dbo].[Staff] ([Staffid])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Staff]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Roleid])
REFERENCES [dbo].[Role] ([Roleid])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Country]
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD  CONSTRAINT [FK_Volunteer_Gender] FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[Volunteer] CHECK CONSTRAINT [FK_Volunteer_Gender]
GO
USE [master]
GO
ALTER DATABASE [Marathon] SET  READ_WRITE 
GO
