USE [AIDE]
GO
/****** Object:  View [dbo].[vw_Commendation]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP VIEW [dbo].[vw_Commendation]
GO
/****** Object:  View [dbo].[vw_Commendation]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[vw_Commendation] AS
	SELECT  
		Employee as Employee,
		Project as Project,
		SENT_BY as SentBy,
		Date_Sent as DateSent,
		Month(Date_Sent) as [Month],
		Year(Date_Sent) as [Year],
		REASON as Reason
	FROM Commendations
	


GO
