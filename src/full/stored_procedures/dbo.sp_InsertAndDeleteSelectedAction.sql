USE [AIDE]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAndDeleteSelectedAction]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP PROCEDURE [dbo].[sp_InsertAndDeleteSelectedAction]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAndDeleteSelectedAction]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery10.sql|7|0|C:\Users\ADMINI~1\AppData\Local\Temp\~vsBBB6.sql
CREATE PROCEDURE [dbo].[sp_InsertAndDeleteSelectedAction](
	
	
	@REF_ID varchar(max) ,
	@ACTREF varchar(max)
	
)
AS

DECLARE @countAcionExist int = (Select count(*) FROM ACTION_REFERNCE_3CS as a WHERE a.ACTREF = @ACTREF AND a.REF_ID = @REF_ID)



if @countAcionExist = 1

	BEGIN

	UPDATE [dbo].[ACTIONLIST] 

	SET [ACT_STATUS] = 0

	FROM [dbo].ACTIONLIST 
	WHERE [ACTREF] = @ACTREF
	



	
		DELETE 
		
			FROM ACTION_REFERNCE_3CS  
		
			WHERE ACTREF = @ACTREF AND REF_ID = @REF_ID 
	
		
		

	END



ELSE


BEGIN

	INSERT [dbo].[ACTION_REFERNCE_3CS]
(

	[REF_ID],
	[ACTREF] 

)
VALUES
(
	
	@REF_ID,
	@ACTREF
)
	
	UPDATE [dbo].[ACTIONLIST]

	SET [ACT_STATUS] = 1

	FROM [dbo].ACTIONLIST

	WHERE [ACTREF] = @ACTREF

	END

GO
