USE [AIDE]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[EMPLOYEE]
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EMP_ID] [int] NOT NULL,
	[WS_EMP_ID] [varchar](10) NOT NULL,
	[LAST_NAME] [varchar](20) NOT NULL,
	[FIRST_NAME] [varchar](50) NOT NULL,
	[MIDDLE_NAME] [char](20) NULL,
	[NICK_NAME] [varchar](10) NULL,
	[BIRTHDATE] [date] NULL,
	[POS_ID] [smallint] NULL,
	[DATE_HIRED] [date] NULL,
	[STATUS] [varchar](1) NOT NULL,
	[IMAGE_PATH] [varchar](max) NULL,
	[GRP_ID] [smallint] NULL,
	[DEPT_ID] [smallint] NULL,
	[ACTIVE] [smallint] NULL,
	[DIV_ID] [smallint] NULL,
	[SHIFT_STATUS] [varchar](50) NULL,
	[APPROVED] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
