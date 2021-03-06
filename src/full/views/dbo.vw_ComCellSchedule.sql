USE [AIDE]
GO
/****** Object:  View [dbo].[vw_ComCellSchedule]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP VIEW [dbo].[vw_ComCellSchedule]
GO
/****** Object:  View [dbo].[vw_ComCellSchedule]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





	CREATE VIEW [dbo].[vw_ComCellSchedule] AS
	
	Select comcel.COMCELL_ID as ComCellID,
			comcel.EMP_ID as CreatedByID,
			comcel.MONTH as [Month],
			(facilitator.LAST_NAME + ', '+ facilitator.FIRST_NAME + ' ' + facilitator.MIDDLE_NAME) as Facilitator,
			(mtaker.LAST_NAME + ', '+ mtaker.FIRST_NAME + ' ' + mtaker.MIDDLE_NAME) as MinuteTaker,
			
			emp.DIV_ID as DivisionID,
			div.DESCR as Division,
			emp.DEPT_ID as DepartmentID,
			div.DESCR as Department,
			emp.ACTIVE as IsActive,
			Case
				when DATEPART(MM,comcel.[MONTH] + ' 01 2000') < 4 then DATEPART(MM,comcel.[MONTH] + ' 01 2000') + 12
				else DATEPART(MM,comcel.[MONTH] + ' 01 2000')
			End as MonthID,
			dbo.fn_getFiscalYear(comcel.FY_START, comcel.FY_END) as FiscalYear
	From COMCELL_MEETING comcel
		inner join EMPLOYEE emp 
			on comcel.EMP_ID = emp.EMP_ID
		inner join EMPLOYEE facilitator 
			on comcel.FACILITATOR = facilitator.EMP_ID
		inner join EMPLOYEE mtaker 
			on comcel.MINUTES_TAKER = mtaker.EMP_ID
		inner join DEPARTMENT dept
			on dept.DEPT_ID = emp.DEPT_ID
		inner join DIVISION div
			on emp.DIV_ID = div.DIV_ID







GO
