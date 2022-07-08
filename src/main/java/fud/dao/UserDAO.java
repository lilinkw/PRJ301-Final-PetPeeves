package fud.dao;

import fud.helpers.DBUtils;
import fud.model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private final String userDbName = "[Users]";
    private final String imageDbName = "[Images]";
    private final String followingDbName = "[Followings]";

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
                    int followerAmount = getUserFollowerAmount(userID);
                    int followeeAmount = getUserFolloweeAmount(userID);

                    return new UserDTO(userID, password, username,
                            fullname, avatarLink, dateOfBirth,
                            gender, location, isAdmin, status,
                            followerAmount, followeeAmount);
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
            con = new DBUtils().makeConnection();

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
            con = new DBUtils().makeConnection();

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
            con = new DBUtils().makeConnection();

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
     * @return true if user info updated, false otherwise
     * @throws Exception
     */
    public boolean updateUserInfo(String userID, String fullName, String dateOfBirth, String gender, String location ) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "UPDATE " + userDbName + " \n" +
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

    /**
     * Update user password via userID
     * @param userID Current User ID
     * @param password User new password
     * @return true if success. False otherwise
     * @throws Exception
     */
    public boolean updateUserPassword(String userID, String password) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "UPDATE " + userDbName + " \n" +
                        "SET [passwords] = ?\n" +
                        "WHERE [userID] = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, password);
                ps.setString(2, userID);
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

    public UserDTO getUserInfoByUserID(String userID){
        //TODO: return a UserDTO
        return null;
    }

    /**
     * get the amount of follower (Number of people that follow this account) via userID
     * This method is only used by This (UserDAO) class methods. Can not be used outside
     * @param userID ID of user that need to get the amount of follower
     * @return the amount of follower if @userID exist. -1 otherwise
     * @throws Exception
     */
    private int getUserFollowerAmount(String userID) throws Exception{
        int result = -1;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null){
                String resultColumnName = "followerAmount";
                String sql = "SELECT COUNT(userID) as " + resultColumnName + "\n" +
                        "FROM " + followingDbName + "\n" +
                        "WHERE followeeId = ?\n" +
                        "GROUP BY followeeId";
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();

                if (rs.next()){
                    result = rs.getInt(resultColumnName);
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
        return result;
    }

    /**
     * get the amount of followee (Number of people that this account follow ) via userID
     * This method is only used by This (UserDAO) class methods. Can not be used outside
     * @param userID ID of user that need to get the amount of followee
     * @return the amount of followee if @userID exist. -1 otherwise
     * @throws Exception
     */
    private int getUserFolloweeAmount(String userID) throws Exception{
        int result = -1;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null){
                String resultColumnName = "followeeAmount";
                String sql = "SELECT COUNT(followeeId) as " + resultColumnName + "\n" +
                        "FROM " + followingDbName +"\n" +
                        "WHERE userID = ?\n" +
                        "GROUP BY userID";
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();

                if (rs.next()){
                    result = rs.getInt(resultColumnName);
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
        return result;
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
//        try {
//        boolean test = new UserDAO().updateUserInfo("USE00000001", "Admin", "2002-08-30", "male", "Quang Nam");
//
//        } catch (Exception e){
//            System.out.println("UserDAO LOGIN ERROR: " + e.getMessage());
//        }
//        try {
//            boolean test = new UserDAO().updateUserPassword("USE00000001", "admin");
//
//        } catch (Exception e){
//            System.out.println("UserDAO updateUserPassword ERROR: " + e.getMessage());
//        }

//        try {
//            String userID = "USE00000003";
//            int followerAmount = new UserDAO().getUserFolloweeAmount(userID);
//            System.out.println("Number Followee of " + userID + " is: " + followerAmount);
//        } catch (Exception e){
//            System.out.println("UserDAO getUserFolloweeAmount ERROR: " + e.getMessage());
//        }
    }
}
