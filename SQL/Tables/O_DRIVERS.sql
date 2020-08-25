USE [REPORTS]
GO

/****** Object:  Table [dbo].[O_DRIVERS]    Script Date: 24.08.2020 12:55:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[O_DRIVERS](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Family] [varchar](35) NOT NULL,
	[Name] [varchar](15) NOT NULL,
	[LastName] [varchar](40) NULL,
	[BirthDay] [smalldatetime] NULL,
	[Pass_Serial] [varchar](6) NULL,
	[Pass_Num] [varchar](10) NULL,
	[License_Serial] [varchar](6) NULL,
	[License_Num] [varchar](10) NULL,
	[License_BegDate] [smalldatetime] NULL,
	[License_EndDate] [smalldatetime] NULL,
	[License_Gave] [varchar](50) NULL,
	[License_Access] [varchar](30) NULL,
	[Adress] [varchar](150) NULL,
	[UID_Car] [int] NULL,
	[Date_Hiring] [smalldatetime] NULL DEFAULT (getdate()),
	[Available] [bit] NULL DEFAULT ((0)),
	[Primech] [varchar](250) NULL,
	[Pass_Gave] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


