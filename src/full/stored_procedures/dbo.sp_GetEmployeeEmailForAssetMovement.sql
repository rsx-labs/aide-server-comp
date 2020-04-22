USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeEmailForAssetMovement]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetEmployeeEmailForAssetMovement]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetEmployeeEmailForAssetMovement]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetEmployeeEmailForAssetMovement]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	DECLARE @DEPTID INT = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID),
		    @DIVID INT = (SELECT DIV_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID),
			@MGREMAILSTRING VARCHAR(MAX), 
			@EMAILSTRING VARCHAR(MAX),
			@EMPNAMESTRING VARCHAR(MAX)


	SELECT @MGREMAILSTRING = COALESCE(@MGREMAILSTRING + ',', '') + c.EMAIL_ADDRESS
			FROM EMPLOYEE E INNER JOIN CONTACTS C 
			ON E.EMP_ID = C.EMP_ID
			WHERE E.DIV_ID = @DIVID AND E.DEPT_ID = @DEPTID AND E.ACTIVE = 1 AND E.GRP_ID = 1

	SELECT @EMAILSTRING = COALESCE(@EMAILSTRING + ',', '') + c.EMAIL_ADDRESS			
			FROM EMPLOYEE E INNER JOIN CONTACTS C 
			ON E.EMP_ID = C.EMP_ID
			WHERE E.DIV_ID = @DIVID AND E.DEPT_ID = @DEPTID AND E.ACTIVE = 1 
			AND E.EMP_ID = @EMP_ID

	SELECT @EMPNAMESTRING = COALESCE(@EMPNAMESTRING + ',', '') + c.EMAIL_ADDRESS
			FROM EMPLOYEE E INNER JOIN CONTACTS C 
			ON E.EMP_ID = C.EMP_ID
			WHERE E.DIV_ID = @DIVID AND E.DEPT_ID = @DEPTID AND E.ACTIVE = 1 AND E.GRP_ID = 4
			
	SELECT @EMPNAMESTRING as 'EMPLOYEE_NAME', @EMAILSTRING as 'EMAIL_ADDRESS', @MGREMAILSTRING as 'MANAGER_EMAIL' 		

END

GO
