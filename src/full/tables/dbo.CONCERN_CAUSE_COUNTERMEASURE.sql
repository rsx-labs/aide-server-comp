USE [AIDE]
GO
/****** Object:  Table [dbo].[CONCERN_CAUSE_COUNTERMEASURE]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[CONCERN_CAUSE_COUNTERMEASURE]
GO
/****** Object:  Table [dbo].[CONCERN_CAUSE_COUNTERMEASURE]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONCERN_CAUSE_COUNTERMEASURE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[REF_ID] [varchar](255) NOT NULL,
	[CONCERN] [varchar](max) NOT NULL,
	[CAUSE] [varchar](max) NOT NULL,
	[COUNTERMEASURE] [varchar](max) NOT NULL,
	[EMP_ID] [varchar](10) NULL,
	[DUE_DATE] [datetime] NULL,
	[STATUS] [int] NOT NULL,
	[DATE_RAISED] [datetime] NOT NULL,
 CONSTRAINT [PK__CONCERN___C30DEE1C9090033F] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
