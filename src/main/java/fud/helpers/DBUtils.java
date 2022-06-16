package fud.helpers;


import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtils {
    // Change userID here
    public static final String userID = "sa";
    // Change password here
    public static final String password = "123456789";
    // Change database name here
    public static final String dbName = "SE1603_DE160198";

    public static Connection makeConnection() throws Exception {

        String connectionUrl = "jdbc:sqlserver://localhost:1433;"
                + "databaseName=" + dbName;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con;
        con = DriverManager.getConnection(connectionUrl, userID, password);
        return con;
    }

    public static void main(String[] args){
        try{
            System.out.println(DBUtils.makeConnection());
        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
