USE [AIDE]
GO
/****** Object:  View [dbo].[vw_TasksAll]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP VIEW [dbo].[vw_TasksAll]
GO
/****** Object:  View [dbo].[vw_TasksAll]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[vw_TasksAll] AS
		SELECT dbo.TASKS.*
		FROM dbo.TASKS
GO
