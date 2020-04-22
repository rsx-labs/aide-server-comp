USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllNotFiledLeave]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllNotFiledLeave]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllNotFiledLeave]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllNotFiledLeave]
	@EMP_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @END_DATE DATE = GETDATE()
	DECLARE @START_DATE DATE = DATEADD(month, -2, GETDATE())
	DECLARE @dayNumber INT

	CREATE TABLE #TABLEONE(WEEK_DATE DATE, DURATION FLOAT)
	WHILE (@START_DATE <= GETDATE())
		BEGIN
			SET @dayNumber = DATEPART(DW, @START_DATE);
			IF NOT (@dayNumber = 1 OR @dayNumber = 7) 			
				INSERT INTO #TABLEONE
				VALUES(@START_DATE, 0);		
			SET @START_DATE = DATEADD(DAY, 1, @START_DATE);
		END

	INSERT INTO #TABLEONE (WEEK_DATE, DURATION)
	SELECT DISTINCT(CONVERT(DATE, DATE_ENTRY)), SUM(COUNTS) FROM ATTENDANCE 
		WHERE EMP_ID = @EMP_ID AND CONVERT(DATE, DATE_ENTRY) 
		BETWEEN CONVERT(DATE, DATEADD(month, -2, GETDATE())) AND CONVERT(DATE, GETDATE()) GROUP BY CONVERT(DATE, DATE_ENTRY)

	SELECT DISTINCT(WEEK_DATE) AS 'DATE_ENTRY', SUM(DURATION) AS 'DURATION', 
		CASE WHEN SUM(DURATION) = 0 THEN 'Full day' 
		WHEN SUM(DURATION) = 0.5 THEN 'Half day' 
		ELSE 'Completed' END AS 'COMMENT'
		FROM #TABLEONE
		GROUP BY WEEK_DATE
		HAVING SUM(DURATION) < 1  

DROP TABLE #TABLEONE
END



GO
