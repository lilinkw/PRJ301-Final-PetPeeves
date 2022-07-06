package fud.dao;

import fud.helpers.DBUtils;
import fud.model.CategoryDTO;
import fud.model.PostDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
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
}
