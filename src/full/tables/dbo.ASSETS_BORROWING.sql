USE [AIDE]
GO
/****** Object:  Table [dbo].[ASSETS_BORROWING]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[ASSETS_BORROWING]
GO
/****** Object:  Table [dbo].[ASSETS_BORROWING]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSETS_BORROWING](
	[ASSET_BORROWING_ID] [int] IDENTITY(1,1) NOT NULL,
	[EMP_ID] [int] NOT NULL,
	[ASSET_ID] [int] NOT NULL,
	[STATUS] [int] NOT NULL,
	[DATE_BORROWED] [datetime] NULL,
	[DATE_RETURNED] [datetime] NULL,
	[COMMENTS] [text] NULL,
	[APPROVAL] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ASSET_BORROWING_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
