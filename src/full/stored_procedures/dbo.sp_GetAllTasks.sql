USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllTasks]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllTasks]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllTasks]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllTasks]
AS

	SELECT 
		*
	FROM [dbo].[TASKS] 
GO
