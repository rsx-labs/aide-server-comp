USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_getQuarterlyAuditor]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_getQuarterlyAuditor]
GO
/****** Object:  StoredProcedure [dbo].[sp_getQuarterlyAuditor]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getQuarterlyAuditor]
       -- Add the parameters for the stored procedure here
		@EMP_ID INT,
		@date INT
AS
BEGIN
	DECLARE @DATEVALUE int  = @date
	DECLARE @Fdate int  
	DECLARE @Ldate int  

	CREATE TABLE #SummaryQUARTERLYAuditor(WEEKDAYS nvarchar(30), NICKNAME nvarchar(30), EMP_ID int,WEEKDATE NVARCHAR(50) ,FY_WEEK INT, DT_CHECK_FLG INT, WEEKDATESCHED  NVARCHAR(20),DATE_CHECKED NVARCHAR(20))


DECLARE @GETPERDATESTRING NVARCHAR(20)
DECLARE @SETdatechecked NVARCHAR(20)

DECLARE @COUNT INT=1
WHILE @COUNT < 12
	
	BEGIN
	set @DATEVALUE = @date
	if @COUNT = 1
	begin 
		set @DATEVALUE = @DATEVALUE
	end
	else if @COUNT = 2
	begin 
		set @DATEVALUE = @DATEVALUE
	end
	else if @COUNT = 3
	begin
		set @DATEVALUE = @DATEVALUE
	end
	else
		begin
		set @DATEVALUE = @DATEVALUE - 1
		end

	insert into #SummaryQUARTERLYAuditor
			SELECT distinct CONCAT(DATENAME(MONTH, w.weekdate),' - ',DATENAME(MONTH, DATEADD(MONTH,2,w.weekdate) ))as MonthName, 
						case	when @COUNT IN (4,5,6) then 'Q1'
								when @COUNT	IN (7,8,9) then 'Q2'
								when @COUNT	IN (10,11,12) then 'Q3'
								when @COUNT	IN (1,2,3) then'Q4' END , 
						e.emp_id,
						CONCAT(w.weekdate,' - ',DATEADD(MONTH,2,w.weekdate)),  
						w.fy_week, 
						(CASE WHEN (SELECT  COUNT(*) FROM WORKPLACE_AUDIT_QUARTERLY WW WHERE WW.DT_CHECK_FLG = 0 AND WW.WEEKDATE = W.WEEKDATE ) = 0 THEN 1 
							ELSE 0 END) AS DT_CHECK_FLG,
						w.weekdate,
						w.DT_CHECKED
			FROM WORKPLACE_AUDIT_SCHEDULE WAS 
					INNER JOIN WORKPLACE_AUDIT_QUARTERLY w 
							ON WAS.FY_WEEK = w.FY_WEEK
					INNER JOIN EMPLOYEE E 
							ON w.EMP_ID = E.EMP_ID 
			WHERE year(WAS.PERIOD_START) = @DATEVALUE 
					and MONTH(w.weekdate)  =  @COUNT 
					
				
	SET @COUNT = @COUNT + 1; 
	END
	set @Fdate = @date - 1
	set @Ldate = @date

SELECT * FROM #SummaryQUARTERLYAuditor w where convert(date,w.WEEKDATESCHED) between convert(date,concat(@Fdate  ,'-','04','-','01')) and convert(date,concat(@Ldate,'-','03','-','31'))  ORDER BY NICKNAME ASC
END


GO
