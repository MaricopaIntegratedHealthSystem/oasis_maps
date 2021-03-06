USE [master]
GO
/****** Object:  Database [oasis_maps]    Script Date: 7/17/2018 2:06:38 PM ******/
CREATE DATABASE [oasis_maps]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'oasis_maps', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\oasis_maps.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'oasis_maps_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\oasis_maps_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [oasis_maps] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [oasis_maps].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [oasis_maps] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [oasis_maps] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [oasis_maps] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [oasis_maps] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [oasis_maps] SET ARITHABORT OFF 
GO
ALTER DATABASE [oasis_maps] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [oasis_maps] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [oasis_maps] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [oasis_maps] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [oasis_maps] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [oasis_maps] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [oasis_maps] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [oasis_maps] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [oasis_maps] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [oasis_maps] SET  DISABLE_BROKER 
GO
ALTER DATABASE [oasis_maps] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [oasis_maps] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [oasis_maps] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [oasis_maps] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [oasis_maps] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [oasis_maps] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [oasis_maps] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [oasis_maps] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [oasis_maps] SET  MULTI_USER 
GO
ALTER DATABASE [oasis_maps] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [oasis_maps] SET DB_CHAINING OFF 
GO
ALTER DATABASE [oasis_maps] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [oasis_maps] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [oasis_maps] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [oasis_maps] SET QUERY_STORE = OFF
GO
USE [oasis_maps]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [oasis_maps]
GO
/****** Object:  Table [dbo].[map_lookup]    Script Date: 7/17/2018 2:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[map_lookup](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[SendingApplicationUniversalIDType] [varchar](50) NULL,
	[SendingApplicationUniversalID] [varchar](max) NULL,
	[ReceivingApplicationNamespaceID] [varchar](max) NULL,
	[Version] [varchar](50) NULL,
	[SendingApplicationNamespaceID] [varchar](50) NULL,
	[MessageTypeMessageStructure] [varchar](max) NULL,
	[SendingFacilityUniversalIDType] [varchar](50) NULL,
	[ReceivingFacilityUniversalID] [varchar](max) NULL,
	[DateTimeofMessage] [datetime] NULL,
	[MessageTypeTriggerEvent] [varchar](max) NULL,
	[MessageTypeMessageCode] [varchar](max) NULL,
	[SendingFacilityNamespaceID] [varchar](max) NULL,
	[ReceivingFacilityNamespaceID] [varchar](max) NULL,
	[MessageHeader] [varbinary](50) NULL,
	[InfoId] [varchar](50) NULL,
	[ReceivingApplicationUniversalID] [varchar](max) NULL,
	[ReceivingFacilityUniversalIDType] [varchar](50) NULL,
	[ReceivingApplicationUniversalIDType] [varchar](50) NULL,
	[SendingFacilityUniversalID] [varchar](max) NULL,
	[active_map_id] [bigint] NOT NULL,
	[created_at] [datetime] NULL,
	[modified_at] [datetime] NULL,
 CONSTRAINT [PK_map_lookup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maps]    Script Date: 7/17/2018 2:06:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maps](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[source_guideline_path] [varchar](max) NULL,
	[translate_path] [varchar](max) NULL,
	[target_guideline_path] [varchar](max) NULL,
	[lookup_id] [bigint] NOT NULL,
 CONSTRAINT [PK_maps] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [oasis_maps] SET  READ_WRITE 
GO
