USE [Final_PetPeeves]
GO
/****** Object:  StoredProcedure [dbo].[getPostInfo]    Script Date: 6/7/2022 4:06:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPostInfo] ( @currentUserID VARCHAR(11),@categoryID VARCHAR(11), @offset INT )
AS
	IF @categoryID = 'ALL' 
		SELECT FORMAT(postTime, 'yyyy-MM-dd hh:mm:s') as FormatPostTime,  * FROM dbo.Post_Author_Category
		ORDER BY postTime DESC
		OFFSET @offset ROWS FETCH NEXT 50 ROWS ONLY
	ELSE
		IF @categoryID ='Following'
			SELECT FORMAT(postTime, 'yyyy-MM-dd hh:mm:s') as FormatPostTime,  * FROM dbo.Post_Author_Category
			WHERE  authorID IN (SELECT followeeId FROM dbo.Followings WHERE userID = @currentUserID) OR authorID = @currentUserID
			ORDER BY postTime DESC
			OFFSET @offset ROWS FETCH NEXT 50 ROWS ONLY
		ELSE 
			SELECT FORMAT(postTime, 'yyyy-MM-dd hh:mm:s') as FormatPostTime,  * FROM dbo.Post_Author_Category
			WHERE  categoryID = @categoryID
			ORDER BY postTime DESC
			OFFSET @offset ROWS FETCH NEXT 50 ROWS ONLY
GO
