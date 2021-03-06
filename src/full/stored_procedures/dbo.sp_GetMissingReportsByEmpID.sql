USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMissingReportsByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetMissingReportsByEmpID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetMissingReportsByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetMissingReportsByEmpID]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT,
	@CURRENT_DATE DATE
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @DEPTID INT = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID),
		    @DIVID INT = (SELECT DIV_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID)

	DECLARE @weekID INT = (SELECT WEEK_ID FROM WEEK_RANGE WHERE WEEK_START = @CURRENT_DATE)
	
	DECLARE @guestAccount SMALLINT = 5

	SELECT e.EMP_ID, 
		   e.LAST_NAME, 
		   e.FIRST_NAME, 
		   e.MIDDLE_NAME, 
		   e.NICK_NAME,
		   e.ACTIVE, 
		   e.BIRTHDATE, 
		   e.IMAGE_PATH,
		   e.DATE_HIRED AS 'DT_HIRED', 
		   e.SHIFT_STATUS AS 'SHIFT', 
		   e.STATUS AS 'MARITAL_STATUS_ID',
		   e.POS_ID AS 'POSITION_ID',  
		   e.GRP_ID AS 'PERMISSION_GROUP_ID', 
		   e.DEPT_ID AS 'DEPARTMENT_ID',
		   e.DIV_ID AS 'DIVISION_ID',
		   c.EMAIL_ADDRESS, 
		   c.EMAIL_ADDRESS2, 
		   c.LOCATION, 
		   c.CEL_NO, 
		   c.LOCAL, 
		   c.HOMEPHONE, 
		   c.OTHER_PHONE, 
		   c.DT_REVIEWED,
		   p.DESCR AS 'POSITION',  
		   s.DESCR AS 'MARITAL_STATUS', 
		   pg.DESCR AS 'PERMISSION_GROUP', 
		   dp.DESCR AS 'DEPARTMENT', 
		   dv.DESCR AS 'DIVISION' 
	FROM [dbo].[EMPLOYEE] e 
	INNER JOIN [dbo].[CONTACTS] c 
		ON c.emp_id = e.emp_id 
	INNER JOIN [dbo].[POSITION] p
		ON e.POS_ID = p.POS_ID
	INNER JOIN [dbo].[STATUS] s
		ON e.STATUS = s.STATUS
	INNER JOIN [dbo].[PERMISSION_GROUP] pg
		ON e.GRP_ID = pg.GRP_ID
	INNER JOIN [dbo].[DEPARTMENT] dp
		ON e.DEPT_ID = dp.DEPT_ID
	INNER JOIN [dbo].[DIVISION] dv
		ON e.DIV_ID = dv.DIV_ID
	WHERE e.DEPT_ID = @DEPTID 
		AND e.DIV_ID = @DIVID
		and dv.DEPT_ID = @DEPTID
		AND s.STATUS_ID = 1
		AND e.ACTIVE = 1
		AND e.GRP_ID != @guestAccount -- guest account has no reports
		AND e.EMP_ID NOT IN (SELECT DISTINCT EMP_ID
							 FROM WEEKLY_REPORT_XREF wx
							 WHERE wx.WEEK_RANGE = @weekID
							 AND wx.STATUS = 3)
	ORDER BY e.LAST_NAME

END

GO
