USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_getAuditQuestion]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_getAuditQuestion]
GO
/****** Object:  StoredProcedure [dbo].[sp_getAuditQuestion]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getAuditQuestion]
       -- Add the parameters for the stored procedure here
       @EMP_ID INT,
       @QUESTION_GROUP nvarchar(1)
AS
BEGIN

       SET NOCOUNT ON;

    IF @QUESTION_GROUP = '1'
	BEGIN
	  SELECT  WAD.EMP_ID, E.NICK_NAME, WAQ.AUDIT_QUESTIONS, WAQ.AUDIT_QUESTIONS_GROUP, WAD.FY_WEEK, convert(nvarchar(10),WAD.DT_CHECKED) AS DT_CHECKED ,
		  WAO.OWNER, WAQ.AUDIT_QUESTIONS_GROUP, WAD.DT_CHECK_FLG, wad.AUDIT_QUESTIONS_ID, CONVERT(NVARCHAR,Wad.WEEKDATE) AS WEEKDATE , WAD.AUDIT_DAILY_ID AS AUDIT_ID
			FROM WORKPLACE_AUDIT_QUESTIONS WAQ 
			INNER JOIN WORKPLACE_AUDIT_DAILY WAD 
				ON WAQ.AUDIT_QUESTIONS_ID = WAD.AUDIT_QUESTIONS_ID 
			INNER JOIN EMPLOYEE E 
				ON E.EMP_ID = WAD.EMP_ID
			INNER JOIN WORKPLACE_AUDIT_OWNER WAO 
				ON WAD.AUDIT_QUESTIONS_ID = WAO.AuditQuestionID
			WHERE WAQ.AUDIT_QUESTIONS_GROUP = 1 order by WEEKDATE asc
	END
	ELSE IF @QUESTION_GROUP = '2'
	BEGIN
	  SELECT  WAD.EMP_ID, E.NICK_NAME, WAQ.AUDIT_QUESTIONS, WAQ.AUDIT_QUESTIONS_GROUP, WAD.FY_WEEK, convert(nvarchar(10),WAD.DT_CHECKED) AS DT_CHECKED ,
		  WAO.OWNER, WAQ.AUDIT_QUESTIONS_GROUP, WAD.DT_CHECK_FLG, wad.AUDIT_QUESTIONS_ID, CONVERT(NVARCHAR,Wad.WEEKDATE) AS WEEKDATE , WAD.AUDIT_WEEKLY_ID AS AUDIT_ID
			FROM WORKPLACE_AUDIT_QUESTIONS WAQ 
			INNER JOIN WORKPLACE_AUDIT_WEEKLY WAD 
				ON WAQ.AUDIT_QUESTIONS_ID = WAD.AUDIT_QUESTIONS_ID 
			INNER JOIN EMPLOYEE E 
				ON E.EMP_ID = WAD.EMP_ID
			INNER JOIN WORKPLACE_AUDIT_OWNER WAO 
				ON WAD.AUDIT_QUESTIONS_ID = WAO.AuditQuestionID
			WHERE WAQ.AUDIT_QUESTIONS_GROUP = 2 order by WEEKDATE asc
	END
	ELSE IF @QUESTION_GROUP = '3'
	BEGIN
	  SELECT  WAD.EMP_ID, E.NICK_NAME, WAQ.AUDIT_QUESTIONS, WAQ.AUDIT_QUESTIONS_GROUP, WAD.FY_WEEK, convert(nvarchar(10),WAD.DT_CHECKED) AS DT_CHECKED ,
		  WAO.OWNER, WAQ.AUDIT_QUESTIONS_GROUP, WAD.DT_CHECK_FLG, wad.AUDIT_QUESTIONS_ID, CONVERT(NVARCHAR,Wad.WEEKDATE) AS WEEKDATE , WAD.AUDIT_MONTHLY_ID AS AUDIT_ID
			FROM WORKPLACE_AUDIT_QUESTIONS WAQ 
			INNER JOIN WORKPLACE_AUDIT_MONTHLY WAD 
				ON WAQ.AUDIT_QUESTIONS_ID = WAD.AUDIT_QUESTIONS_ID 
			INNER JOIN EMPLOYEE E 
				ON E.EMP_ID = WAD.EMP_ID
			INNER JOIN WORKPLACE_AUDIT_OWNER WAO 
				ON WAD.AUDIT_QUESTIONS_ID = WAO.AuditQuestionID
			WHERE WAQ.AUDIT_QUESTIONS_GROUP = '3' order by WEEKDATE asc
	END 
	ELSE IF @QUESTION_GROUP = '4'
	BEGIN
	  SELECT  WAD.EMP_ID, E.NICK_NAME, WAQ.AUDIT_QUESTIONS, WAQ.AUDIT_QUESTIONS_GROUP, WAD.FY_WEEK, convert(nvarchar(10),WAD.DT_CHECKED) AS DT_CHECKED ,
		  WAO.OWNER, WAQ.AUDIT_QUESTIONS_GROUP, WAD.DT_CHECK_FLG, wad.AUDIT_QUESTIONS_ID, CONVERT(NVARCHAR,Wad.WEEKDATE) AS WEEKDATE , WAD.AUDIT_QUARTERLY_ID AS AUDIT_ID
			FROM WORKPLACE_AUDIT_QUESTIONS WAQ 
			INNER JOIN WORKPLACE_AUDIT_QUARTERLY WAD 
				ON WAQ.AUDIT_QUESTIONS_ID = WAD.AUDIT_QUESTIONS_ID 
			INNER JOIN EMPLOYEE E 
				ON E.EMP_ID = WAD.EMP_ID
			INNER JOIN WORKPLACE_AUDIT_OWNER WAO 
				ON WAD.AUDIT_QUESTIONS_ID = WAO.AuditQuestionID
			WHERE WAQ.AUDIT_QUESTIONS_GROUP = '4' order by WEEKDATE asc
	END 
     
END


GO
