USE [Final_PetPeeves]
GO
/****** Object:  StoredProcedure [dbo].[getPostInfo]    Script Date: 15/7/2022 11:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPostInfo] ( @currentUserID VARCHAR(11),@categoryID VARCHAR(11), @offset INT )
AS
	IF @categoryID = 'ALL' 
		SELECT FORMAT(postTime, 'yyyy-MM-dd HH:mm:s') as FormatPostTime,  * FROM dbo.Post_Author_Category
		WHERE postStatus = 1
		ORDER BY postTime DESC
		OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
	ELSE
		IF @categoryID ='Following'
			SELECT FORMAT(postTime, 'yyyy-MM-dd HH:mm:s') as FormatPostTime,  * FROM dbo.Post_Author_Category
			WHERE postStatus=1 and (authorID IN (SELECT followeeId FROM dbo.Followings WHERE userID = @currentUserID) OR authorID = @currentUserID)
			ORDER BY postTime DESC
			OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
		ELSE 
			SELECT FORMAT(postTime, 'yyyy-MM-dd HH:mm:s') as FormatPostTime,  * FROM dbo.Post_Author_Category
			WHERE postStatus =1 AND categoryID = @categoryID
			ORDER BY postTime DESC
			OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
GO
