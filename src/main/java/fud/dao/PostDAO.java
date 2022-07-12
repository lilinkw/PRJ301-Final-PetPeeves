package fud.dao;

import fud.helpers.DBUtils;
import fud.model.CommentDTO;
import fud.model.PostDTO;
import fud.model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class PostDAO {
    private final String postInfoDbName = "PostInfo";
    private final String getPostInfoProcedure = "getPostInfo";

    public List<CommentDTO> getCommentListByPostID(String postID) throws Exception{
        List<CommentDTO> commentDTOList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if(con!=null){
                String sql = "SELECT * FROM dbo.Comment_Commenter\n" +
                        "WHERE postID =?";
                ps= con.prepareStatement(sql);
                ps.setString(1,postID);
                rs=ps.executeQuery();

                while (rs.next()) {
                    String commentID = rs.getString("commentID");
                    String commenterID= rs.getString("commenterID");
                    String commenterAvatarLink= rs.getString("commenterAvatar");
                    String commenterName= rs.getString("userName");
                    String commentContent = rs.getString("commentContent");
                    String commentTime = rs.getString("commentTime");

                    commentDTOList.add(new CommentDTO(commentID, postID, commenterID, commenterName, commenterAvatarLink, commentContent, commentTime));
                }
                return commentDTOList;
            }
        }finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }

        return  null;
    }

    public List<String> getImageListByPostID(String postID) throws Exception {
        List<String> imageLinksList = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM dbo.PostImage INNER JOIN dbo.Images ON Images.imgID = PostImage.imgID \n" +
                        "WHERE postID =?";
                ps = con.prepareStatement(sql);
                ps.setString(1,postID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    imageLinksList.add(rs.getString("imgLink"));
                }
                return imageLinksList;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return  null;
    }

    public List<PostDTO> getPostByCategoryID(String currentUserID, String categoryID, int offset) throws Exception{
        List<PostDTO> result = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "EXEC " + getPostInfoProcedure + " @currentUserID = ?, @categoryID = ?, @offset = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, currentUserID);
                ps.setString(2, categoryID);
                ps.setInt(3, offset);
                rs = ps.executeQuery();

                while (rs.next()) {
                    // ADD POST THAT HAVE NOT BEEN DELETED ONLY
                    boolean postStatus = rs.getBoolean("postStatus");
                    if (postStatus) {
                        String authorID = rs.getString("authorID");
                        String authorName = rs.getString("authorName");
                        String avatarLink = rs.getString("authorAvatar");
                        String postID = rs.getString("postID");
                        String postTime = rs.getString("postTime");
                        String postCategory = rs.getString("category");
                        String postTitle = rs.getString("postTitle");
                        String postContent = rs.getString("postContent");
                        String postCategoryID = rs.getString("categoryID");

                        //get image
                        List<String> imgLinksList = getImageListByPostID(postID);

                        result.add( new PostDTO(postID, postTitle, postContent,postCategoryID, postCategory,authorID, authorName, avatarLink,postTime, true,imgLinksList));
                    }

                }
                return result;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return null;
    }

    public List<PostDTO> getPostByAuthorID(String authorID) throws Exception{
        List<PostDTO> result = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "select * from Post_Author_Category\n" +
                        "where authorID=?\n" +
                        "order by postTime desc";
                ps = con.prepareStatement(sql);
                ps.setString(1,authorID );
                rs = ps.executeQuery();

                while (rs.next()) {
                    // ADD POST THAT HAVE NOT BEEN DELETED ONLY
                    boolean postStatus = rs.getBoolean("postStatus");
                    if (postStatus) {
                        String authorName = rs.getString("authorName");
                        String avatarLink = rs.getString("authorAvatar");
                        String postID = rs.getString("postID");
                        String postTime = rs.getString("postTime");
                        String postCategory = rs.getString("category");
                        String postTitle = rs.getString("postTitle");
                        String postContent = rs.getString("postContent");
                        String postCategoryID = rs.getString("categoryID");

                        //get image
                        List<String> imgLinksList = getImageListByPostID(postID);

                        result.add( new PostDTO(postID, postTitle, postContent,postCategoryID, postCategory,authorID, authorName, avatarLink,postTime, true,imgLinksList));
                    }

                }
                return result;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return null;
    }

    public PostDTO getPostByPostID(String postID) throws Exception{
        PostDTO postDTO = new PostDTO();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM dbo.Post_Author_Category\n" +
                        "WHERE postID =?";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    // ADD POST THAT HAVE NOT BEEN DELETED ONLY
                    boolean postStatus = rs.getBoolean("postStatus");
                    if (postStatus) {
                        String authorID = rs.getString("authorID");
                        String authorName = rs.getString("authorName");
                        String avatarLink = rs.getString("authorAvatar");
                        String postTime = rs.getString("postTime");
                        String postCategory = rs.getString("category");
                        String postTitle = rs.getString("postTitle");
                        String postContent = rs.getString("postContent");
                        String postCategoryID = rs.getString("categoryID");

                        //get image
                        List<String> imgLinksList = getImageListByPostID(postID);

                        postDTO =  new PostDTO(postID, postTitle, postContent,postCategoryID, postCategory,authorID, authorName, avatarLink,postTime, true,imgLinksList);
                        postDTO.setCommentList(getCommentListByPostID(postID));
                    }

                }
                return postDTO;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return null;
    }

    public boolean addNewPost(String postTitle, String postContent, String authorID, String categoryID ) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {
                String sql = "INSERT INTO dbo.PostInfo (postTitle,postContent,authorID,categoryID)\n" +
                        "VALUES(?,?,?,?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, postTitle);
                stm.setString(2, postContent);
                stm.setString(3, authorID);
                stm.setString(4, categoryID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        }finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public boolean addNewPost(String postTitle, String postContent, String authorID, String categoryID ,String imgLink) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {
                String sql = "INSERT INTO dbo.PostInfo (postTitle,postContent,authorID,categoryID)\n" +
                        "VALUES(?,?,?,?)\n" +
                        "\n" +
                        "INSERT INTO dbo.Images(imgLink) \n" +
                        "VALUES(?)\n" +
                        "\n" +
                        "INSERT INTO dbo.PostImage(postID,imgID) \n" +
                        "VALUES\n" +
                        "( \n" +
                        "\t(SELECT TOP (1) postID FROM dbo.PostInfo ORDER BY postTime DESC),\n" +
                        "\t(SELECT TOP (1) imgID FROM dbo.Images ORDER BY imgID DESC)\n" +
                        ")";

                stm = con.prepareStatement(sql);
                stm.setString(1, postTitle);
                stm.setString(2, postContent);
                stm.setString(3, authorID);
                stm.setString(4, categoryID);
                stm.setString(5, imgLink);
                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public List<PostDTO> getPostByCategoryID(String categoryID) throws Exception{
        List<PostDTO> result = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "select * from Post_Author_Category \n" +
                        "where categoryID = ?\n" +
                        "order by postTime desc";
                ps = con.prepareStatement(sql);
                ps.setString(1, categoryID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    // ADD POST THAT HAVE NOT BEEN DELETED ONLY
                    boolean postStatus = rs.getBoolean("postStatus");
                    if (postStatus) {
                        String authorID = rs.getString("authorID");
                        String authorName = rs.getString("authorName");
                        String avatarLink = rs.getString("authorAvatar");
                        String postID = rs.getString("postID");
                        String postTime = rs.getString("postTime");
                        String postCategoryID = rs.getString("categoryID");
                        String postCategory = rs.getString("category");
                        String postTitle = rs.getString("postTitle");
                        String postContent = rs.getString("postContent");

                        //get image
                        sql = "SELECT * FROM dbo.PostImage INNER JOIN dbo.Images ON Images.imgID = PostImage.imgID \n" +
                                "WHERE postID =?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, postID);
                        ResultSet rs2 = ps.executeQuery();

                        List<String> imgLinkList = getImageListByPostID(postID);
                        result.add( new PostDTO(postID, postTitle, postContent, postCategoryID, postCategory, authorID, authorName, avatarLink,postTime, true,imgLinkList));
                    }

                }
                return result;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return null;
    }


    public boolean deactivatePostByPostID(String postID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {
                String sql = "UPDATE dbo.PostInfo SET postStatus = 0 WHERE postID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        }finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public boolean updatePostByPostID(String postID, String postTile, String postContent, String categoryID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {
                String sql = "UPDATE dbo.PostInfo SET postTitle = ? ,postContent =?, categoryID=?\n" +
                        "WHERE postID =?";

                stm = con.prepareStatement(sql);
                stm.setString(1, postTile);
                stm.setString(2, postContent);
                stm.setString(3,categoryID);
                stm.setString(4,postID);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        }finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public boolean updatePostByPostID(String postID, String postTile, String postContent, String categoryID, String imgLink) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {
                String sql = "UPDATE dbo.PostInfo SET postTitle = ? ,postContent =?, categoryID=?\n" +
                        "WHERE postID = ?\n" +
                        "\n" +
                        "UPDATE dbo.Images SET imgLink = ?\n" +
                        "WHERE imgID =(SELECT imgID FROM dbo.PostInfo WHERE postID =?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, postTile);
                stm.setString(2, postContent);
                stm.setString(3,categoryID);
                stm.setString(4,postID);
                stm.setString(5,imgLink);
                stm.setString(6,postID);

                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public List<PostDTO> getPostByTitle(String titleName) throws Exception{
        List<PostDTO> result = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "select * from Post_Author_Category\n" +
                        "where postTitle like ?\n" +
                        "order by postTime desc";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + titleName + "%");
                rs = ps.executeQuery();

                while (rs.next()) {
                    // ADD POST THAT HAVE NOT BEEN DELETED ONLY
                    boolean postStatus = rs.getBoolean("postStatus");
                    if (postStatus) {
                        String authorID = rs.getString("authorID");
                        String authorName = rs.getString("authorName");
                        String avatarLink = rs.getString("authorAvatar");
                        String postID = rs.getString("postID");
                        String postTime = rs.getString("postTime");
                        String postCategoryID = rs.getString("categoryID");
                        String postCategory = rs.getString("category");
                        String postTitle = rs.getString("postTitle");
                        String postContent = rs.getString("postContent");

                        //get image
                        sql = "SELECT * FROM dbo.PostImage INNER JOIN dbo.Images ON Images.imgID = PostImage.imgID \n" +
                                "WHERE postID =?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, postID);
                        ResultSet rs2 = ps.executeQuery();

                        List<String> imgLinkList = getImageListByPostID(postID);
                        result.add( new PostDTO(postID, postTitle, postContent, postCategoryID, postCategory, authorID, authorName, avatarLink,postTime, true,imgLinkList));
                    }

                }
                return result;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return null;

    }

    public boolean addComment(String postID, String commenterID, String commentContent) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "INSERT INTO dbo.Comment(postID,commenterID,commentContent)\n" +
                        "VALUES(?,?,?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                stm.setString(2, commenterID);
                stm.setString(3, commentContent);
                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return false;
    }

    public String getAuthorByPostID(String postID) throws Exception{
        String authorID = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "SELECT authorID FROM dbo.Post_Author_Category\n" +
                        "WHERE postID =?";
                ps = con.prepareStatement(sql);
                ps.setString(1, postID);
                rs = ps.executeQuery();

                if (rs.next()) {
                    authorID = rs.getString("authorID");
                }
                return authorID;
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return null;
    }
    public static void main(String[] args) {
        try {
            String userID = "USE00000001";
            String category = "ALL";
            int offset = 0;
            List<PostDTO> postDTOList = new PostDAO().getPostByCategoryID(userID, category,offset);
            for (PostDTO postDTO: postDTOList){
                System.out.println("Post ID: " + postDTO.getPostID()
                + "\nPost Status: " + postDTO.getPostStatus()
                + "\nPost Time: "+ postDTO.getPostTime()
                + "\nPost img: "+ postDTO.getImageLinks().get(0));
            }
        } catch (Exception e){
            System.out.println("PostDAO ERROR: " + e.getMessage());
        }
    }
}
