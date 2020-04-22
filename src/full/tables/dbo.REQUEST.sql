USE [AIDE]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[REQUEST]
GO
/****** Object:  Table [dbo].[REQUEST]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[REQUEST](
	[reqid] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[description] [varchar](50) NOT NULL,
	[init_display] [varchar](max) NULL,
	[stored_proc] [varchar](255) NULL,
	[response_type] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
