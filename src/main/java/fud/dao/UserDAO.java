package fud.dao;

import fud.helpers.DBUtils;
import fud.model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
            con = DBUtils.makeConnection();

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

    public boolean isUserExisted(String username) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.makeConnection();

            //check username existed
            if (con != null) {
                String sql = "select userName\n" +
                        "from " + userDbName + "\n" +
                        "where userName = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);

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

    public boolean createNewAccount(String username, String password, String fullname, String gender, String birthday, String location, String image) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtils.makeConnection();

            // create new student
            if (con != null) {

                if (image == "") {
                    String sql = "insert into Users\n" +
                            "values (\n" +
                            "\t?, ?, null, ?, ?, ?, 0, 1, ?\n" +
                            ")";

                    stm = con.prepareStatement(sql);
                    stm.setString(1, username);
                    stm.setString(2, password);
                    stm.setString(3, birthday);
                    stm.setString(4, gender);
                    stm.setString(5, location);
                    stm.setString(6, fullname);
                } else {
                    String sql = "insert into Users\n" +
                            "values (\n" +
                            "\t?, ?, ?, ?, ?, ?, 0, 1, ?\n" +
                            ")";

                    stm = con.prepareStatement(sql);
                    stm.setString(1, username);
                    stm.setString(2, password);
                    stm.setString(3, image);
                    stm.setString(4, birthday);
                    stm.setString(5, gender);
                    stm.setString(6, location);
                    stm.setString(7, fullname);
                }

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

    /**
     * Update Current user info via userID
     *
     * @param userID userID of current user
     * @param fullName current user full name
     * @param dateOfBirth current user date of birth
     * @param gender current user gender
     * @param location current user location
     * @return true of user info updated, false otherwise
     * @throws Exception
     */
    public boolean updateUserInfo(String userID, String fullName, String dateOfBirth, String gender, String location ) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "UPDATE Users\n" +
                        "SET [fullName]= ?, [dateOfBirth] = ?, [gender] = ?, [locations] = ?\n" +
                        "WHERE [userID] = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, fullName);
                ps.setString(2, dateOfBirth);
                ps.setString(3, gender);
                ps.setString(4, location);
                ps.setString(5, userID);
                int row = ps.executeUpdate();

                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null){
                ps.close();
            }
            if (con != null){
                con.close();
            }
        }
        return false;
    }
    public static void main(String[] args) {
//        try {
//            UserDTO user = new UserDAO().login("Admin", "admin");
//            System.out.println("Username: " + user.getUsername() +
//                    "\nPassword: " + user.getPassword() +
//                    "\nstatus: " + user.isStatus() +
//                    "\navatarLink :" + user.getAvatarLink() +
//                    "\nFull Name: " + user.getFullname());
//        } catch (Exception e){
//            System.out.println("UserDAO LOGIN ERROR: " + e.getMessage());
//        }
        try {
        boolean test = new UserDAO().updateUserInfo("USE00000001", "Admin", "2002-08-30", "male", "Quang Nam");

        } catch (Exception e){
            System.out.println("UserDAO LOGIN ERROR: " + e.getMessage());
        }
    }
}
