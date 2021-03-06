USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSabaXref]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_UpdateSabaXref]
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSabaXref]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateSabaXref] 
@SABA_ID INT,
@EMP_ID INT,  
@DATE_COMPLETED DATE
AS

BEGIN

UPDATE SABA_XREF SET 
DATE_COMPLETED = CONVERT(nvarchar, @DATE_COMPLETED , 23) 
WHERE SABA_ID = @SABA_ID AND EMP_ID = @EMP_ID

END
GO
