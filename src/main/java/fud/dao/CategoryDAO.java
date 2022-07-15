package fud.dao;

import fud.helpers.DBUtils;
import fud.model.CategoryDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
    private final String categoryTbName = "[Category]";
    public List<CategoryDTO> getCategoryList() throws Exception{
        List<CategoryDTO> result = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM dbo.Category";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                while (rs.next()) {
                        String categoryId = rs.getString("categoryID");
                        String category = rs.getString("category");

                        result.add( new CategoryDTO(categoryId,category));
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
    public CategoryDTO addNewCategory(String category) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "INSERT INTO Category\n" +
                        "output Inserted.categoryID, Inserted.category\n" +
                        "VALUES (\n" +
                        "    ?\n" +
                        ")";
                stm = con.prepareStatement(sql);
                stm.setString(1, category);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String categoryId = rs.getString( "categoryId");
                    return new CategoryDTO(categoryId, category);
                }
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (stm != null){
                stm.close();
            }
            if (con != null){
                con.close();
            }
        }

        return null;
    }

    public CategoryDTO changeCategory(String categoryID , String category) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "update Category\n" +
                        "set category = ?\n" +
                        "output inserted.categoryID, inserted.category\n" +
                        "where categoryID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, category);
                stm.setString(2, categoryID);

                rs = stm.executeQuery();

                while (rs.next()) {
                    return new CategoryDTO(categoryID, category);
                }
            }
        } finally {
            if (rs != null){
                rs.close();
            }
            if (stm != null){
                stm.close();
            }
            if (con != null){
                con.close();
            }
        }

        return null;
    }

    public boolean deleteCategoryByID(String categoryID) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "DELETE FROM " + categoryTbName + "\n" +
                        "WHERE categoryID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, categoryID);
                int row = ps.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public static void main(String[] args) {
        try {
            String categoryID = "CAT00000006";
            String category = "a";

            CategoryDAO abc = new CategoryDAO();
            CategoryDTO categoryDTO = abc.changeCategory(categoryID , category);

            System.out.println(categoryDTO == null);

            System.out.println(categoryDTO.getCategoryID());
            System.out.println(categoryDTO.getCategory());
        } catch (Exception e){
            System.out.println("PostDAO ERROR: " + e.getMessage());
        }
//        try {
//            new CategoryDAO().deleteCategoryByID("CAT00000006");
//        } catch (Exception e){
//            System.out.println("CategoryDAO deleteCategoryByID ERROR: " + e.getMessage());
//        }
    }
}
