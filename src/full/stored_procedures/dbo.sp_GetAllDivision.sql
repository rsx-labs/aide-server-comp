USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDivision]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllDivision]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllDivision]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllDivision]
	-- Add the parameters for the stored procedure here
	@DEPTID INT
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

			SELECT DIV_ID,descr as 'DIV_DESCR' 
			FROM DIVISION 
			WHERE DIV_ID > 0 AND DEPT_ID = @DEPTID
END


GO
