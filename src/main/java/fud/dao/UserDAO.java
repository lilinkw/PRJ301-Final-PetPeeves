package fud.dao;

import fud.helpers.DBUtils;
import fud.model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                        + "WHERE [userName]=? AND [password]=?";
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

    public String createImageAccount(String imageLink) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();

            // insert imageLink to Images first
            // then create new account
            if (con != null) {
                String sql = "insert into Images \n" +
                        "output Inserted.imgID\n" +
                        "values (\n" +
                        "\t?\n" +
                        ")";

                stm = con.prepareStatement(sql);
                stm.setString(1, imageLink);

                rs = stm.executeQuery();
            }
            if (rs.next()) {
                // return only 1 result, whether are there multiple results or not
                String imgID = rs.getString("imgID");

                return imgID;
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
        return null;
    }
    public boolean createNewAccount(String username, String password, String fullname, String gender, String birthday, String location, String imageLink) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {

                String sql = "insert into Users\n" +
                        "values (\n" +
                        "\t?, ?, ?, ?, ?, ?, 0, 1, ?\n" +
                        ")";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, createImageAccount(imageLink));
                stm.setString(4, birthday);
                stm.setString(5, gender);
                stm.setString(6, location);
                stm.setString(7, fullname);

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
     * create new Account without image
     * @param username
     * @param password
     * @param fullname
     * @param gender
     * @param birthday
     * @param location
     * @return
     * @throws Exception
     */
    public boolean createNewAccount(String username, String password, String fullname, String gender, String birthday, String location) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();
            String defaultImageID = "IMG00000001";

            // create new student
            if (con != null) {

                String sql = "insert into Users\n" +
                        "values (\n" +
                        "\t?, ?, ?, ?, ?, ?, 0, 1, ?\n" +
                        ")";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, defaultImageID);
                stm.setString(4, birthday);
                stm.setString(5, gender);
                stm.setString(6, location);
                stm.setString(7, fullname);

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
                        "SET [password] = ?\n" +
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

    public UserDTO getUserInfoByUserID(String userID) throws Exception{
        //TODO: return a UserDTO
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();
            if (con != null) {
                String sql = "SELECT *\n"
                        + "FROM " + userDbName + " AS U LEFT JOIN " + imageDbName + " AS I on U.avatarID = I.imgID\n "
                        + "WHERE [userID] = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("userName");
                    String fullname = rs.getString("Fullname");
                    String avatarLink = rs.getString("imgLink");
                    String dateOfBirth = rs.getString("dateOfBirth");
                    String gender = rs.getString("gender");
                    String location = rs.getString("locations");
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    boolean status = rs.getBoolean("userStatus");
                    int followerAmount = getUserFollowerAmount(userID);
                    int followeeAmount = getUserFolloweeAmount(userID);

                    return new UserDTO(userID, username,
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

    /**
     * get the amount of follower (Number of people that follow this account) via userID
     * This method is only used by This (UserDAO) class methods. Can not be used outside
     * @param userID ID of user that need to get the amount of follower
     * @return the amount of follower if @userID exist. -1 otherwise
     * @throws Exception
     */
    private int getUserFollowerAmount(String userID) throws Exception{
        int result = 0;
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
        int result = 0;
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

    public boolean isUserFollowed(String followerID, String followeeID) throws Exception{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();

            //check username existed
            if (con != null) {
                String sql = "SELECT *\n" +
                        "FROM " + followingDbName + "\n" +
                        "WHERE userID = ? and followeeId = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, followerID);
                ps.setString(2, followeeID);


                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public List<UserDTO> getUsersByName(String name) throws SQLException {
        List<UserDTO> result = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = new DBUtils().makeConnection();

            //check username existed
            if (con != null) {
                String sql = "select * \n" +
                        "FROM " + userDbName + " LEFT JOIN " + imageDbName + " on Users.avatarID = Images.imgID\n" +
                        "where fullName like ?\n";
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + name + "%");

                rs = ps.executeQuery();
                while (rs.next()) {
                    // TODO: fix account has been deactived showing

                    // show account that has not been deactived only
                    boolean status = rs.getBoolean("userStatus");
                    if (status) {
                        String userID = rs.getString("userID");
                        String fullname = rs.getString("fullName");
                        String avatarLink = rs.getString("imgLink");
                        String gender = rs.getString("gender");
                        String location = rs.getString("locations");
                        boolean isAdmin = rs.getBoolean("isAdmin");

                        result.add( new UserDTO(userID, fullname, avatarLink, gender, location, isAdmin, true));
                    }
                }
                return result;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean updateAvartarByUserID(String userID,String imgLink) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = new DBUtils().makeConnection();

            // create new student
            if (con != null) {
                String sql = "UPDATE dbo.Users \n" +
                        "SET avatarID =?\n" +
                        "WHERE userID=?";

                stm = con.prepareStatement(sql);
                stm.setString(1,createImageAccount(imgLink));
                stm.setString(2, userID);

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
//        try {
//            String userID = "USE00000003";
//            UserDTO userDTO = new UserDAO().getUserInfoByUserID(userID);
//            System.out.println("userID: " + userDTO.getUserID());
//            System.out.println("userName: " + userDTO.getUsername());
//            System.out.println("follower: " + userDTO.getFollowerAmount());
//            System.out.println("followee: " + userDTO.getFolloweeAmount());
//            System.out.println("password: " + userDTO.getPassword());
//        } catch (Exception e){
//            System.out.println("UserDAO getUserInfoByUserIDERROR: " + e.getMessage());
//        }
//        try {
//            String followerID = "USE00000001";
//            String followeeID = "USE00000006";
//            boolean test = new UserDAO().isUserFollowed(followerID, followeeID);
//            System.out.println(test);
//        } catch (Exception e){
//            System.out.println("UserDAO isUserFollowed ERROR: " + e.getMessage());
//        }

//        try{
//            String name = "B";
//            List<UserDTO> result = new UserDAO().getUsersByName(name);
//            for (int i=0; i< result.size(); i++) {
//                System.out.println(result.get(i).getFullname());
//            }
//        } catch (Exception e) {
//
//        }
    }
}
