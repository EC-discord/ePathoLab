<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList, java.util.Random, java.time.OffsetDateTime, java.sql.*" %>
<%
    Random r = new Random();
    String time = Integer.toString(r.nextInt(25) + 1);
    OffsetDateTime d = OffsetDateTime.now();
    String date = d.getDayOfMonth() + "/" + d.getMonthValue() + "/" + d.getYear();
    session.setAttribute("time", time);
    session.setAttribute("date", date);
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/aoopproject", "root", "");
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery("SELECT * FROM account WHERE type='doctor'");
    ArrayList<String> doctorNames = new ArrayList<String>();
    if (rs.isBeforeFirst()) {
        while (rs.next()) {
            doctorNames.add(rs.getString(1));
        }
    }
    s.executeUpdate("INSERT INTO appointment (date, time, doctor, email) VALUES ('"
            + date + "', '" + time + ":00', '" + doctorNames.get(r.nextInt(doctorNames.size())) + "', '" + 
            session.getAttribute("email") + "')");
    response.sendRedirect("./dashboard.jsp");
%>
