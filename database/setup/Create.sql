----------########## DATABASE CREATION ##########----------
USE [master]
GO

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'teamcity_netcore')
BEGIN
	CREATE DATABASE [teamcity_netcore]	
END
GO

----------########## USER CREATION ##########----------
USE [master]
GO

IF SUSER_ID('teamcity_netcore_user') IS NULL
BEGIN
	CREATE LOGIN [teamcity_netcore_user] WITH PASSWORD=N'G?HdcS2D8#w83)nFx', DEFAULT_DATABASE=[teamcity_netcore], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
END
GO

USE [teamcity_netcore]
GO

IF DATABASE_PRINCIPAL_ID('teamcity_netcore_user') IS NULL
BEGIN
	CREATE USER [teamcity_netcore_user] FOR LOGIN [teamcity_netcore_user] WITH DEFAULT_SCHEMA=[dbo]	
	exec sp_addrolemember 'db_owner', 'teamcity_netcore_user';
END
GO

----------########## TABLE CREATION ##########----------

USE [teamcity_netcore]

IF NOT EXISTS (SELECT TOP 1 * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dummy_table_1')
BEGIN
	CREATE TABLE [dbo].[dummy_table_1](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[first_name] [nvarchar](255) NOT NULL,
		[last_name] [nvarchar](255) NOT NULL,
		[email_address] [nvarchar](255) NOT NULL,
	 CONSTRAINT [PK_dummy_table_1] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT TOP 1 * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'dummy_table_2')
BEGIN
	CREATE TABLE [dbo].[dummy_table_2](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[dummy_table_1_id] [int] NOT NULL,
		[item] [nvarchar](255) NOT NULL,
	 CONSTRAINT [PK_dummy_table_2] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

----------########## FOREIGN KEY CREATION ##########----------

IF (OBJECT_ID('FK_dummy_table_2_dummy_table_1') IS NULL)
BEGIN
	ALTER TABLE [dbo].[dummy_table_2]  WITH CHECK ADD  CONSTRAINT [FK_dummy_table_2_dummy_table_1] FOREIGN KEY([dummy_table_1_id])
	REFERENCES [dbo].[dummy_table_1] ([id])

	ALTER TABLE [dbo].[dummy_table_2] CHECK CONSTRAINT [FK_dummy_table_2_dummy_table_1]
END
GO
