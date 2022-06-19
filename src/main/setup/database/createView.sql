USE [Final_PetPeeves]
GO
/****** Object:  View [dbo].[postInfo]    Script Date: 19/6/2022 10:19:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[postInfo] AS ( 
SELECT authorID, PostIdentify.postID, postTime, postContent,PostContent.categoryID, category
FROM dbo.PostIdentify,dbo.PostContent,dbo.Category
WHERE PostContent.postID = PostIdentify.postID AND PostContent.categoryID = Category.categoryID);
GO
