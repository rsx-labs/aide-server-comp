USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllStatus]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAllStatus]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllStatus]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllStatus]
	-- Add the parameters for the stored procedure here
	@STATUSNAME varchar(50)
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

			SELECT STATUS as 'STATUS_ID',DESCR as 'STATUS_DESCR' from STATUS 
			WHERE STATUS_NAME = @STATUSNAME
END

select * from status


GO
