USE [REPORTS]
GO

/****** Object:  Table [dbo].[CARS_DETAIL_ARC]    Script Date: 24.08.2020 12:57:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CARS_DETAIL_ARC](
	[ROWID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[UID_CAR] [int] NOT NULL,
	[PASSPORT_NUM] [int] NULL,
	[PASSPORT_SERIAL] [int] NULL,
	[MASS_MAX] [float] NULL,
	[MASS_LOADOUT] [float] NULL,
	[SHASSIS] [varchar](15) NULL,
	[WORKSTATE] [varchar](30) NULL,
	[PRIMECH] [varchar](200) NULL,
	[DOC_NUM] [int] NULL,
	[DOC_SERIAL] [int] NULL,
	[INS_UID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ROWID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


