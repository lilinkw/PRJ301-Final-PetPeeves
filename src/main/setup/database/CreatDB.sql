---ten DB: Final_PetPeeves---------
USE [Final_PetPeeves] 
GO
/****** Object:  Table [dbo].[Category]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentContent]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentContent](
	[commentID] [char](10) NOT NULL,
	[commentContent] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentIdentify]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentIdentify](
	[postID] [char](10) NOT NULL,
	[commenterID] [char](10) NOT NULL,
	[commentTime] [datetime] NOT NULL,
	[commentID] [char](10) NOT NULL,
 CONSTRAINT [PK_CommentIdentify] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[commenterID] ASC,
	[commentTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Followings]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Followings](
	[userID] [char](10) NOT NULL,
	[followeeId] [char](10) NOT NULL,
 CONSTRAINT [PK_Followings] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[followeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[imgID] [char](10) NOT NULL,
	[imgLink] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostContent]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostContent](
	[postID] [char](10) NOT NULL,
	[postContent] [text] NULL,
	[category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostIdentify]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostIdentify](
	[authorID] [char](10) NOT NULL,
	[postTime] [datetime] NOT NULL,
	[postID] [char](10) NOT NULL,
 CONSTRAINT [PK_PostIdentify] PRIMARY KEY CLUSTERED 
(
	[authorID] ASC,
	[postTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostImage]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostImage](
	[postID] [char](10) NOT NULL,
	[imgID] [char](10) NOT NULL,
 CONSTRAINT [PK_PostImage] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[imgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/6/2022 10:48:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [char](10) NOT NULL,
	[passwords] [varchar](20) NULL,
	[fullName] [nvarchar](20) NULL,
	[avatarID] [char](10) NULL,
	[dateOfBirth] [datetime] NULL,
	[gender] [varchar](6) NULL,
	[locations] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CommentContent]  WITH CHECK ADD FOREIGN KEY([commentID])
REFERENCES [dbo].[CommentIdentify] ([commentID])
GO
ALTER TABLE [dbo].[CommentIdentify]  WITH CHECK ADD FOREIGN KEY([commenterID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[CommentIdentify]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[PostIdentify] ([postID])
GO
ALTER TABLE [dbo].[Followings]  WITH CHECK ADD FOREIGN KEY([followeeId])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Followings]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[PostContent]  WITH CHECK ADD FOREIGN KEY([category])
REFERENCES [dbo].[Category] ([category])
GO
ALTER TABLE [dbo].[PostContent]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[PostIdentify] ([postID])
GO
ALTER TABLE [dbo].[PostIdentify]  WITH CHECK ADD FOREIGN KEY([authorID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[PostImage]  WITH CHECK ADD FOREIGN KEY([imgID])
REFERENCES [dbo].[Images] ([imgID])
GO
ALTER TABLE [dbo].[PostImage]  WITH CHECK ADD FOREIGN KEY([postID])
REFERENCES [dbo].[PostIdentify] ([postID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([avatarID])
REFERENCES [dbo].[Images] ([imgID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([gender]='Others' OR [gender]='Male' OR [gender]='Female'))
GO
