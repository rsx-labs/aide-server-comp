USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLessonLearnt]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertLessonLearnt]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLessonLearnt]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertLessonLearnt]
	@REF_NO varchar(20),
	@EMP_ID int ,
	@PROBLEM varchar(max) ,
	@RESOLUTION varchar(max) ,
	@ACTION_NO varchar(20)
AS
BEGIN
	INSERT INTO [dbo].[LESSON_LEARNT]
	(
		[REF_NO],
		[EMP_ID],
		[PROBLEM],
		[RESOLUTION],
		[ACTION_NO],
		[DATE_CREATED]
	)
	VALUES
	(
		@REF_NO,
		@EMP_ID,
		@PROBLEM,
		@RESOLUTION,
		@ACTION_NO,
		GETDATE()
	)
END

GO
