USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_PROJECT_SelectAll]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_PROJECT_SelectAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_PROJECT_SelectAll]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PROJECT_SelectAll]
AS

	SELECT 
		[PROJ_ID], [PROJ_CD], [PROJ_NAME], [CATEGORY], [BILLABILITY]
	FROM [dbo].[PROJECT]




GO
