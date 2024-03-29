USE [share]
GO
/****** Object:  Table [dbo].[sharetbl]    Script Date: 8/1/2017 8:25:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sharetbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Pigmi] [decimal](18, 2) NULL,
	[Expences1] [decimal](18, 2) NULL,
	[DF] [decimal](18, 2) NULL,
	[Expences2] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sharetbl2]    Script Date: 8/1/2017 8:25:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sharetbl2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[debitcreditdetails] [nvarchar](50) NULL,
	[Pigmi] [decimal](18, 2) NULL,
	[DF] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[sharetbl] ON 

INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (1, CAST(0x1B3D0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'rr')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (2, CAST(0x1B3D0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'rr')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (3, CAST(0x1B3D0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'rr')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (4, CAST(0x8A3C0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'tt')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (5, CAST(0x0A3D0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'ttt')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (9, CAST(0x013D0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'test')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (10, CAST(0xFE3C0B00 AS Date), CAST(11.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(13.00 AS Decimal(18, 2)), CAST(14.00 AS Decimal(18, 2)), N'you')
INSERT [dbo].[sharetbl] ([id], [Date], [Pigmi], [Expences1], [DF], [Expences2], [Remarks]) VALUES (11, CAST(0x033D0B00 AS Date), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'yy')
SET IDENTITY_INSERT [dbo].[sharetbl] OFF
SET IDENTITY_INSERT [dbo].[sharetbl2] ON 

INSERT [dbo].[sharetbl2] ([id], [Date], [debitcreditdetails], [Pigmi], [DF]) VALUES (4, CAST(0x013D0B00 AS Date), N'test', CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[sharetbl2] ([id], [Date], [debitcreditdetails], [Pigmi], [DF]) VALUES (5, CAST(0xFE3C0B00 AS Date), N'1', CAST(2.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[sharetbl2] ([id], [Date], [debitcreditdetails], [Pigmi], [DF]) VALUES (3, CAST(0x1C3D0B00 AS Date), N're', CAST(10.00 AS Decimal(18, 2)), CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[sharetbl2] ([id], [Date], [debitcreditdetails], [Pigmi], [DF]) VALUES (6, CAST(0x033D0B00 AS Date), N'1', CAST(3.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[sharetbl2] OFF
