USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertKPISummary]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertKPISummary]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertKPISummary]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertKPISummary]
	-- Add the parameters for the stored procedure here
	@EMP_ID INT,
	@FY_START DATE,
	@FY_END DATE,
	@KPI_REF VARCHAR(20),
	@KPI_MONTH smallint,
	@KPI_TARGET float,
	@KPI_ACTUAL float,
	@KPI_OVERALL float,
	@DATE_POSTED datetime
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO [dbo].[KPI_SUMMARY] (EMP_ID, FY_START, FY_END, KPI_REF, KPI_MONTH, KPI_TARGET, KPI_ACTUAL, KPI_OVERALL, DATE_POSTED)
	VALUES (@EMP_ID, @FY_START, @FY_END, @KPI_REF, @KPI_MONTH, @KPI_TARGET, @KPI_ACTUAL, @KPI_OVERALL, @DATE_POSTED)
END

GO
