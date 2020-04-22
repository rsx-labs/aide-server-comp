USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLessonLearnt]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_UpdateLessonLearnt]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLessonLearnt]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateLessonLearnt]
	@REF_NO varchar(20) ,
	@PROBLEM varchar(max) ,
	@RESOLUTION varchar(max) ,
	@ACTION_NO varchar(20)

AS

UPDATE [dbo].[LESSON_LEARNT]
SET
	[PROBLEM] = @PROBLEM,
	[RESOLUTION] = @RESOLUTION,
	[ACTION_NO] = @ACTION_NO
 WHERE 
	[REF_NO] = @REF_NO 



GO
