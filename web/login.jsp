<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging in</title>
    </head>
    <%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/aoopproject", "root", "");
        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM account WHERE email='"
                + request.getParameter("email") + "' AND password='"
                + request.getParameter("password") + "'");
        if (rs.isBeforeFirst()) {
            rs.next();
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("username", rs.getString(1));
            session.setAttribute("email", rs.getString(4));
            session.setAttribute("type", rs.getString(3));
            response.sendRedirect("./dashboard.jsp");
        } else {
            out.println("<script>alert('Invalid email or password');window.location='./index.html';</script>");
        }
    %>
</html>
