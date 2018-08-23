/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileJava;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author UserPC
 */
public class Users {
    public String userName;
    public String passWord;

    public Users(String username, String password) {
        this.userName = username;
        this.passWord = password;
    }

    public int isValid() {
        int loai = 0;
        try {
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            Statement st = con.createStatement();
            String sql = "SELECT loai FROM TaiKhoan where username='"+ this.userName +"' and password='"+ this.passWord +"'";
            
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
               loai = rs.getInt("loai");
            }
            con.close();
            return loai;
        } catch (Exception ex) {
            return 0;
        }
    }
//    public static void main(String[] args) {
//        Users db = new Users("a","1");
//        System.out.println(db.isValid()); 
//    } 
}
