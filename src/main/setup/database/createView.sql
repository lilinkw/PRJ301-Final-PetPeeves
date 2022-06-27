USE [Final_PetPeeves]
GO
/****** Object:  View [dbo].[Post_Author_Category]    Script Date: 27/6/2022 9:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Post_Author_Category] AS
SELECT authorID, userName AS authorName , imgLink AS authorAvatar,postID, postTime ,category ,postTitle ,postContent
FROM ((dbo.PostInfo INNER JOIN dbo.Users ON Users.userID = PostInfo.authorID)LEFT JOIN dbo.Category ON Category.categoryID = PostInfo.categoryID)LEFT JOIN dbo.Images ON Images.ID = PostInfo.ID
GO
