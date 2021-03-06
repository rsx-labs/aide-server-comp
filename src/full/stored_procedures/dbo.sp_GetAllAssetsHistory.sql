USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAssetsHistory]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllAssetsHistory]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAssetsHistory]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllAssetsHistory]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT
AS

DECLARE @DEPT_ID INT = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID),
		@DIV_ID INT = (SELECT DIV_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID)

DECLARE @guestAccount SMALLINT = 5

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT H.ASSET_ID,
		   CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS FULL_NAME,
		   A.ASSET_DESC,
		   A.MANUFACTURER,
		   A.MODEL_NO,
		   A.SERIAL_NO,
		   A.ASSET_TAG,
		   S.DESCR AS STATUS_DESCR,
		   H.DATE_ASSIGNED
	FROM ASSETS_HISTORY H
	INNER JOIN EMPLOYEE E
	ON E.EMP_ID = H.EMP_ID 
	INNER JOIN STATUS S
	ON H.STATUS = S.STATUS
	INNER JOIN ASSETS A
	ON A.ASSET_ID = H.ASSET_ID
	WHERE S.STATUS_ID = 11
	AND E.DEPT_ID = @DEPT_ID
	AND E.DIV_ID = @DIV_ID
	AND e.GRP_ID != @guestAccount
	ORDER BY H.DATE_ASSIGNED DESC
	
END 
GO
