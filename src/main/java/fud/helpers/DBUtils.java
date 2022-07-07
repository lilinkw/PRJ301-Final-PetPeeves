/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fud.helpers;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author phamn
 */
public class DBUtils {

    // Change userID here
    public final String userID = "sa";
    // Change password here
    public final String password = "123456789";
    // Change database name here
    public final String dbName = "Final_PetPeeves";

    public Connection makeConnection() throws Exception {

        String connectionUrl = "jdbc:sqlserver://localhost:1433;"
                + "databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con;
        con = DriverManager.getConnection(connectionUrl, userID, password);
        return con;
    }

    public static void main(String[] args){
        try{
            Connection con = new DBUtils().makeConnection();
            System.out.println(con);
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
