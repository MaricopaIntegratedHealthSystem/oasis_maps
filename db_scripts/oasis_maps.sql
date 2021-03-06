USE [oasis_maps]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[routetags]') AND type in (N'U'))
ALTER TABLE [dbo].[routetags] DROP CONSTRAINT IF EXISTS [FK_routetags_routetags]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[route_criterias]') AND type in (N'U'))
ALTER TABLE [dbo].[route_criterias] DROP CONSTRAINT IF EXISTS [FK_route_criterias_routes]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[endpoints]') AND type in (N'U'))
ALTER TABLE [dbo].[endpoints] DROP CONSTRAINT IF EXISTS [DF_endpoints_consumer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[endpoints]') AND type in (N'U'))
ALTER TABLE [dbo].[endpoints] DROP CONSTRAINT IF EXISTS [DF_endpoints_producer]
GO
/****** Object:  Index [IX_routes]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP INDEX IF EXISTS [IX_routes] ON [dbo].[routes]
GO
/****** Object:  Table [dbo].[routetags]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP TABLE IF EXISTS [dbo].[routetags]
GO
/****** Object:  Table [dbo].[routes]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP TABLE IF EXISTS [dbo].[routes]
GO
/****** Object:  Table [dbo].[route_criterias]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP TABLE IF EXISTS [dbo].[route_criterias]
GO
/****** Object:  Table [dbo].[maps]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP TABLE IF EXISTS [dbo].[maps]
GO
/****** Object:  Table [dbo].[map_lookup]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP TABLE IF EXISTS [dbo].[map_lookup]
GO
/****** Object:  Table [dbo].[endpoints]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP TABLE IF EXISTS [dbo].[endpoints]
GO
/****** Object:  User [tibco]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP USER IF EXISTS [tibco]
GO
USE [master]
GO
/****** Object:  Database [oasis_maps]    Script Date: 8/20/2018 8:17:25 AM ******/
DROP DATABASE IF EXISTS [oasis_maps]
GO
/****** Object:  Database [oasis_maps]    Script Date: 8/20/2018 8:17:25 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'oasis_maps')
BEGIN
CREATE DATABASE [oasis_maps]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'oasis_maps', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\oasis_maps.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'oasis_maps_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\oasis_maps_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
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
/****** Object:  User [tibco]    Script Date: 8/20/2018 8:17:26 AM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'tibco')
CREATE USER [tibco] FOR LOGIN [tibco] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [tibco]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [tibco]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [tibco]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [tibco]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [tibco]
GO
ALTER ROLE [db_datareader] ADD MEMBER [tibco]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [tibco]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [tibco]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [tibco]
GO
/****** Object:  Table [dbo].[endpoints]    Script Date: 8/20/2018 8:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[endpoints]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[endpoints](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[organization] [varchar](100) NOT NULL,
	[producer] [bit] NOT NULL,
	[consumer] [bit] NOT NULL,
	[software] [varchar](50) NULL,
	[producer_host] [varchar](max) NULL,
	[producer_port] [varchar](10) NULL,
	[consumer_host] [varchar](max) NULL,
	[consumer_port] [varchar](10) NULL,
	[producer_queue] [varchar](max) NULL,
	[consumer_prexlate_queue] [varchar](max) NULL,
	[consumer_postxlate_queue] [varchar](max) NULL,
 CONSTRAINT [PK_endpoints] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[map_lookup]    Script Date: 8/20/2018 8:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[map_lookup]') AND type in (N'U'))
BEGIN
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
	[MessageHeader] [varchar](50) NULL,
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
END
GO
/****** Object:  Table [dbo].[maps]    Script Date: 8/20/2018 8:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[maps]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[maps](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[source_guideline_path] [varchar](max) NULL,
	[translate_path] [varchar](max) NULL,
	[target_guideline_path] [varchar](max) NULL,
	[lookup_id] [bigint] NULL,
 CONSTRAINT [PK_maps] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[route_criterias]    Script Date: 8/20/2018 8:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[route_criterias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[route_criterias](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[criteria_process] [varchar](255) NOT NULL,
	[route_id] [bigint] NOT NULL,
 CONSTRAINT [PK_route_criterias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[routes]    Script Date: 8/20/2018 8:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[routes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[routes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[producer_id] [bigint] NOT NULL,
	[consumer_id] [bigint] NOT NULL,
	[producer_messagetypemessagecode] [varchar](50) NOT NULL,
	[producer_messagetypetriggerevent] [varchar](50) NOT NULL,
	[consumer_messagetypemessagecode] [varchar](50) NOT NULL,
	[consumer_messagetypetriggerevent] [varchar](50) NOT NULL,
 CONSTRAINT [PK_routes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[routetags]    Script Date: 8/20/2018 8:17:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[routetags]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[routetags](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[route_tag] [varchar](50) NOT NULL,
	[route_id] [bigint] NOT NULL,
 CONSTRAINT [PK_routetags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[endpoints] ON 
GO
INSERT [dbo].[endpoints] ([id], [organization], [producer], [consumer], [software], [producer_host], [producer_port], [consumer_host], [consumer_port], [producer_queue], [consumer_prexlate_queue], [consumer_postxlate_queue]) VALUES (1, N'MIHS', 1, 1, N'Epic', N'localhost', N'3334', N'localhost', N'2323', N'prod_epic', N'cnsmr_pre_epic', N'cnsmr_post_epic')
GO
INSERT [dbo].[endpoints] ([id], [organization], [producer], [consumer], [software], [producer_host], [producer_port], [consumer_host], [consumer_port], [producer_queue], [consumer_prexlate_queue], [consumer_postxlate_queue]) VALUES (2, N'MIHS', 1, 1, N'Cmaxx', N'localhost', N'3335', N'localhost', N'2324', N'prod_cmax', N'cnsmr_pre_cmax', N'cnsmr_post_cmax')
GO
INSERT [dbo].[endpoints] ([id], [organization], [producer], [consumer], [software], [producer_host], [producer_port], [consumer_host], [consumer_port], [producer_queue], [consumer_prexlate_queue], [consumer_postxlate_queue]) VALUES (3, N'VENDER-A', 0, 1, N'CloverLeaf', NULL, NULL, N'localhost', N'2325', NULL, N'cnsmr_pre_vndr_a', N'cnsmr_post_vndr_a')
GO
INSERT [dbo].[endpoints] ([id], [organization], [producer], [consumer], [software], [producer_host], [producer_port], [consumer_host], [consumer_port], [producer_queue], [consumer_prexlate_queue], [consumer_postxlate_queue]) VALUES (4, N'VEND-B', 0, 1, N'Bob', N'localhost', N'3336', N'localhost', N'2326', NULL, N'cnsmr_pre_vndr_b', N'cnsmr_post_vndrb')
GO
SET IDENTITY_INSERT [dbo].[endpoints] OFF
GO
SET IDENTITY_INSERT [dbo].[map_lookup] ON 
GO
INSERT [dbo].[map_lookup] ([id], [SendingApplicationUniversalIDType], [SendingApplicationUniversalID], [ReceivingApplicationNamespaceID], [Version], [SendingApplicationNamespaceID], [MessageTypeMessageStructure], [SendingFacilityUniversalIDType], [ReceivingFacilityUniversalID], [DateTimeofMessage], [MessageTypeTriggerEvent], [MessageTypeMessageCode], [SendingFacilityNamespaceID], [ReceivingFacilityNamespaceID], [MessageHeader], [InfoId], [ReceivingApplicationUniversalID], [ReceivingFacilityUniversalIDType], [ReceivingApplicationUniversalIDType], [SendingFacilityUniversalID], [active_map_id], [created_at], [modified_at]) VALUES (2, NULL, NULL, NULL, N'2.6', NULL, NULL, NULL, N'AL9999', NULL, N'V03', N'VXR', N'ALERT IIS', N'VALCLIN', N'MSH', N'HL7', NULL, NULL, NULL, NULL, 2, CAST(N'2018-07-16T18:16:56.350' AS DateTime), CAST(N'2018-08-15T19:29:33.983' AS DateTime))
GO
INSERT [dbo].[map_lookup] ([id], [SendingApplicationUniversalIDType], [SendingApplicationUniversalID], [ReceivingApplicationNamespaceID], [Version], [SendingApplicationNamespaceID], [MessageTypeMessageStructure], [SendingFacilityUniversalIDType], [ReceivingFacilityUniversalID], [DateTimeofMessage], [MessageTypeTriggerEvent], [MessageTypeMessageCode], [SendingFacilityNamespaceID], [ReceivingFacilityNamespaceID], [MessageHeader], [InfoId], [ReceivingApplicationUniversalID], [ReceivingFacilityUniversalIDType], [ReceivingApplicationUniversalIDType], [SendingFacilityUniversalID], [active_map_id], [created_at], [modified_at]) VALUES (4, NULL, NULL, NULL, N'2.3', NULL, NULL, NULL, NULL, NULL, N'TEST', N'TST', NULL, NULL, NULL, N'HL7', NULL, NULL, NULL, NULL, 3, CAST(N'2018-07-26T18:23:49.120' AS DateTime), CAST(N'2018-07-26T18:23:49.120' AS DateTime))
GO
INSERT [dbo].[map_lookup] ([id], [SendingApplicationUniversalIDType], [SendingApplicationUniversalID], [ReceivingApplicationNamespaceID], [Version], [SendingApplicationNamespaceID], [MessageTypeMessageStructure], [SendingFacilityUniversalIDType], [ReceivingFacilityUniversalID], [DateTimeofMessage], [MessageTypeTriggerEvent], [MessageTypeMessageCode], [SendingFacilityNamespaceID], [ReceivingFacilityNamespaceID], [MessageHeader], [InfoId], [ReceivingApplicationUniversalID], [ReceivingFacilityUniversalIDType], [ReceivingApplicationUniversalIDType], [SendingFacilityUniversalID], [active_map_id], [created_at], [modified_at]) VALUES (5, NULL, NULL, NULL, N'5', NULL, NULL, NULL, NULL, NULL, N't2', N'tt2', NULL, NULL, NULL, N'EDI', NULL, NULL, NULL, NULL, 4, CAST(N'2018-07-26T18:29:00.427' AS DateTime), CAST(N'2018-07-26T18:29:00.427' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[map_lookup] OFF
GO
SET IDENTITY_INSERT [dbo].[maps] ON 
GO
INSERT [dbo].[maps] ([id], [source_guideline_path], [translate_path], [target_guideline_path], [lookup_id]) VALUES (2, N'VXR_V03.std', N'VXR_V03_VXR_V03_EX.map', N'', 1)
GO
INSERT [dbo].[maps] ([id], [source_guideline_path], [translate_path], [target_guideline_path], [lookup_id]) VALUES (3, N'test.std', N'test.map', N'outtest.std', 4)
GO
INSERT [dbo].[maps] ([id], [source_guideline_path], [translate_path], [target_guideline_path], [lookup_id]) VALUES (4, N'editest.std', N'editest.map', N'ediouttest.std', NULL)
GO
SET IDENTITY_INSERT [dbo].[maps] OFF
GO
SET IDENTITY_INSERT [dbo].[routes] ON 
GO
INSERT [dbo].[routes] ([id], [producer_id], [consumer_id], [producer_messagetypemessagecode], [producer_messagetypetriggerevent], [consumer_messagetypemessagecode], [consumer_messagetypetriggerevent]) VALUES (1, 1, 2, N'VXR', N'V03', N'VXR', N'V03')
GO
INSERT [dbo].[routes] ([id], [producer_id], [consumer_id], [producer_messagetypemessagecode], [producer_messagetypetriggerevent], [consumer_messagetypemessagecode], [consumer_messagetypetriggerevent]) VALUES (2, 1, 3, N'VXR', N'V03', N'ADT', N'A08')
GO
INSERT [dbo].[routes] ([id], [producer_id], [consumer_id], [producer_messagetypemessagecode], [producer_messagetypetriggerevent], [consumer_messagetypemessagecode], [consumer_messagetypetriggerevent]) VALUES (3, 1, 4, N'VXR', N'V03', N'VXR', N'V03')
GO
SET IDENTITY_INSERT [dbo].[routes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_routes]    Script Date: 8/20/2018 8:17:26 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[routes]') AND name = N'IX_routes')
CREATE UNIQUE NONCLUSTERED INDEX [IX_routes] ON [dbo].[routes]
(
	[producer_id] ASC,
	[consumer_id] ASC,
	[producer_messagetypemessagecode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_endpoints_producer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[endpoints] ADD  CONSTRAINT [DF_endpoints_producer]  DEFAULT ((0)) FOR [producer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_endpoints_consumer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[endpoints] ADD  CONSTRAINT [DF_endpoints_consumer]  DEFAULT ((0)) FOR [consumer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_route_criterias_routes]') AND parent_object_id = OBJECT_ID(N'[dbo].[route_criterias]'))
ALTER TABLE [dbo].[route_criterias]  WITH CHECK ADD  CONSTRAINT [FK_route_criterias_routes] FOREIGN KEY([route_id])
REFERENCES [dbo].[routes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_route_criterias_routes]') AND parent_object_id = OBJECT_ID(N'[dbo].[route_criterias]'))
ALTER TABLE [dbo].[route_criterias] CHECK CONSTRAINT [FK_route_criterias_routes]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_routetags_routetags]') AND parent_object_id = OBJECT_ID(N'[dbo].[routetags]'))
ALTER TABLE [dbo].[routetags]  WITH CHECK ADD  CONSTRAINT [FK_routetags_routetags] FOREIGN KEY([route_id])
REFERENCES [dbo].[routes] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_routetags_routetags]') AND parent_object_id = OBJECT_ID(N'[dbo].[routetags]'))
ALTER TABLE [dbo].[routetags] CHECK CONSTRAINT [FK_routetags_routetags]
GO
USE [master]
GO
ALTER DATABASE [oasis_maps] SET  READ_WRITE 
GO
