<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <%
            String type=request.getParameter("type");
            String number=request.getParameter("number");
            String password=request.getParameter("password");
            String username=request.getParameter("name");
            String email=request.getParameter("email");            
           
           try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aoopproject","root","");
           Statement st=con.createStatement();
           ResultSet rs=st.executeQuery("select * from account where email='"+email+"'");
           if(rs.isBeforeFirst()){
            out.println("<script>alert('Email already exists')</script>");
            response.sendRedirect("./registration.jsp");
           }
           PreparedStatement pst = con.prepareStatement("INSERT INTO account (username, password ,type, email) VALUES (?,?,?,?)");
           pst.setString(1, username);
           pst.setString(2, password);
           pst.setString(3, type);
           pst.setString(4, email);
           pst.executeUpdate();
           con.close();
           response.sendRedirect("./index.html");
           } catch (SQLException e){
            System.out.println(e);
           }
        %>
    </body>
</html>