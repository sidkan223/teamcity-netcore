USE [teamcity_netcore]
GO

IF NOT EXISTS (SELECT TOP 1 * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'dummy_table_2' AND COLUMN_NAME = 'item_added_date')
BEGIN
	ALTER TABLE [dbo].[dummy_table_2]
	ADD [item_added_date] [datetime] NULL
END
GO
