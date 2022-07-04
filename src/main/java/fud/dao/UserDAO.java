package fud.dao;

import fud.helpers.DBUtils;
import fud.model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private final String userDbName = "Users";
    private final String imageDbName = "Images";

    public UserDAO() {
    }
    public UserDTO login(String username, String password) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "SELECT *\n"
                        + "FROM " + userDbName + " AS U LEFT JOIN " + imageDbName + " AS I on U.avatarID = I.imgID\n "
                        + "WHERE [userName]=? AND [passwords]=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ps.setString(2, password);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullname = rs.getString("Fullname");
                    String avatarLink = rs.getString("imgLink");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    String gender = rs.getString("gender");
                    String location = rs.getString("locations");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    boolean status = rs.getBoolean("userStatus");


                    //TODO: PUT OTHER ATTRIBUTES INTO UserDTO
                    return new UserDTO(userID, password, username,
                            fullname, avatarLink, dateOfBirth,
                            gender, location, isAdmin, status);
                }
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

    public boolean checkUser(String username, String password) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            // loi tu thang nay
            con = DBUtils.makeConnection();
            System.out.println("con ga");


            //check username and password if exist
            if (con != null) {
                String sql = "select userName, passwords\n" +
                        "from " + userDbName + "\n" +
                        "where userName = ? and passwords = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);

                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public static void main(String[] args) {
        try {
            UserDTO user = new UserDAO().login("Admin", "admin");
            System.out.println("Username: " + user.getUsername() +
                    "\nPassword: " + user.getPassword() +
                    "\nstatus: " + user.isStatus() +
                    "\navatarLink :" + user.getAvatarLink() +
                    "\nFull Name: " + user.getFullname());
        } catch (Exception e){
            System.out.println("UserDAO LOGIN ERROR: " + e.getMessage());
        }
    }
}
