USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBirthdayListAll]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetBirthdayListAll]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBirthdayListAll]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetBirthdayListAll]
	@EMAIL VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @DEPTID INT = (SELECT DEPT_ID FROM EMPLOYEE e, CONTACTS c WHERE e.EMP_ID = c.EMP_ID AND c.EMAIL_ADDRESS = @EMAIL),
			@DIVID INT = (SELECT DIV_ID FROM EMPLOYEE e, CONTACTS c WHERE e.EMP_ID = c.EMP_ID AND c.EMAIL_ADDRESS = @EMAIL)
	
	DECLARE @guestAccount SMALLINT = 5

	SELECT FIRST_NAME, LAST_NAME, BIRTHDATE, e.EMP_ID, IMAGE_PATH
	FROM EMPLOYEE e
	INNER JOIN CONTACTS c 
	ON e.EMP_ID = c.EMP_ID 
	WHERE DEPT_ID = @DEPTID
	AND DIV_ID = @DIVID
	AND ACTIVE = 1
	AND GRP_ID != @guestAccount -- guestAccount cannot be retrieved
	ORDER BY MONTH(BIRTHDATE), DAY(BIRTHDATE) ASC
END


GO
