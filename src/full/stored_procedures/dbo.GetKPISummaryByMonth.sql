USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[GetKPISummaryByMonth]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[GetKPISummaryByMonth]
GO
/****** Object:  StoredProcedure [dbo].[GetKPISummaryByMonth]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetKPISummaryByMonth]
	-- Add the parameters for the stored procedure here
	@FY_START DATE,
	@FY_END DATE,
	@KPI_MONTH smallint
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT A.ID, 
		   A.FY_START,
		   A.FY_END, 
		   A.KPI_REF, 
		   B.SUBJECT, 
		   B.DESCRIPTION, 
		   A.KPI_MONTH,
		   A.KPI_TARGET,
		   A.KPI_ACTUAL,
		   A.KPI_OVERALL
	FROM dbo.[KPI_SUMMARY] A
	INNER JOIN dbo.[KPI_TARGETS] B ON
	A.KPI_REF = B.KPI_REF AND
	A.FY_START = B.FY_START AND
	A.FY_END = B.FY_END
	WHERE A.FY_START = @FY_START AND A.FY_END = @FY_END AND A.KPI_MONTH = @KPI_MONTH
	ORDER BY A.KPI_REF ASC
	
END

GO
