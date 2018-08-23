/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileJava;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author UserPC
 */
public class TLDB {
    public static TraLoi LoadCTL(String user, int sothutu) {
        try {
            TraLoi tl = new TraLoi();
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            String sql = "SELECT cautraloi FROM TraLoi WHERE username = ? AND stt=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, user);
            pst.setInt(2, sothutu);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                tl.cautraloi = rs.getString("cautraloi");
            }
            con.close();
            return tl;
        } catch (Exception ex) {
            return null;
        }
    }
    
    // Cập nhật câu trả lời khi sv đã trả lời câu hỏi
    public static int CapNhat(String user, int stt, String cautl) {
        try {
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            String sql = "Update TraLoi set cautraloi=? where username = ? AND stt=?";
            PreparedStatement pst = con.prepareStatement(sql);

            // Tuong ung voi cac tham so "?" tren cau lenh Update
            pst.setString(1, cautl);
            pst.setString(2, user);
            pst.setInt(3, stt);
            int k = pst.executeUpdate();
            con.close();
            return k;
        } catch (Exception ex) {
            return 0;
        }
    }
    
    public static ArrayList LoadDSSVTraLoi() {
        try {
            ArrayList dssv = new ArrayList();
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            String sql = "SELECT DISTINCT username FROM TraLoi";
            PreparedStatement pst = con.prepareStatement(sql);
            
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                TraLoi tl = new TraLoi();
                tl.username = rs.getString("username");
                dssv.add(tl);
            }
            con.close();
            return dssv;
        } catch (Exception ex) {
            return null;
        }
    }
    
    
    // Thêm câu trả lời khi sv chưa trả lời câ hỏi
    public static int Them(TraLoi s) {
        try {
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            String sql = "INSERT INTO TraLoi ( username, stt, cautraloi ) VALUES(?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, s.username);
            pst.setInt(2, s.stt);
            pst.setString(3, s.cautraloi);
            int k = pst.executeUpdate();
            con.close();
            return k;
        } catch (Exception ex) {
            return 0;
        }
    }
    
    
    
//    public static void main(String[] args) {
//        TraLoi t = new TraLoi("a",1,"ad s"); 
//        System.out.println(TLDB.Them(t)); 
//    } 
}
