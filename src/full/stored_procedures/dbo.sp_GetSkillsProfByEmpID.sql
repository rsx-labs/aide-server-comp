USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSkillsProfByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetSkillsProfByEmpID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSkillsProfByEmpID]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSkillsProfByEmpID]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT 
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT e.EMP_ID, e.LAST_NAME + ' ' + e.FIRST_NAME + ' ' + SUBSTRING(e.MIDDLE_NAME, 1, 1) AS EMPLOYEE_NAME,
		   s.DESCR, sp.PROF_LVL, sp.LAST_REVIEWED
	FROM EMPLOYEE e 
	INNER JOIN SKILLS_PROF sp ON e.EMP_ID = sp.EMP_ID
	INNER JOIN SKILLS s ON s.SKILL_ID = sp.SKILL_ID 
	INNER JOIN SKILLS_DEPT sd ON s.SKILL_ID = sd.SKILL_ID 
	WHERE e.EMP_ID = @EMP_ID 
	AND sd.DISPLAY_FG = 1 
	AND e.ACTIVE = 1
	ORDER BY s.DSPLY_ORDR ASC, s.DESCR ASC
END
GO
