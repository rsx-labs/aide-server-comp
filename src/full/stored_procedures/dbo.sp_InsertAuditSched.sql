USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAuditSched]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertAuditSched]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAuditSched]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertAuditSched]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT,
	@PERIOD_START DATE,
	@PERIOD_END DATE,
	@DAILY VARCHAR(15),
	@WEEKLY VARCHAR(15),
	@MONTHLY VARCHAR(15),
	@YEAR INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @FIRSTMONTH DATE, @LASTMONTH DATE
	DECLARE @FY_WEEK INT
    -- Insert statements for procedure here
	--SET @FIRSTMONTH = CAST('4/1/' + Cast(@YEAR as varchar) AS DATE)
	--SET @LASTMONTH = CAST('3/31/' + Cast(@YEAR + 1 as varchar) AS DATE)

	SET @FIRSTMONTH = (SELECT FY_START FROM FISCAL_YEAR WHERE YEAR(FY_START) = @YEAR)
	SET @LASTMONTH = (SELECT FY_END FROM FISCAL_YEAR WHERE YEAR(FY_START) = @YEAR)

	SELECT @FY_WEEK = dbo.FiscalYearMonth(@PERIOD_START)
	DECLARE @MONTHLYRECORDS INT 
	DECLARE @GETMONTHLYEMP INT
	DECLARE @QUARTERLYRECORDS INT 

	DECLARE @DAILYCHECKFY_WEEK INT 
	DECLARE @WEEKLYCHECKFY_WEEK INT 

	SELECT @MONTHLYRECORDS = COUNT(*) FROM WORKPLACE_AUDIT_MONTHLY WHERE MONTH(WEEKDATE) = MONTH(@PERIOD_START) AND YEAR(WEEKDATE)= YEAR(@PERIOD_START)
	SELECT @GETMONTHLYEMP =EMP_ID FROM WORKPLACE_AUDIT_MONTHLY WHERE MONTH(WEEKDATE) = MONTH(@PERIOD_START) AND YEAR(WEEKDATE)= YEAR(@PERIOD_START)
	--SELECT @QUARTERLYRECORDS = COUNT(*) FROM WORKPLACE_AUDIT_QUARTERLY WHERE YEAR(WEEKDATE)= YEAR(@PERIOD_START)
	SELECT @FY_WEEK
	SELECT @DAILYCHECKFY_WEEK = COUNT(*)	FROM WORKPLACE_AUDIT_DAILY WHERE WEEKDATE = @PERIOD_START
	SELECT @WEEKLYCHECKFY_WEEK = COUNT(*)	FROM WORKPLACE_AUDIT_WEEKLY WHERE WEEKDATE = @PERIOD_START


	IF @GETMONTHLYEMP <> 0
	BEGIN
		SET @MONTHLY = @GETMONTHLYEMP
	END
	
	IF @DAILYCHECKFY_WEEK = 0
	BEGIN
	INSERT INTO WORKPLACE_AUDIT_SCHEDULE
	VALUES(@EMP_ID,@FY_WEEK, @PERIOD_START, @PERIOD_END, @DAILY, @WEEKLY, @MONTHLY, @FIRSTMONTH, @LASTMONTH)

	---INSERT DAILY 1 WEEK
	DECLARE @CNTDAY INT = 0

	WHILE @CNTDAY < 5
	BEGIN
				INSERT INTO WORKPLACE_AUDIT_DAILY VALUES (1, @DAILY,@FY_WEEK, NULL,0, DATEADD(DAY, @CNTDAY, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_DAILY VALUES (3, @DAILY,@FY_WEEK, NULL,0, DATEADD(DAY, @CNTDAY, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_DAILY VALUES (5, @DAILY,@FY_WEEK, NULL,0, DATEADD(DAY, @CNTDAY, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_DAILY VALUES (7, @DAILY,@FY_WEEK, NULL,0, DATEADD(DAY, @CNTDAY, @PERIOD_START))
		SET @CNTDAY = @CNTDAY + 1
	END
	END
		---INSERT WEEKLY 1 WEEK

	IF @WEEKLYCHECKFY_WEEK = 0
	BEGIN
	BEGIN
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (9,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (10,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (11,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (12,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (13,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (14,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				--INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (15,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (16,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				--INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (17,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (18,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (19,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_WEEKLY VALUES (20,	@WEEKLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
		
	END
	END
		---INSERT MONTHLY 1 MONTH

	IF @MONTHLYRECORDS = 0
	BEGIN
				INSERT INTO WORKPLACE_AUDIT_MONTHLY VALUES (23,	@MONTHLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_MONTHLY VALUES (24,	@MONTHLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_MONTHLY VALUES (25,	@MONTHLY,@FY_WEEK, NULL,0, DATEADD(DAY, 1, @PERIOD_START))
		
	END
		---INSERT QUARTERLY
	
	IF MONTH(@PERIOD_START) BETWEEN 1 AND 3
	BEGIN
	SELECT @QUARTERLYRECORDS = COUNT(*) FROM WORKPLACE_AUDIT_QUARTERLY WHERE MONTH(WEEKDATE) BETWEEN 1 AND 3 and YEAR(weekdate) = YEAR(@PERIOD_START)
		IF @QUARTERLYRECORDS = 0
			BEGIN
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (29,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (30,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (31,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (32,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))

			END
	END

	IF MONTH(@PERIOD_START) BETWEEN 4 AND 6
	BEGIN
		SELECT @QUARTERLYRECORDS = COUNT(*) FROM WORKPLACE_AUDIT_QUARTERLY WHERE MONTH(WEEKDATE) BETWEEN 4 AND 6 and YEAR(weekdate) = YEAR(@PERIOD_START)
		IF @QUARTERLYRECORDS = 0
			BEGIN
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (29,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (30,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (31,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (32,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))

			END
	END
	IF MONTH(@PERIOD_START) BETWEEN 7 AND 9
	BEGIN
		SELECT @QUARTERLYRECORDS = COUNT(*) FROM WORKPLACE_AUDIT_QUARTERLY WHERE MONTH(WEEKDATE)  BETWEEN 7 AND 9  and YEAR(weekdate) = YEAR(@PERIOD_START)
		IF @QUARTERLYRECORDS = 0
			BEGIN
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (29,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (30,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (31,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (32,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))

			END
	END
	IF MONTH(@PERIOD_START) BETWEEN 10 AND 12
	BEGIN
		SELECT @QUARTERLYRECORDS = COUNT(*) FROM WORKPLACE_AUDIT_QUARTERLY WHERE MONTH(WEEKDATE)  BETWEEN 10 AND 12  and YEAR(weekdate) = YEAR(@PERIOD_START)
		IF @QUARTERLYRECORDS = 0
			BEGIN
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (29,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (30,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (31,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))
				INSERT INTO WORKPLACE_AUDIT_QUARTERLY VALUES (32,	@EMP_ID,@FY_WEEK, NULL,0, DATEADD(DAY, 0, @PERIOD_START))

			END
	END
	
	
END


GO
