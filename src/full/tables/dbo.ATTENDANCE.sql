USE [AIDE]
GO
/****** Object:  Table [dbo].[ATTENDANCE]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[ATTENDANCE]
GO
/****** Object:  Table [dbo].[ATTENDANCE]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ATTENDANCE](
	[EMP_ID] [int] NOT NULL,
	[DATE_ENTRY] [datetime] NOT NULL,
	[STATUS] [int] NOT NULL,
	[LOGOFF_FLG] [tinyint] NULL CONSTRAINT [df_Logoff_flg]  DEFAULT ((0)),
	[LOGOFF_TIME] [datetime] NULL,
	[COUNTS] [float] NULL,
	[STATUS_CD] [smallint] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[EMP_ID] ASC,
	[DATE_ENTRY] ASC,
	[STATUS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
