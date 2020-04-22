USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSkillsLastReviewByEmpIDSkillID]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetSkillsLastReviewByEmpIDSkillID]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSkillsLastReviewByEmpIDSkillID]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetSkillsLastReviewByEmpIDSkillID]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT, 
	@SKILL_ID INT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.PROF_LVL, A.LAST_REVIEWED
	FROM SKILLS_PROF A
	WHERE A.EMP_ID = @EMP_ID AND A.SKILL_ID = @SKILL_ID
END
GO
