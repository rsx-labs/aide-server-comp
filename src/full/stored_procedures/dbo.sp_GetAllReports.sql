USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllReports]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllReports]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllReports]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetAllReports]

AS

BEGIN							
	
	SELECT REPORT_ID, OPT_ID, DESCRIPTION, [MODULE ID] as MODULE_ID , VALUE AS FILE_PATH
	from [dbo].REPORTS

END




GO
