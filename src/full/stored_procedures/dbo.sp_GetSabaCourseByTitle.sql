USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSabaCourseByTitle]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetSabaCourseByTitle]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSabaCourseByTitle]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetSabaCourseByTitle] 
	
	@EMP_ID INT,
	@MESSAGE VARCHAR(MAX)
	
AS
DECLARE 

	@DEPT_ID INT = (SELECT A.DEPT_ID FROM EMPLOYEE A INNER JOIN CONTACTS B
					   ON A.EMP_ID = B.EMP_ID WHERE B.EMP_ID = @EMP_ID),
	@DIV_ID INT = (SELECT A.DIV_ID FROM EMPLOYEE A INNER JOIN CONTACTS B
					   ON A.EMP_ID = B.EMP_ID WHERE B.EMP_ID = @EMP_ID)

BEGIN

	SELECT  a.SABA_ID as SABA_ID, a.EMP_ID AS EMP_ID, a.TITLE as TITLE, a.END_DATE AS END_DATE 
	from [dbo].[SABA_COURSES] a INNER JOIN EMPLOYEE B
	ON A.EMP_ID = B.EMP_ID
	WHERE B.DEPT_ID = @DEPT_ID AND B.DIV_ID = @DIV_ID
	AND a.TITLE LIKE '%' + @MESSAGE + '%'
	ORDER BY A.END_DATE DESC

END

GO
