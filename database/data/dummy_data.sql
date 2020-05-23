USE [teamcity_netcore]
GO

SET IDENTITY_INSERT [dbo].[dummy_table_1] ON
IF NOT EXISTS (SELECT TOP 1 * FROM [dbo].[dummy_table_1] WHERE [email_address] = 'System@Dummy')
BEGIN
INSERT INTO [dbo].[dummy_table_1] ([id], [first_name], [last_name], [email_address])
	VALUES (1, 'System', 'Dummy', 'System@Dummy')
END
SET IDENTITY_INSERT [dbo].[dummy_table_1] OFF
GO

DECLARE @dummyTable1Id AS INT
SELECT @dummyTable1Id = [id]
FROM [dbo].[dummy_table_1]
WHERE [email_address] = 'System@Dummy'

IF NOT EXISTS (SELECT TOP 1 * FROM [dbo].[dummy_table_2] WHERE [dummy_table_1_id] = @userId)
BEGIN
	INSERT INTO [dbo].[dummy_table_2] ([dummy_table_1_id], [item])
	VALUES (@dummyTable1Id, 'Dummy item')
END
GO
