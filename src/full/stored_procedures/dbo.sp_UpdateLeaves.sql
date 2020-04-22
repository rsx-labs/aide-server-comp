USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLeaves]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_UpdateLeaves]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLeaves]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateLeaves] 
	@EMP_ID INT,
	@LEAVE_TYPE INT,
	@LEAVE_DATE DATETIME,
	@DATE_ENTRY DATETIME
AS
	DECLARE @UPDATED_DATE DATETIME = (SELECT DATEADD(HOUR, 4, @DATE_ENTRY))

	UPDATE ATTENDANCE SET 
	DATE_ENTRY = @UPDATED_DATE 
	WHERE EMP_ID = @EMP_ID 
	AND STATUS = @LEAVE_TYPE 
	AND DATE_ENTRY = @LEAVE_DATE 






GO
