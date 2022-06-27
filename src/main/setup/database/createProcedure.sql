USE [Final_PetPeeves]
GO
/****** Object:  StoredProcedure [dbo].[getPostInfo]    Script Date: 27/6/2022 9:20:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPostInfo] ( @currentUserID VARCHAR(11),@category NVARCHAR(50), @offset INT )
AS
	IF @category = 'ALL' 
		SELECT  * FROM dbo.Post_Author_Category	
		ORDER BY postTime DESC
		OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
	ELSE
		IF @category ='Following'
			SELECT  * FROM dbo.Post_Author_Category
			WHERE  authorID IN (SELECT followeeId FROM dbo.Followings WHERE userID = @currentUserID) 
			ORDER BY postTime DESC
			OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
		ELSE 
			SELECT  * FROM dbo.Post_Author_Category 
			WHERE  category = @category
			ORDER BY postTime DESC
			OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY
GO
