USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComcellClockInfo]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetComcellClockInfo]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComcellClockInfo]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetComcellClockInfo]
@EMP_ID int

AS
DECLARE
		@DEPT_ID INT = (SELECT A.DEPT_ID FROM EMPLOYEE A INNER JOIN CONTACTS B
					   ON A.EMP_ID = B.EMP_ID WHERE B.EMP_ID = @EMP_ID),
		@DIV_ID INT = (SELECT A.DIV_ID FROM EMPLOYEE A INNER JOIN CONTACTS B
					   ON A.EMP_ID = B.EMP_ID WHERE B.EMP_ID = @EMP_ID)
		
BEGIN							
	
	SELECT  a.CLOCK_DAY as CLOCK_DAY, a.CLOCK_HOUR AS CLOCK_HOUR, a.CLOCK_MINUTE as CLOCK_MINUTE, a.EMP_ID AS EMP_ID,
	a.MIDDAY as MIDDAY from [dbo].[COMCELL_CLOCK] a INNER JOIN EMPLOYEE B
	ON A.EMP_ID = B.EMP_ID
	WHERE B.DEPT_ID = @DEPT_ID AND B.DIV_ID = @DIV_ID

END

GO
