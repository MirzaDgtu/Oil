USE [REPORTS]
GO

/****** Object:  Table [dbo].[O_ARTC]    Script Date: 24.08.2020 12:54:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[O_ARTC](
	[COD_ARTIC] [int] IDENTITY(1,1) NOT NULL,
	[NAME_ARTIC] [varchar](200) NULL,
	[CENA_ARTC] [float] NULL DEFAULT ((0)),
	[NDS_ARTIC] [float] NULL DEFAULT ((0)),
	[EDIN_IZMER] [varchar](10) NULL,
	[KON_KOLCH] [float] NULL DEFAULT ((0)),
	[VES_EDINIC] [float] NULL DEFAULT ((0)),
	[EDN_V_UPAK] [float] NULL,
	[NGROUP_TVR] [varchar](30) NULL,
	[NGROUP_TV2] [varchar](30) NULL,
	[NGROUP_TV3] [varchar](30) NULL,
	[NGROUP_TV4] [varchar](30) NULL,
	[NGROUP_TV5] [varchar](30) NULL,
	[NGROUP_TV6] [varchar](30) NULL,
	[TYPE_TOVR] [varchar](10) NULL,
	[FAMILY] [varchar](10) NULL,
	[CREATE_DATE] [smalldatetime] NULL DEFAULT (getdate()),
	[WHO_CORR] [varchar](10) NULL,
	[CORR_DATE] [smalldatetime] NULL,
	[OTMETKA] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[COD_ARTIC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


