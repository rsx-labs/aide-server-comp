USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_Status_SelectByPrimaryKey]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_Status_SelectByPrimaryKey]
GO
/****** Object:  StoredProcedure [dbo].[sp_Status_SelectByPrimaryKey]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Status_SelectByPrimaryKey]
@STATUS_ID smallint
AS

	SELECT 
		[STATUS_ID], [STATUS_NAME], [DESCR], [STATUS]
	FROM [dbo].[STATUS]
	WHERE 
		STATUS_ID = @STATUS_ID
	ORDER BY DESCR ASC

GO
