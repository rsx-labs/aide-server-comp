USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSelectedConcern]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_UpdateSelectedConcern]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSelectedConcern]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateSelectedConcern]
	@REF_ID varchar(max) ,
	@CONCERN varchar(max) ,
	@CAUSE varchar(max) ,
	@COUNTERMEASURE varchar(max),	
	@DUE_DATE date

		
AS

SET NOCOUNT ON
BEGIN
UPDATE CONCERN_CAUSE_COUNTERMEASURE

SET [REF_ID] = @REF_ID  ,
	[CONCERN] = @CONCERN  ,
	[CAUSE] = @CAUSE  ,	
	[COUNTERMEASURE] = @COUNTERMEASURE,	
	[DUE_DATE] = @DUE_DATE



	FROM CONCERN_CAUSE_COUNTERMEASURE

	WHERE REF_ID = @REF_ID
END

GO
