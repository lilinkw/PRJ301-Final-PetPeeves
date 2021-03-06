USE [Final_PetPeeves]
GO
/****** Object:  View [dbo].[Comment_Commenter]    Script Date: 4/7/2022 5:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Comment_Commenter] AS
SELECT postID, commenterID, imgLink AS commenterAvatar, userName , commentID,commentContent,commentTime 
FROM dbo.Users,dbo.Comment,dbo.Images
WHERE userID = commenterID AND avatarID = imgID

GO
/****** Object:  View [dbo].[Post_Author_Category]    Script Date: 4/7/2022 5:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Post_Author_Category] AS
SELECT authorID, userName AS authorName , imgLink AS authorAvatar,postID, postTime ,Category.categoryID, category ,postTitle ,postContent,postStatus
FROM ((dbo.PostInfo INNER JOIN dbo.Users ON Users.userID = PostInfo.authorID)LEFT JOIN dbo.Category ON Category.categoryID = PostInfo.categoryID)LEFT JOIN dbo.Images ON Images.imgID = avatarID
GO
