package fud.dao;

import fud.helpers.DBUtils;
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

    public List<PostDTO> getPost(String currentUserID, String categoryID, int offset) throws Exception{
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

                        //get image
                        sql = "SELECT * FROM dbo.PostImage INNER JOIN dbo.Images ON Images.imgID = PostImage.imgID \n" +
                                "WHERE postID =?";
                        ps = con.prepareStatement(sql);
                        ps.setString(1, postID);
                        ResultSet rs2 = ps.executeQuery();

                        ArrayList<String> imgLinkList = new ArrayList<>();
                        while (rs2.next()){
                            imgLinkList.add(rs2.getString("imgLink"));
                        }

                        //TODO: GET IMAGE USING METHOD
                        result.add( new PostDTO(postID, postTitle, postContent, postCategory,authorID, authorName, avatarLink,postTime, true,imgLinkList));
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

    public boolean addNewPost(String postTitle, String postContent, String authorID, String categoryID ,String imgLink) throws Exception {
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
                if (imgLink != "")  {
                    sql = "INSERT INTO dbo.Images(imgLink)\n" +
                            "VALUES(?)\n" +
                            "\n" +
                            "INSERT INTO dbo.PostImage(postID,imgID)\n" +
                            "VALUES\n" +
                            "( (SELECT TOP (1) postID FROM dbo.PostInfo ORDER BY postTime DESC),\n" +
                            "  (SELECT TOP (1) imgID FROM dbo.Images ORDER BY imgID DESC)\n" +
                            ")";

                    stm = con.prepareStatement(sql);
                    stm.setString(1, imgLink);
                    row += stm.executeUpdate();

                }
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

    public static void main(String[] args) {
        try {
            String userID = "USE00000001";
            String category = "ALL";
            int offset = 0;
            List<PostDTO> postDTOList = new PostDAO().getPost(userID, category,offset);
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
