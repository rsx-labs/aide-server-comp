USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateWeeklyReportXRef]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_UpdateWeeklyReportXRef]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateWeeklyReportXRef]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateWeeklyReportXRef] 
			@WEEK_RANGE INT,
			@EMP_ID INT,
			@STATUS INT,
			@DATE_SUBMITTED DATE
AS

SET NOCOUNT ON

UPDATE WEEKLY_REPORT_XREF 
SET STATUS = @STATUS
WHERE EMP_ID = @EMP_ID
AND WEEK_RANGE = @WEEK_RANGE
AND STATUS = 1

UPDATE  WEEKLY_REPORT_XREF 
SET DATE_SUBMITTED = @DATE_SUBMITTED
WHERE EMP_ID = @EMP_ID
AND WEEK_RANGE = @WEEK_RANGE
AND STATUS != 1



GO
