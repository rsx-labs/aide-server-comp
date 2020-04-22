USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllContributors]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllContributors]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllContributors]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllContributors]
@LEVEL INT
AS
BEGIN							
	
	SELECT  FULL_NAME, IMAGE_PATH, DEPARTMENT, DIVISION, POSITION FROM CONTRIBUTORS 
	WHERE CONTRI_LVL = @LEVEL

END

GO
