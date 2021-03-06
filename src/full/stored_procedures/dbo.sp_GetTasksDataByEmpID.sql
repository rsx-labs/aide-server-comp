USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTasksDataByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetTasksDataByEmpID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTasksDataByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetTasksDataByEmpID]
@WK_RANGE_ID INT,
@EMP_ID INT

AS
BEGIN

	DECLARE @weekStart DATE = (SELECT WEEK_START FROM WEEK_RANGE WHERE WEEK_ID = @WK_RANGE_ID)
	DECLARE @weekEnd DATE = (SELECT WEEK_END FROM WEEK_RANGE WHERE WEEK_ID = @WK_RANGE_ID)
	DECLARE @count INT
	DECLARE @dateStarted DATE
	DECLARE @dateCompleted DATE

	DECLARE @tempWeeklyReport TABLE (WR_TASK_ID INT,
								     WR_PROJ_ID INT,
									 WR_PROJ_CODE INT, 
									 WR_REWORK SMALLINT, 
									 WR_REF_ID VARCHAR(20), 
									 WR_SUBJECT VARCHAR(MAX), 
									 WR_SEVERITY SMALLINT, 
									 WR_INC_TYPE SMALLINT, 
									 WR_EMP_ID INT,
									 WR_PHASE SMALLINT, 
									 WR_STATUS SMALLINT, 
									 WR_DATE_STARTED DATE, 
									 WR_DATE_TARGET DATE, 
									 WR_DATE_FINISHED DATE, 
									 WR_EFFORT_EST FLOAT, 
									 WR_ACT_EFFORT_WK FLOAT,
									 WR_ACT_EFFORT FLOAT,
									 WR_COMMENTS VARCHAR(MAX))

	-- INSERT TASKS DATA
	INSERT INTO @tempWeeklyReport (WR_TASK_ID, WR_PROJ_ID, WR_PROJ_CODE, 
								   WR_REWORK, WR_REF_ID, WR_SUBJECT, 
								   WR_SEVERITY, WR_INC_TYPE, WR_EMP_ID, WR_PHASE, WR_STATUS,
								   WR_DATE_STARTED, WR_DATE_TARGET, WR_DATE_FINISHED,
								   WR_EFFORT_EST, WR_ACT_EFFORT_WK, WR_ACT_EFFORT,
								   WR_COMMENTS)
	SELECT TASK_ID, PROJ_ID, PROJECT_CODE, REWORK, REF_ID, INC_DESCR,
		   SEVERITY, INC_TYPE, EMP_ID, PHASE, STATUS,
		   DATE_STARTED, TARGET_DATE, COMPLTD_DATE,
		   EFFORT_EST, ACT_EFFORT_WK, ACT_EFFORT, COMMENTS
	FROM TASKS 
	WHERE EMP_ID = @EMP_ID 
	AND ((STATUS NOT IN (3, 4)) 
	OR (STATUS IN (3, 4) AND COMPLTD_DATE BETWEEN @weekStart and @weekEnd))

	---- INSERT HOLIDAY DATA
	--SET @count = (SELECT COUNT(DATE_ENTRY) FROM ATTENDANCE 
	--			  WHERE EMP_ID = @EMP_ID 
	--			  AND STATUS = 7
	--			  AND CONVERT(VARCHAR(10), DATE_ENTRY, 120) BETWEEN @weekStart and @weekEnd ) 

	--IF @count > 0
	--	BEGIN
	--		SET @dateStarted = (SELECT TOP 1 CONVERT(VARCHAR(10), DATE_ENTRY, 120) FROM ATTENDANCE 
	--							WHERE EMP_ID = @EMP_ID 
	--							AND STATUS = 7
	--							AND CONVERT(VARCHAR(10), DATE_ENTRY, 120) BETWEEN @weekStart and @weekEnd)
							 
	--		SET @dateCompleted = (SELECT TOP 1 CONVERT(VARCHAR(10), DATE_ENTRY, 120) FROM ATTENDANCE 
	--							  WHERE EMP_ID = @EMP_ID 
	--							  AND STATUS = 7
	--							  AND CONVERT(VARCHAR(10), DATE_ENTRY, 120) BETWEEN @weekStart and @weekEnd
	--							  ORDER BY DATE_ENTRY DESC) 

	--		INSERT INTO @tempWeeklyReport (WR_PROJ_ID, WR_PROJ_CODE, 
	--									   WR_SUBJECT, WR_STATUS,
	--									   WR_DATE_STARTED, WR_DATE_FINISHED,
	--									   WR_ACT_EFFORT_WK, WR_ACT_EFFORT, WR_COMMENTS)
	--	END

	--INSERT INTO @tempWeeklyReport (WR_PROJ_ID, WR_PROJ_CODE, 
	--							   WR_SUBJECT, WR_STATUS,
	--							   WR_DATE_STARTED, WR_DATE_FINISHED,
	--							   WR_ACT_EFFORT_WK, WR_ACT_EFFORT,
	--							   WR_COMMENTS)

	SELECT * FROM @tempWeeklyReport
END
 



GO
