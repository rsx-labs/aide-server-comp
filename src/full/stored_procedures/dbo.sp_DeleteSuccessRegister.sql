USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSuccessRegister]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_DeleteSuccessRegister]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSuccessRegister]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE PROCEDURE [dbo].[sp_DeleteSuccessRegister]
		-- Add the parameters for the stored procedure here
		@ID int
		AS
		BEGIN
			DELETE FROM SUCCESSREGISTER
			WHERE ID = @ID
		END

GO
