USE [AIDE]
GO
/****** Object:  Table [dbo].[POSITION]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[POSITION]
GO
/****** Object:  Table [dbo].[POSITION]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[POSITION](
	[POS_ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCR] [varchar](50) NULL,
 CONSTRAINT [PK_POSITION] PRIMARY KEY CLUSTERED 
(
	[POS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
