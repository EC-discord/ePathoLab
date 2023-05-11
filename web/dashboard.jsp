<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./dashboard.css">
    </head>

    <body>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <%
            String uname = "";
            String type = "";
            if (!(session.getAttribute("isLoggedIn") == null)) {
             uname = (String) session.getAttribute("username");
             type = (String) session.getAttribute("type");
            } else {
                response.sendRedirect("./index.html");
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/aoopproject", "root", "");
            Statement s = conn.createStatement();
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
            <a class="navbar-brand" href="./dashboard.jsp">ePathoLab</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active dashboard" href="./dashboard.jsp">Dashboard</a>
                    </li>
                </ul>
                <ul class="navbar-nav d-flex align-items-center justify-content-end mb-2 mb-lg-0">
                    <li><a href='logout.jsp' class='btn btn-danger' style='margin-right:10px'>Logout</a></li>
                    <li style='font-weight: 500; font-size: 20px; margin-right: 20px'> <%= uname %> </li>
                </ul>
            </div>
        </nav>
        <%
        if (type.equals("patient")) {
            ResultSet rs = s.executeQuery("SELECT * FROM account, appointment WHERE account.email='"
                + session.getAttribute("email") + "' AND account.email=appointment.email");
            out.println("<div class='h3 heading'>Your Appointments</div>" +    
            "<div class='container'>" +
                "<div class='row mb-4'>" +
                    "<div class='col-sm-12'>" +
                        "<a type='submit' class='btn btn-success w-100' href='./appointment.jsp'>Schedule an Appointment</a>" +
                    "</div>" +
                "</div>" +
                "<div class='row mb-4'>");
            if (rs.isBeforeFirst()) {
                while(rs.next()) {
                    out.println("<div class='col-sm-3'>" +
                    "<div class='card' style='width: 15rem;'>" +
                        "<div class='card-img-top' style='height: 100px; background-color: rgb(87, 87, 255);'></div>" +
                        "<div class='card-body'>" +
                            "<h5 class='card-title'>Appointment No.: " + rs.getString(5) + "</h5>" +
                            "<p class='card-text'>Doctor: " + rs.getString(8) + "</p>" +
                            "<p class='card-text'>Time: " + rs.getString(7) + "</p>" +
                            "<form action='./cancel.jsp'>" +
                            "<input type='hidden' name='appid' value=" + rs.getString(5) + ">" +
                            "<button type='submit' class='btn btn-primary mb-1'>Cancel</button>" +
                            "</form>" +
                        "</div>" +
                      "</div>" +
                    "</div>");
                }
            }
            else {
                out.println("<b>You have no appointments scheduled.</b>");
            }
            out.println("</div>" + "</div>");
            out.println("<div class='h3 heading'>Your Lab Test Reports</div>");
            rs = s.executeQuery("SELECT * FROM account, blood WHERE account.email='"
                + session.getAttribute("email") + "' AND account.email=blood.email");
            out.println("<div class='container'>");
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
            out.println("<div class='row mb-4'>" +
                "<div class='col-sm-3'>" +
                    "<div class='card' style='width: 15rem;'>" +
                        "<div class='card-img-top' style='height: 100px; background-color: rgb(87, 87, 255);'></div>" +
                        "<div class='card-body'>" +
                            "<h5 class='card-title'>Lab Test Report No.: " + rs.getString(5) + "</h5>" +
                            "<p class='card-text'>Blood CP</p>" +
                            "<a href='./viewReport.jsp?id=" + rs.getString(5) + "' class='btn btn-primary'>View</a>");
                            Statement s2 = conn.createStatement();
                            ResultSet rs2 = s2.executeQuery("SELECT * FROM payment WHERE email='" + session.getAttribute("email") + "' AND reportid=" + rs.getString(5));
                            if (!rs2.isBeforeFirst()) {
                                rs2.next();
                                out.println("<a href='./payment.jsp?id=" + rs.getString(5) + "' class='btn btn-success'>Pay</a>");
                             }
                            if (rs.getString(17).equals("no"))
                                out.println("<a href='./forward.jsp?id=" + rs.getString(5) + "' class='btn btn-warning'>Forward to Doctor</a>");
                        out.println("</div>" +
                    "</div>" +
                "</div>" +
            "</div>" +
            "</div>");
            }
            } else {
                out.println("<b>No Test Reports yet</b>");
            }
        } else if (type.equals("lab staff")) {
            ResultSet rs = s.executeQuery("SELECT * FROM account, blood WHERE account.email='"
                + session.getAttribute("email") + "' AND account.email=blood.createdBy");
            out.println("<div class='h3 heading'>Lab Test Reports</div>");
            out.println("<div class='container'>" +
                        "<div class='row mb-4'>" +
                        "<div class='col-sm-12'>" +
                            "<a href='./selectTest.jsp' class='btn btn-success w-100'>Create a new Report</a>" +
                        "</div>" +
                    "</div><div class='row mb-4'>");
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
            out.println("<div class='col-sm-3'>" +
                    "<div class='card' style='width: 15rem;'>" +
                        "<div class='card-img-top' style='height: 100px; background-color: rgb(87, 87, 255);'></div>" +
                        "<div class='card-body'>" +
                            "<h5 class='card-title'>Lab Test Report No.: " + rs.getString(5) + "</h5>" +
                            "<p class='card-text'>Blood CP</p>" +
                            "<a href='./viewReport.jsp?id=" + rs.getString(5) + "' class='btn btn-primary'>View</a>" +
                        "</div>" +
                    "</div>" +
                "</div>");
            }
            out.println("</div>");
            }
        } else if (type.equals("doctor")) {
            ResultSet rs = s.executeQuery("SELECT * FROM account, appointment WHERE doctor='"
                + session.getAttribute("username") + "' AND account.email=appointment.email");
            out.println("<div class='h3 heading'>Your Appointments</div>" +    
            "<div class='container'>" +
                "<div class='row mb-4'>");
            if (rs.isBeforeFirst()) {
                while(rs.next()) {
                    out.println("<div class='col-sm-3'>" +
                    "<div class='card' style='width: 15rem;'>" +
                        "<div class='card-img-top' style='height: 100px; background-color: rgb(87, 87, 255);'></div>" +
                        "<div class='card-body'>" +
                            "<h5 class='card-title'>Appointment No.: " + rs.getString(5) + "</h5>" +
                            "<p class='card-text'>Patient: " + rs.getString(1) + "</p>" +
                            "<p class='card-text'>Time: " + rs.getString(7) + "</p>" +
                            "<form action='./cancel.jsp'>" +
                            "<input type='hidden' name='appid' value=" + rs.getString(5) + ">" +
                            "<button type='submit' class='btn btn-primary'>Mark as done</button>" +
                            "</form>" +
                        "</div>" +
                      "</div>" +
                    "</div>");
                }
            }
            out.println("</div>" + "</div>");
            rs = s.executeQuery("SELECT * FROM account, blood WHERE account.username='"
                + session.getAttribute("username") + "' AND forwarded='yes' AND done='no'");
            out.println("<div class='h3 heading'>Lab Test Reports</div>");
            out.println("<div class='container'>");
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                out.println("<div class='row mb-4'>" +
                "<div class='col-sm-3'>" +
                    "<div class='card' style='width: 15rem;'>" +
                        "<div class='card-img-top' style='height: 100px; background-color: rgb(87, 87, 255);'></div>" +
                        "<div class='card-body'>" +
                            "<h5 class='card-title'>Lab Test Report No.: " + rs.getString(5) + "</h5>" +
                            "<p class='card-text'>Blood CP</p>" +
                            "<a href='./viewReport.jsp?id=" + rs.getString(5) + "' class='btn btn-primary'>View</a>" +
                            "<a href='./done.jsp?id=" + rs.getString(5) + "' class='btn btn-success'>Mark as Done</a>" +
                        "</div>" +
                    "</div>" +
                "</div>" +
            "</div>" +
            "</div>");
            }
            } else {
                out.println("<b>No Test Reports yet</b>");
            }
        }
        %>
    </body>