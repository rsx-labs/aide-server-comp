USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDepartment]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllDepartment]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDepartment]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllDepartment]
	-- Add the parameters for the stored procedure here
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

			SELECT DEPT_ID,descr as 'DEPT_DESC' from DEPARTMENT where DEPT_ID > 0
END


GO
