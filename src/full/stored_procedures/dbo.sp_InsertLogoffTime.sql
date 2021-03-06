USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLogoffTime]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertLogoffTime]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLogoffTime]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertLogoffTime] 
	@EMP_ID INT,
	@LOGOFF_TIME DATETIME
AS

BEGIN
	DECLARE @COUNT AS INT = (SELECT COUNT(*) FROM ATTENDANCE 
							 WHERE EMP_ID = @EMP_ID 
							 AND CONVERT(DATE, DATE_ENTRY) = CONVERT(DATE, GETDATE()) AND LOGOFF_TIME != NULL
							 AND STATUS IN (1,2,11))

	IF @COUNT = 0 
		BEGIN
			UPDATE ATTENDANCE SET LOGOFF_FLG = 1, LOGOFF_TIME = @LOGOFF_TIME 
			FROM ATTENDANCE 
			WHERE EMP_ID = @EMP_ID 
			AND STATUS IN (1,2,11)
			AND CONVERT(DATE, DATE_ENTRY) = CONVERT(DATE, GETDATE()) 
		END
END



GO
