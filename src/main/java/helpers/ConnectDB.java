/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author phamn
 */
public class ConnectDB {
    public static Connection makeConnection() throws Exception{
        String connectionURL = "jdbc:sqlserver://localhost:1433;"
                + "databaseName=SE1603_DE160142;user=sa;password=123456";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection conn = DriverManager.getConnection(connectionURL);
        return conn;
    }
    
    public static void main(String[] args) {
        try {
            System.out.println( ConnectDB.makeConnection() );
        }
        catch (Exception e){
            e.getMessage();
        }
    }
}
