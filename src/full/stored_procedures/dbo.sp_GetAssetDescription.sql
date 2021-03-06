USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssetDescription]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_GetAssetDescription]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAssetDescription]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAssetDescription]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TYP_ID AS ASSET_ID,
		   TYP_DESCR  AS ASSET_DESC
	FROM ASSET_TYPE 
	ORDER BY ASSET_DESC ASC
END 
GO
