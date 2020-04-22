USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedProjects]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_DeleteAssignedProjects]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAssignedProjects]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeleteAssignedProjects]
	@PROJ_ID int
AS
DELETE FROM [dbo].[ASSIGNED_PROJECTS] WHERE PROJ_ID = @PROJ_ID
GO
