USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAssetsInventoryByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllAssetsInventoryByEmpID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAssetsInventoryByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllAssetsInventoryByEmpID]
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
	
	SELECT CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS FULL_NAME, 
			D.DESCR AS DEPARTMENT, 
			I.ASSET_ID,
			I.EMP_ID,
			A.PREVIOUS_ID,
			CONCAT(F.FIRST_NAME, ' ', F.LAST_NAME) AS PREVIOUS_OWNER,
			A.ASSET_DESC, 
			A.OTHER_INFO,
			A.MANUFACTURER, 
			A.MODEL_NO, 
			A.SERIAL_NO, 
			A.ASSET_TAG,
			A.DATE_PURCHASED,
			I.DATE_ASSIGNED,
			I.COMMENTS,
			I.APPROVAL,
			I.STATUS
	FROM ASSETS A
	INNER JOIN ASSETS_INVENTORY I
	ON A.ASSET_ID = I.ASSET_ID
	INNER JOIN EMPLOYEE E
	ON I.EMP_ID = E.EMP_ID --AND A.PREVIOUS_ID = E.EMP_ID
	INNER JOIN DEPARTMENT D
	ON E.DEPT_ID = D.DEPT_ID
	LEFT JOIN EMPLOYEE F
	ON A.PREVIOUS_ID = F.EMP_ID
	WHERE E.DEPT_ID = @DEPT_ID 
	AND E.DIV_ID = @DIV_ID
	AND E.GRP_ID != @guestAccount
END

GO
