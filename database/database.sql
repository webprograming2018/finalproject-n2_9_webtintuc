USE [master]
GO
/****** Object:  Database [newplatform]    Script Date: 12/28/2018 2:58:55 PM ******/
CREATE DATABASE [newplatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'newplatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\newplatform.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'newplatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\newplatform_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [newplatform] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [newplatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [newplatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [newplatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [newplatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [newplatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [newplatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [newplatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [newplatform] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [newplatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [newplatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [newplatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [newplatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [newplatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [newplatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [newplatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [newplatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [newplatform] SET  ENABLE_BROKER 
GO
ALTER DATABASE [newplatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [newplatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [newplatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [newplatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [newplatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [newplatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [newplatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [newplatform] SET RECOVERY FULL 
GO
ALTER DATABASE [newplatform] SET  MULTI_USER 
GO
ALTER DATABASE [newplatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [newplatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [newplatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [newplatform] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'newplatform', N'ON'
GO
USE [newplatform]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12/28/2018 2:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NULL,
	[name] [nvarchar](100) NULL,
	[createddate] [datetime2](7) NULL,
	[createdby] [nvarchar](255) NULL,
	[modifieddate] [datetime2](7) NULL,
	[modifiedby] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[new_user]    Script Date: 12/28/2018 2:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[new_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userid] [bigint] NULL,
	[newid] [bigint] NULL,
	[content] [nvarchar](max) NULL,
	[code] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[news]    Script Date: 12/28/2018 2:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[news](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[image] [varchar](100) NULL,
	[title] [nvarchar](max) NULL,
	[shortdescription] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[newslide] [int] NULL,
	[newhot] [int] NULL,
	[createddate] [datetime2](7) NULL,
	[createdby] [nvarchar](255) NULL,
	[modifieddate] [datetime2](7) NULL,
	[modifiedby] [nvarchar](255) NULL,
	[categoryid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 12/28/2018 2:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[role](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](30) NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/28/2018 2:58:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](32) NULL,
	[status] [int] NULL,
	[isdelete] [int] NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](20) NULL,
	[fullname] [nvarchar](255) NULL,
	[roleid] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [code], [name], [createddate], [createdby], [modifieddate], [modifiedby]) VALUES (1, N'the-thao', N'Thể thao', NULL, NULL, NULL, NULL)
INSERT [dbo].[category] ([id], [code], [name], [createddate], [createdby], [modifieddate], [modifiedby]) VALUES (2, N'the-gioi', N'Thế giới', NULL, NULL, NULL, NULL)
INSERT [dbo].[category] ([id], [code], [name], [createddate], [createdby], [modifieddate], [modifiedby]) VALUES (3, N'chinh-tri', N'Chính trị', NULL, NULL, NULL, NULL)
INSERT [dbo].[category] ([id], [code], [name], [createddate], [createdby], [modifieddate], [modifiedby]) VALUES (4, N'thoi-su', N'Thời sự', NULL, NULL, NULL, NULL)
INSERT [dbo].[category] ([id], [code], [name], [createddate], [createdby], [modifieddate], [modifiedby]) VALUES (5, N'goc-nhin', N'Góc nhìn', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[new_user] ON 

INSERT [dbo].[new_user] ([id], [userid], [newid], [content], [code]) VALUES (1, 2, 6, N'test 1', N'comment')
INSERT [dbo].[new_user] ([id], [userid], [newid], [content], [code]) VALUES (2, 2, 6, N'test 2', N'comment')
INSERT [dbo].[new_user] ([id], [userid], [newid], [content], [code]) VALUES (3, 2, 9, NULL, N'favorite')
INSERT [dbo].[new_user] ([id], [userid], [newid], [content], [code]) VALUES (5, 2, 11, NULL, N'favorite')
SET IDENTITY_INSERT [dbo].[new_user] OFF
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [image], [title], [shortdescription], [content], [newslide], [newhot], [createddate], [createdby], [modifieddate], [modifiedby], [categoryid]) VALUES (6, N'sp1.jpg', N'tiêu đề 1', N'tiêu đề 1', N'tiêu đề 1', 1, 0, CAST(0x0700000000001E3F0B AS DateTime2), NULL, NULL, NULL, 5)
INSERT [dbo].[news] ([id], [image], [title], [shortdescription], [content], [newslide], [newhot], [createddate], [createdby], [modifieddate], [modifiedby], [categoryid]) VALUES (7, N'sp2.jpg', N'Tiều đề 2', N'test', N'test', 1, 0, CAST(0x0700000000001D3F0B AS DateTime2), NULL, NULL, NULL, 1)
INSERT [dbo].[news] ([id], [image], [title], [shortdescription], [content], [newslide], [newhot], [createddate], [createdby], [modifieddate], [modifiedby], [categoryid]) VALUES (8, N'sp3.jpg', N'Tiều đề 3', N'test', N'test', 1, 0, CAST(0x0700000000001D3F0B AS DateTime2), NULL, NULL, NULL, 2)
INSERT [dbo].[news] ([id], [image], [title], [shortdescription], [content], [newslide], [newhot], [createddate], [createdby], [modifieddate], [modifiedby], [categoryid]) VALUES (9, N'sp4.jpg', N'Tiều đề 4', N'test', N'test', 0, 1, CAST(0x0700000000001C3F0B AS DateTime2), NULL, NULL, NULL, 3)
INSERT [dbo].[news] ([id], [image], [title], [shortdescription], [content], [newslide], [newhot], [createddate], [createdby], [modifieddate], [modifiedby], [categoryid]) VALUES (10, N'sp6.jpg', N'tiêu để 6', N'test', N'test', 0, 1, CAST(0x0700000000001E3F0B AS DateTime2), NULL, NULL, NULL, 3)
INSERT [dbo].[news] ([id], [image], [title], [shortdescription], [content], [newslide], [newhot], [createddate], [createdby], [modifieddate], [modifiedby], [categoryid]) VALUES (11, N'sp6.jpg', N'Đoàn Văn Hậu là cầu thủ trẻ thứ ba ở Asian Cup 2019', N'Đoàn Văn Hậu là cầu thủ trẻ thứ ba ở Asian Cup 2019', N'Đoàn Văn Hậu là cầu thủ trẻ thứ ba ở Asian Cup 2019
', 0, 1, CAST(0x0700000000001F3F0B AS DateTime2), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[news] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [code], [name]) VALUES (1, N'ADMIN', N'Quản trị')
INSERT [dbo].[role] ([id], [code], [name]) VALUES (2, N'USER', N'Người dùng')
SET IDENTITY_INSERT [dbo].[role] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [status], [isdelete], [address], [phone], [fullname], [roleid]) VALUES (1, N'admin', N'123456', 1, 0, NULL, NULL, N'admin', 1)
INSERT [dbo].[users] ([id], [username], [password], [status], [isdelete], [address], [phone], [fullname], [roleid]) VALUES (2, N'nguyenvana', N'123456', 1, 0, NULL, NULL, N'nguy?n van a', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[news] ADD  DEFAULT ((0)) FOR [newslide]
GO
ALTER TABLE [dbo].[news] ADD  DEFAULT ((0)) FOR [newhot]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [isdelete]
GO
ALTER TABLE [dbo].[new_user]  WITH CHECK ADD FOREIGN KEY([newid])
REFERENCES [dbo].[news] ([id])
GO
ALTER TABLE [dbo].[new_user]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([roleid])
REFERENCES [dbo].[role] ([id])
GO
USE [master]
GO
ALTER DATABASE [newplatform] SET  READ_WRITE 
GO
