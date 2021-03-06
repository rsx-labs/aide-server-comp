USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeamStatusReportPerProject]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetTeamStatusReportPerProject]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTeamStatusReportPerProject]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTeamStatusReportPerProject]
	@PROJ_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select *
	from vw_StatusReport
	Where vw_StatusReport.ProjectId = @PROJ_ID
END
GRANT EXECUTE on [dbo].[sp_GetTeamStatusReportPerProject] to [aide-user]
GO
