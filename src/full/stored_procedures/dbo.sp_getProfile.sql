USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_getProfile]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_getProfile]
GO
/****** Object:  StoredProcedure [dbo].[sp_getProfile]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getProfile](
	-- Add the parameters for the stored procedure here
	@empID int

)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM vw_Profiles d 
	WHERE d.EMP_ID = @empID
END



GO
