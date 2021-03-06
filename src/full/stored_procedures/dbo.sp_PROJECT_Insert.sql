USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_PROJECT_Insert]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_PROJECT_Insert]
GO
/****** Object:  StoredProcedure [dbo].[sp_PROJECT_Insert]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_PROJECT_Insert]
	@PROJ_CD nvarchar(10) ,
	@PROJ_NAME VARCHAR(50) ,
	@CATEGORY smallint ,
	@BILLABILITY smallint,
	@EMP_ID int

AS

INSERT [dbo].[PROJECT]
(
	[PROJ_CD],
	[PROJ_NAME],
	[CATEGORY],
	[BILLABILITY],
	[EMP_ID]
)
VALUES
(
	@PROJ_CD,
	@PROJ_NAME,
	@CATEGORY,
	@BILLABILITY,
	@EMP_ID

)



GO
