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
                        result.add( new PostDTO(postID, postTitle, postContent, postCategory,authorID, authorName, avatarLink,postTime, true));
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

    public static void main(String[] args) {
        try {
            String userID = "USE00000001";
            String category = "ALL";
            int offset = 0;
            List<PostDTO> postDTOList = new PostDAO().getPost(userID, category,offset);
            for (PostDTO postDTO: postDTOList){
                System.out.println("Post ID: " + postDTO.getPostID()
                + "\nPost Status: " + postDTO.getPostStatus());
            }
        } catch (Exception e){
            System.out.println("PostDAO ERROR: " + e.getMessage());
        }
    }
}
