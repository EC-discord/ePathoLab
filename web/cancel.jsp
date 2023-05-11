<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/aoopproject", "root", "");
    Statement s = conn.createStatement();
    s.executeUpdate("DELETE FROM appointment WHERE id=" + request.getParameter("appid"));
    response.sendRedirect("./dashboard.jsp");
%>