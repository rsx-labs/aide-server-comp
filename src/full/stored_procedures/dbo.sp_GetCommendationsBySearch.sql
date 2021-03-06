USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCommendationsBySearch]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetCommendationsBySearch]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCommendationsBySearch]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetCommendationsBySearch]
	@EMP_ID INT,
	@MONTH int,
	@YEAR int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 -- Insert statements for procedure here
	DECLARE @DEPT_ID VARCHAR(MAX) = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID)
	DECLARE @DIV_ID VARCHAR(MAX) = (SELECT DIV_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID)

	DECLARE @fiscalYear INT
	IF @MONTH < 4
		SET @fiscalYear	= (SELECT YEAR(FY_END) FROM FISCAL_YEAR WHERE YEAR(FY_START) = @YEAR)
	ELSE
		SET @fiscalYear = (SELECT YEAR(FY_START) FROM FISCAL_YEAR WHERE YEAR(FY_START) = @YEAR)
		
	DECLARE @firstDayMonth DATE = (SELECT DATEADD(month, @MONTH-1, DATEADD(year, @fiscalYear-1900, 0)))
	DECLARE @endDayMonth DATE = (SELECT DATEADD(day, -1, DATEADD(month, @MONTH, DATEADD(year, @fiscalYear-1900, 0))))

	SELECT COMMEND_ID, EMPLOYEE, PROJECT, SENT_BY, DATE_SENT, REASON
	FROM COMMENDATIONS c
	INNER JOIN EMPLOYEE e
	ON c.EMP_ID = e.EMP_ID 
	WHERE DEPT_ID = @DEPT_ID AND DIV_ID = @DIV_ID
	AND DATE_SENT BETWEEN @firstDayMonth AND @endDayMonth
END


GO
