<%-- 
    Document   : dssvlambai
    Created on : Jun 28, 2018, 10:12:20 PM
    Author     : UserPC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="FileJava.TLDB"%>
<%@page import="FileJava.TraLoi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách sinh viên làm bài</title>
    </head>
    <body>
        <h1>Giáo viên: ${username}</h1>
        <p> Danh sách sinh viên làm bài </p>
        <p>
            <%
                ArrayList<TraLoi> kq = TLDB.LoadDSSVTraLoi();
                    for (TraLoi sv : kq) {
                         %>
                <p>         
                <td><a href="chitietbailam.jsp?gv=${username}&sv=<%= sv.username %>&stt=1 "> <%= sv.username %> </a> </td>
                </p>
            <%            
                    }
                %>
            </form>
            <p>    <a href="login.jsp">Back to login page</a>   </p>
        </p>
    </body>
</html>
