USE [AIDE]
GO
/****** Object:  Table [dbo].[DOCUMENTS]    Script Date: 04/22/2020 2:29:00 PM ******/
DROP TABLE [dbo].[DOCUMENTS]
GO
/****** Object:  Table [dbo].[DOCUMENTS]    Script Date: 04/22/2020 2:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DOCUMENTS](
	[refid] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[bulk_content] [varchar](max) NULL,
	[upload_dt] [smalldatetime] NULL,
	[uploader_id] [int] NULL,
	[file_location] [nvarchar](100) NULL,
 CONSTRAINT [PK_DOCUMENTS] PRIMARY KEY CLUSTERED 
(
	[refid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
