package validate;

import helpers.ConnectDB;
import model.UserLoginError;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Validation {
    public UserLoginError checkLoginEmpty(String username, String password) {
        UserLoginError err = new UserLoginError("");
        if (username.trim().isEmpty() || password.trim().isEmpty()) {
            err.setUserLoginErr("Username or password is empty!");
        }
        return err;
    }

//    public boolean checkLogin(String username, String password) throws SQLException, Exception {
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//
//        try {
//            // connect to database
//            conn = ConnectDB.makeConnection();
//
//            if (conn != null) {
//                // tao truy van de lay ten hoc sinh
//                String sql = "select Student_ID from Student_DE160142\n"
//                        + "where Student_ID = ?";
//
//                // tao truy van
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, Student_ID);
//                rs = stm.executeQuery();
//
//                while (rs.next()) {
//                    return true;
//                }
//            }
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                rs.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return false;
//    }
}
