USE [AIDE]
GO
/****** Object:  Table [dbo].[WORKPLACE_AUDIT_OWNER]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[WORKPLACE_AUDIT_OWNER]
GO
/****** Object:  Table [dbo].[WORKPLACE_AUDIT_OWNER]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WORKPLACE_AUDIT_OWNER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AuditQuestionID] [int] NOT NULL,
	[OWNER] [varchar](50) NOT NULL,
	[WhatToDo] [varchar](100) NOT NULL,
	[WhenToDo] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
