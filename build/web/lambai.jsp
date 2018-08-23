<%-- 
    Document   : lambai
    Created on : Jun 28, 2018, 10:12:46 PM
    Author     : UserPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sinh viên làm bài</title>
    </head>
    <body>
        <form method="POST" action="LamBaiServlet">

            Sinh Viên: <input type="text" name="txtUser" value="${username}">

            <h1>Câu hỏi thứ <input type="text" name="txtStt" size="2" value ="${sothutu}">
            </h1>
            <input type="text" name="txtCauhoi" size="70" value ="${cauhoi}"> <br> <br>
            Câu trả lời: <br>
            <input type="text" name="txtCautraloi" size="70" value ="${cautraloi}">  <br> <br>

            <td><input type="submit" name="btn" value="Back"></td>
            <td><input type="submit" name="btn" value="Next"></td>

        </form>
    </body>
</html>
