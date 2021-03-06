USE [AIDE]
GO
/****** Object:  Table [dbo].[COMCELL_CLOCK]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[COMCELL_CLOCK]
GO
/****** Object:  Table [dbo].[COMCELL_CLOCK]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMCELL_CLOCK](
	[CLOCK_ID] [int] IDENTITY(1,1) NOT NULL,
	[CLOCK_DAY] [int] NOT NULL,
	[CLOCK_HOUR] [int] NOT NULL,
	[CLOCK_MINUTE] [int] NOT NULL,
	[EMP_ID] [int] NOT NULL,
	[MIDDAY] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CLOCK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
