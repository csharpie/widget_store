USE [WidgetStore]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 12/10/2015 9:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Color](
	[Color] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/10/2015 9:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[DateBy] [datetime] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[UserId] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 12/10/2015 9:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[Type] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Color] ([Color]) VALUES (N'Red')
INSERT [dbo].[Color] ([Color]) VALUES (N'Green')
INSERT [dbo].[Color] ([Color]) VALUES (N'Blue')

INSERT [dbo].[Type] ([Type]) VALUES (N'Widget')
INSERT [dbo].[Type] ([Type]) VALUES (N'Widget Pro')
INSERT [dbo].[Type] ([Type]) VALUES (N'Widget Xtreme')
