USE [Final_PetPeeves]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID]  AS ('CAT'+right('00000000'+CONVERT([varchar](8),[ID]),(8))) PERSISTED NOT NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[commentID]  AS ('COM'+right('00000000'+CONVERT([varchar](8),[ID]),(8))) PERSISTED NOT NULL,
	[postID] [varchar](11) NULL,
	[commenterID] [varchar](11) NULL,
	[commentTime] [datetime] NULL,
	[commentContent] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Followings]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Followings](
	[userID] [varchar](11) NOT NULL,
	[followeeId] [varchar](11) NOT NULL,
 CONSTRAINT [PK_Followings] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[followeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[imgID]  AS ('IMG'+right('00000000'+CONVERT([varchar](8),[ID]),(8))) PERSISTED NOT NULL,
	[imgLink] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostImage]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostImage](
	[postID] [varchar](11) NOT NULL,
	[imgID] [varchar](11) NOT NULL,
 CONSTRAINT [PK_PostImage] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInfo]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[postID]  AS ('POS'+right('00000000'+CONVERT([varchar](8),[ID]),(8))) PERSISTED NOT NULL,
	[postTitle] [nvarchar](255) NULL,
	[postContent] [text] NULL,
	[postTime] [datetime] NULL,
	[authorID] [varchar](11) NULL,
	[categoryID] [varchar](11) NULL,
	[postStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/7/2022 9:19:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID]  AS ('USE'+right('00000000'+CONVERT([varchar](8),[ID]),(8))) PERSISTED NOT NULL,
	[userName] [varchar](20) NOT NULL,
	[password] [varchar](256) NULL,
	[avatarID] [varchar](11) NULL,
	[dateOfBirth] [date] NULL,
	[gender] [varchar](6) NULL,
	[locations] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
	[userStatus] [bit] NULL,
	[fullName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ__Users__66DCF95CADAF41D5] UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT (getdate()) FOR [commentTime]
GO
ALTER TABLE [dbo].[PostInfo] ADD  DEFAULT (getdate()) FOR [postTime]
GO
ALTER TABLE [dbo].[PostInfo] ADD  DEFAULT ((1)) FOR [postStatus]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [userStatus]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([commenterID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[PostInfo] ([postID])
GO
ALTER TABLE [dbo].[Followings]  WITH CHECK ADD FOREIGN KEY([followeeId])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Followings]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[PostImage]  WITH CHECK ADD FOREIGN KEY([imgID])
REFERENCES [dbo].[Images] ([imgID])
GO
ALTER TABLE [dbo].[PostImage]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[PostInfo] ([postID])
GO
ALTER TABLE [dbo].[PostInfo]  WITH CHECK ADD FOREIGN KEY([authorID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[PostInfo]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([avatarID])
REFERENCES [dbo].[Images] ([imgID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([gender]='Others' OR [gender]='Male' OR [gender]='Female'))
GO
