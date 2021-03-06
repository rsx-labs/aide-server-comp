USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertWeekRange]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertWeekRange]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertWeekRange]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertWeekRange]
	@CURRENT_DATE DATE
AS
BEGIN
	DECLARE @currentYear INT = YEAR(@CURRENT_DATE) -- Get the year of current date
	DECLARE @year INT
	DECLARE @nextYear INT
	DECLARE @day INT
	DECLARE @dayName VARCHAR(10)

	DECLARE @fiscalYear VARCHAR(10)
	DECLARE @month INT

	DECLARE @startOfWeek DATE,
			@endOfWeek DATE
 
	 SET @year = @currentYear - 1
	 SET @nextYear = @currentYear + 1

	 WHILE @year <= @nextYear
		BEGIN 
			-- Verify if week numbers are already saved in database
			IF NOT EXISTS (SELECT * FROM WEEK_RANGE WHERE YEAR = @year)
				BEGIN
					-- 1st day of the year
					DECLARE @startDate DATE = CONVERT(VARCHAR(4), @year) + '-01-01'
					DECLARE @weekNo INT = 1
					DECLARE @numberOfWeeks INT = 52

					-- Set the week range of week number
					SET @startOfWeek = DATEADD(dd, 0 - (@@DATEFIRST + DATEPART(dw, @startDate)) % 7, @startDate) -- Saturday
					SET @endOfWeek =  DATEADD(dd, 6 - (@@DATEFIRST + DATEPART(dw, @startDate)) % 7, @startDate)	 -- Friday

					-- Get day name and date number
					SET @dayName = DATENAME(dw, @startOfWeek)
					SET @day = DAY(@startOfWeek)

					WHILE (@weekNo <= @numberOfWeeks)
						BEGIN 
							IF YEAR(@startOfWeek) = @year OR (YEAR(@startOfWeek) != @year AND  @dayName = 'SATURDAY' AND @day >= 29)
								BEGIN
									-- Get MONTH
									IF MONTH(@startOfWeek) != MONTH(@endOfWeek)
										BEGIN
											DECLARE @endDayOfMonth DATE = (SELECT DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, @startOfWeek) + 1, 0)))

											IF DATENAME(dw, @endDayOfMonth) = 'SATURDAY' OR DATENAME(dw, @endDayOfMonth) = 'SUNDAY' OR DATENAME(dw, @endDayOfMonth) = 'MONDAY'
												SET @month = MONTH(@endOfWeek)
											ELSE
												SET @month = MONTH(@startOfWeek)
										END
									ELSE 
										BEGIN
											SET @month = MONTH(@startOfWeek)
										END

									-- Get Fiscal Year
									IF @month < 4
										SET @fiscalYear = CAST((@year - 1) AS VARCHAR) + '-' + CAST(@year AS VARCHAR)
									ELSE
										SET @fiscalYear = CAST(@year AS VARCHAR) + '-' + CAST((@year + 1) AS VARCHAR) 

									-- Insert into table
									INSERT INTO WEEK_RANGE 
									SELECT @startOfWeek, @endOfWeek, @weekNo, @month, @year, @fiscalYear

									SET @weekNo += 1	
								END
							
							-- Add one week 
							SET @startOfWeek = (SELECT DATEADD(WEEK, 1, @startOfWeek))
							SET @endOfWeek = (SELECT DATEADD(WEEK, 1, @endOfWeek))
		
							-- Additional week for the years that have 53 weeks 
							IF @weekNo > @numberOfWeeks AND YEAR(@startOfWeek) = @year AND DATENAME(d, @startOfWeek) <= 28 AND DATENAME(M, @startOfWeek) = 'December'
								BEGIN
									SET @numberOfWeeks += 1	
								END 
						END
				END
			ELSE
				SET @year += 1
		END
END

GO
