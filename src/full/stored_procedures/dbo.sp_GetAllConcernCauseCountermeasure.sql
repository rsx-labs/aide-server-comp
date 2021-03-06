USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllConcernCauseCountermeasure]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllConcernCauseCountermeasure]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllConcernCauseCountermeasure]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllConcernCauseCountermeasure]
	@EMP_ID INT
AS
BEGIN
	DECLARE @DEPT_ID SMALLINT = (SELECT DEPT_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID) 
	DECLARE @DIV_ID SMALLINT = (SELECT DIV_ID FROM EMPLOYEE WHERE EMP_ID = @EMP_ID)

	BEGIN 
		SELECT DISTINCT A.[ID],
						A.[REF_ID], 
						A.[CONCERN],
						A.[CAUSE], 
						A.[COUNTERMEASURE], 
						E.FIRST_NAME AS EMP_ID, 
						STUFF((SELECT  ', ' + CAST(a.ACTREF AS VARCHAR(MAX)) 
							   FROM ACTION_REFERNCE_3CS a JOIN CONCERN_CAUSE_COUNTERMEASURE c ON (a.REF_ID = c.REF_ID) 
							   WHERE a.REF_ID = b.REF_ID
							   FOR XML PATH(''),TYPE).value('.','VARCHAR(MAX)'), 1, 2, '') AS ACT_REFERENCE, A.[DUE_DATE], A.DATE_RAISED, s.DESCR	
		FROM STATUS s, [dbo].[Concern_Cause_Countermeasure] A LEFT JOIN ACTION_REFERNCE_3CS b ON A.REF_ID = b.REF_ID, dbo.EMPLOYEE E INNER JOIN dbo.CONTACTS F ON E.EMP_ID = F.EMP_ID
		WHERE A.EMP_ID = E.EMP_ID AND s.STATUS_ID = 8 AND s.STATUS = A.STATUS 
		AND E.DEPT_ID = @DEPT_ID  
		AND E.DIV_ID = @DIV_ID
		ORDER BY A.DATE_RAISED DESC 
	END
END
	

GO
