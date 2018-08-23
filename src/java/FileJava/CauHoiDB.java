/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FileJava;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author UserPC
 */
public class CauHoiDB {
     public static CauHoi LoadCH(String user, int sothutu) {
        try {
            CauHoi c = new CauHoi();
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            String sql = "SELECT stt, noidungcauhoi FROM CauHoi WHERE stt=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, sothutu);
            ResultSet rs = pst.executeQuery();
            TraLoi tl = TLDB.LoadCTL(user, sothutu);
            // nếu sv đã trả lời thì biến cautraloi tạm ở class CauHoi = câu trl của sv
            if (tl.cautraloi != "") {
                c.cautraloi = tl.cautraloi;
            }
            while (rs.next()) {
                c.stt = rs.getInt("stt");
                c.noidung = rs.getString("noidungcauhoi");
            }
            con.close();
            return c;
        } catch (Exception ex) {
            return null;
        }
    }

    public static CauHoi LoadNoiDungCauHoi(String user, int stt) {
        try {
            CauHoi c = new CauHoi();
            MSSQLConnection db = new MSSQLConnection();
            Connection con = db.getConnection();
            String sql = "SELECT* FROM CauHoi WHERE stt = ?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setInt(1, stt);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                c.stt = rs.getInt("stt");
                c.noidung = rs.getString("noidungcauhoi");
                c.dapan = rs.getString("cautraloichinhxac");
                
                // làm như bên dưới mà không làm query cho 2 bảng (CauHoi & TraLoi) cùng 1 lúc
                // tránh trường hợp sv không trả lời sẽ không load được câu hỏi và đáp án
                String sql2 = "SELECT cautraloi FROM TraLoi WHERE username = ? AND stt = ? ";
                PreparedStatement pst2 = con.prepareStatement(sql2);
                pst2.setString(1, user);
                pst2.setInt(2, stt);
                ResultSet rs2 = pst2.executeQuery();
                while (rs2.next()) {
                    c.cautraloi = rs2.getString("cautraloi");   // câu trả lời của 1 sinh viên truyền tham số vào
                }
            }
            con.close();
            return c;
        } catch (Exception ex) {
            return null;
        }
    }


//    public static void main(String[] args) {
//        CauHoi c = CauHoiDB.LoadChiTietCauTraLoi("a", 1);
//        System.out.println(c.noidung); 
//        System.out.println(c.cautraloi); 
//        System.out.println(c.dapan); 
//    } 
}
