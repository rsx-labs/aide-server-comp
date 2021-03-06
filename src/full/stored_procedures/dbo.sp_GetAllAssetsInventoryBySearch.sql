USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAssetsInventoryBySearch]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllAssetsInventoryBySearch]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAssetsInventoryBySearch]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllAssetsInventoryBySearch]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT,
	@INPUT VARCHAR(MAX),
	@PAGE VARCHAR(50)
AS

DECLARE @DEPT_ID INT = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID),
		@DIV_ID INT = (SELECT DIV_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID)

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	
	IF @PAGE = 'Personal'
		BEGIN		
			SELECT CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS FULL_NAME, 
					D.DESCR AS DEPARTMENT, 
					I.ASSET_ID,
					I.EMP_ID,
					A.ASSET_DESC, 
					A.MANUFACTURER, 
					A.MODEL_NO, 
					A.SERIAL_NO, 
					A.ASSET_TAG,
					A.DATE_PURCHASED,
					I.DATE_ASSIGNED,
					I.COMMENTS,
					I.STATUS,
					I.APPROVAL
			FROM ASSETS A
			INNER JOIN ASSETS_INVENTORY I
			ON A.ASSET_ID = I.ASSET_ID
			INNER JOIN EMPLOYEE E
			ON I.EMP_ID = E.EMP_ID
			INNER JOIN DEPARTMENT D
			ON E.DEPT_ID = D.DEPT_ID
			WHERE E.DEPT_ID = @DEPT_ID AND E.DIV_ID = @DIV_ID
			AND I.EMP_ID = @EMP_ID
			AND ((a.[ASSET_DESC] LIKE '%' + @INPUT + '%' ) OR
				  (a.[MANUFACTURER] LIKE '%' + @INPUT + '%') OR
				  (a.[MODEL_NO] LIKE '%' + @INPUT + '%') OR
				  (a.[SERIAL_NO] LIKE '%' + @INPUT + '%') OR
				  (a.[ASSET_TAG] LIKE '%' + @INPUT + '%')OR
				  (E.[FIRST_NAME] LIKE '%' + @INPUT + '%')OR
				  (E.[LAST_NAME] LIKE '%' + @INPUT + '%')OR
				  (a.[ASSET_ID] LIKE '%' + @INPUT + '%'))
		END
	ELSE IF @PAGE = 'ALL'
		BEGIN
			SELECT CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS FULL_NAME, 
					D.DESCR AS DEPARTMENT, 
					I.ASSET_ID,
					I.EMP_ID,
					A.ASSET_DESC, 
					A.MANUFACTURER, 
					A.MODEL_NO, 
					A.SERIAL_NO, 
					A.ASSET_TAG,
					A.DATE_PURCHASED,
					I.DATE_ASSIGNED,
					I.COMMENTS,
					I.STATUS,
					I.APPROVAL
			FROM ASSETS A
			INNER JOIN ASSETS_INVENTORY I
			ON A.ASSET_ID = I.ASSET_ID
			INNER JOIN EMPLOYEE E
			ON I.EMP_ID = E.EMP_ID
			INNER JOIN DEPARTMENT D
			ON E.DEPT_ID = D.DEPT_ID
			WHERE E.DEPT_ID = @DEPT_ID AND E.DIV_ID = @DIV_ID
			AND ((a.[ASSET_DESC] LIKE '%' + @INPUT + '%' ) OR
				  (a.[MANUFACTURER] LIKE '%' + @INPUT + '%') OR
				  (a.[MODEL_NO] LIKE '%' + @INPUT + '%') OR
				  (a.[SERIAL_NO] LIKE '%' + @INPUT + '%') OR
				  (a.[ASSET_TAG] LIKE '%' + @INPUT + '%')OR
				  (E.[FIRST_NAME] LIKE '%' + @INPUT + '%')OR
				  (E.[LAST_NAME] LIKE '%' + @INPUT + '%')OR
				  (a.[ASSET_ID] LIKE '%' + @INPUT + '%'))
		END
	ELSE
		BEGIN
			SELECT CONCAT(E.FIRST_NAME, ' ', E.LAST_NAME) AS FULL_NAME, 
					D.DESCR AS DEPARTMENT, 
					I.ASSET_ID,
					I.EMP_ID,
					A.ASSET_DESC, 
					A.MANUFACTURER, 
					A.MODEL_NO, 
					A.SERIAL_NO, 
					A.ASSET_TAG,
					A.DATE_PURCHASED,
					I.DATE_ASSIGNED,
					I.COMMENTS,
					I.STATUS,
					I.APPROVAL
			FROM ASSETS A
			INNER JOIN ASSETS_INVENTORY I
			ON A.ASSET_ID = I.ASSET_ID
			INNER JOIN EMPLOYEE E
			ON I.EMP_ID = E.EMP_ID
			INNER JOIN DEPARTMENT D
			ON E.DEPT_ID = D.DEPT_ID
			WHERE E.DEPT_ID = @DEPT_ID AND E.DIV_ID = @DIV_ID
			AND I.APPROVAL <> 1
			AND ((a.[ASSET_DESC] LIKE '%' + @INPUT + '%' ) OR
				  (a.[MANUFACTURER] LIKE '%' + @INPUT + '%') OR
				  (a.[MODEL_NO] LIKE '%' + @INPUT + '%') OR
				  (a.[SERIAL_NO] LIKE '%' + @INPUT + '%') OR
				  (a.[ASSET_TAG] LIKE '%' + @INPUT + '%')OR
				  (E.[FIRST_NAME] LIKE '%' + @INPUT + '%')OR
				  (E.[LAST_NAME] LIKE '%' + @INPUT + '%')OR
				  (a.[ASSET_ID] LIKE '%' + @INPUT + '%'))
		END
END
GO
