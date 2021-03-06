USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_getProfileByEmail]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_getProfileByEmail]
GO
/****** Object:  StoredProcedure [dbo].[sp_getProfileByEmail]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getProfileByEmail](
	-- Add the parameters for the stored procedure here
	@EMAILADDRESS varchar(max)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.EMP_ID,
		   e.WS_EMP_ID,
		   d.DEPT_ID, 
		   e.LAST_NAME, 
		   e.FIRST_NAME, 
		   e.MIDDLE_NAME,
		   e.NICK_NAME,
		   e.BIRTHDATE, 
		   e.DATE_HIRED, 
		   e.IMAGE_PATH, 
		   d.DESCR AS DEPARTMENT, 
		   dv.DESCR AS DIVISION,
		   p.DESCR AS POSITION, 
		   c.EMAIL_ADDRESS, 
		   c.EMAIL_ADDRESS2,
		   c.LOCATION,
		   c.CEL_NO, 
		   c.LOCAL, 
		   c.HOMEPHONE, 
		   c.OTHER_PHONE, 
		   c.DT_REVIEWED, 
		   pg.DESCR AS PERMISSION, 
		   pg.GRP_ID AS PERMISSION_ID,
		   s.DESCR AS CIVILSTATUS,
		   e.SHIFT_STATUS
	FROM EMPLOYEE e
	INNER JOIN CONTACTS c
		ON e.EMP_ID = c.EMP_ID
	INNER JOIN DEPARTMENT d
		ON e.DEPT_ID = d.DEPT_ID 
	INNER JOIN  DIVISION dv
		ON e.DIV_ID = dv.DIV_ID 
	INNER JOIN POSITION p
		ON e.POS_ID = p.POS_ID 
	INNER JOIN PERMISSION_GROUP pg
		ON e.GRP_ID = pg.GRP_ID 
	INNER JOIN STATUS s
		ON e.STATUS = s.STATUS 
	WHERE c.EMAIL_ADDRESS = @EMAILADDRESS 
	AND s.STATUS_ID = 1

END



GO
