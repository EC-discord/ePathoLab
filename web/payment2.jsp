<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>

<%  
    String fname = request.getParameter("fullname");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/aoopproject", "root", "");
    Statement s = conn.createStatement();
    s.executeUpdate("INSERT INTO payment (email, address, city, postalcode,country, phoneno, reportid) VALUES('" +
        session.getAttribute("email") + "', '"+request.getParameter("address")+
        "', '"+request.getParameter("city")+"', '"+request.getParameter("postal")+
        "', '"+request.getParameter("country")+"', '"+request.getParameter("phone")+
        "', '" + request.getParameter("id") + "')");
    out.println("<script>alert('payment complete');window.location='./dashboard.jsp'</script>");
%>

