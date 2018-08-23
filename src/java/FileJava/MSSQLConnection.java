/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileJava;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author UserPC
 */
public class MSSQLConnection {
    private String DB_NAME;
    private String DB_USERNAME;
    private String DB_PASSWORD;

    public MSSQLConnection(){
        this.DB_NAME = "DoAn";
        this.DB_USERNAME = "sa";
        this.DB_PASSWORD = "123";
    }
    public Connection getConnection() {
        Connection conn = null;
        try {
//Establish the connection
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(getMyUrl(), this.DB_USERNAME , this.DB_PASSWORD);
            if(conn != null)
                System.out.println("thanh cong");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    private String getMyUrl(){
        return "jdbc:sqlserver://localhost" + "; databaseName="+DB_NAME;
    }
}
