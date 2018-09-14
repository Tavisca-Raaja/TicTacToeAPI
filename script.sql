USE [master]
GO
/****** Object:  Database [Gaming]    Script Date: 9/14/2018 6:04:41 PM ******/
CREATE DATABASE [Gaming]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gaming', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Gaming.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gaming_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Gaming_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Gaming] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gaming].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gaming] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gaming] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gaming] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gaming] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gaming] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gaming] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gaming] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Gaming] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gaming] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gaming] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gaming] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gaming] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gaming] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gaming] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gaming] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gaming] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gaming] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gaming] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gaming] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gaming] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gaming] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gaming] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gaming] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gaming] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gaming] SET  MULTI_USER 
GO
ALTER DATABASE [Gaming] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gaming] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gaming] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gaming] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Gaming]
GO
/****** Object:  Table [dbo].[StatusLogger]    Script Date: 9/14/2018 6:04:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusLogger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Request] [varchar](50) NULL,
	[Response] [varchar](50) NULL,
	[Exception] [varchar](50) NULL,
	[Comment] [varchar](50) NULL,
 CONSTRAINT [PK__StatusLo__3214EC07A011F5A7] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 9/14/2018 6:04:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[AccessToken] [varchar](50) NULL,
 CONSTRAINT [PK__UserDeta__1788CC4CB2584880] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Gaming] SET  READ_WRITE 
GO
