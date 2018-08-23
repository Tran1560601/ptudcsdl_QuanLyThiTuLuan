<%-- 
    Document   : chitietbailam
    Created on : Jun 28, 2018, 10:11:56 PM
    Author     : UserPC
--%>

<%@page import="FileJava.CauHoiDB"%>
<%@page import="FileJava.CauHoi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết bài làm</title>
    </head>
    <body>
         <form method="POST" action="ChiTietBaiLamServlet">
            Giáo Viên: <input type="text" name="txtGV" value="<%= request.getParameter("gv")%>">
            Sinh Viên: <input type="text" name="txtSV" value="<%= request.getParameter("sv")%>">

            <h1>Câu hỏi thứ <input type="text" name="txtStt" size="2" value ="<%= request.getParameter("stt")%>">
            </h1>
            <%
                int stt = Integer.parseInt(request.getParameter("stt"));
                if (stt == 1) {
                    CauHoi c = CauHoiDB.LoadNoiDungCauHoi(request.getParameter("sv"), stt);
                    System.out.println(c.noidung);
            %>
                    <input type="text" name="txtCauhoi" size="70" value ="<%= c.noidung%>"> <br> <br>
                    Câu trả lời của Sinh viên: <br>
                    <input type="text" name="txtCautraloi" size="70" value ="<%= c.cautraloi%>">  <br> <br>
                    Câu trả lời chính xác: <br>
                    <input type="text" name="txtDapAn" size="70" value ="<%= c.dapan%>">  <br> <br>
            <%
                }
                if (stt != 1) {
            %>
                    <input type="text" name="txtCauhoi" size="70" value ="${cauhoi}"> <br> <br>
                    Câu trả lời của Sinh viên: <br>
                    <input type="text" name="txtCautraloi" size="70" value ="${cautraloicuasv}">  <br> <br>
                    Câu trả lời chính xác: <br>
                    <input type="text" name="txtDapAn" size="70" value ="${dapan}">  <br> <br>
            <%
                }
            %>
            <td><input type="submit" name="btn" value="Back"></td>
            <td><input type="submit" name="btn" value="Next"></td>
        </form>
    </body>
</html>
