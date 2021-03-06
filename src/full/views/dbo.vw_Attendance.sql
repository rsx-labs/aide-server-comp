USE [AIDE]
GO
/****** Object:  View [dbo].[vw_Attendance]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP VIEW [dbo].[vw_Attendance]
GO
/****** Object:  View [dbo].[vw_Attendance]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[vw_Attendance] AS
	
	Select attend.EMP_ID as EmployeeID,
			(emp.LAST_NAME + ', '+ emp.FIRST_NAME + ' ' + emp.MIDDLE_NAME) as EmployeeName,
			attend.DATE_ENTRY as TimeIn,
			stat.DESCR as [Status],
			attend.STATUS as StatusID,
			dbo.fn_getFiscalYear(attend.DATE_ENTRY,attend.DATE_ENTRY) as FiscalYear,
			emp.DIV_ID as DivisionID,
			div.DESCR as Division,
			emp.DEPT_ID as DepartmentID,
			div.DESCR as Department,
			emp.ACTIVE as IsActive,
			Case
				when Month(attend.DATE_ENTRY)<4 then Month(attend.DATE_ENTRY) + 12
				else Month(attend.DATE_ENTRY)
			End as [MonthID],
			Format(attend.DATE_ENTRY,'MMMM') as [Month]
			
	From ATTENDANCE attend
		inner join EMPLOYEE emp 
			on attend.EMP_ID = emp.EMP_ID
		inner join DEPARTMENT dept
			on dept.DEPT_ID = emp.DEPT_ID
		inner join DIVISION div
			on emp.DIV_ID = div.DIV_ID
		inner join [Status] stat
			on attend.STATUS = stat.STATUS and stat.STATUS_NAME = 'ATTENDANCE'









GO
