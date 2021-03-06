USE [AIDE]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFiscalYear]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP FUNCTION [dbo].[fn_getFiscalYear]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFiscalYear]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_getFiscalYear]
(
	@fy_start datetime,
	@fy_end datetime

)
RETURNS nvarchar(6)
BEGIN
	declare @fy nvarchar(6)

	select @fy = ID 
	from dbo.FISCAL_YEAR
	where fy_end >= @fy_start and fy_start <= @fy_end

	return @fy
END


GO
