+<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aoopproject","root","");
    Statement st = con.createStatement();
    st.executeUpdate("UPDATE blood SET done='yes' WHERE id='" + request.getParameter("id") + "'");
    response.sendRedirect("./dashboard.jsp");
%>