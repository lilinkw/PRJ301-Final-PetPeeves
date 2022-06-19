USE [Final_PetPeeves]
GO
/****** Object:  StoredProcedure [dbo].[getFollowingPostInfo]    Script Date: 19/6/2022 10:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFollowingPostInfo] ( @currentUserID CHAR(10), @offset INT )
AS 
	 
	SELECT  * FROM dbo.postInfo 
	WHERE  authorID IN (SELECT followeeId FROM dbo.Followings WHERE userID = @currentUserID) 
	ORDER BY postTime DESC
	OFFSET @offset ROWS FETCH NEXT 5 ROWS ONLY

GO
