USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSkillsProf]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertSkillsProf]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSkillsProf]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSkillsProf]
	@EMP_ID int ,
	@SKILL_ID int,
	@PROF_LVL TINYINT ,
	@LAST_REVIEWED DATETIME 

AS

INSERT [dbo].[SKILLS_PROF]
(
	[EMP_ID],
	[SKILL_ID],
	[PROF_LVL],
	[LAST_REVIEWED]

)
VALUES
(
	@EMP_ID,
	@SKILL_ID,
	@PROF_LVL,
	@LAST_REVIEWED
	
)




GO
