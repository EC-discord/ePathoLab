<%-- 
    Document   : TestForm
    Created on : 2 Jan 2023, 21:50:06
    Author     : Aqsa Tariq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blood CP</title>
    </head>
    <style>
        body {
            margin: 0;
            background-color: #cdcdbb;
            font-family: system-ui;
            font-style: oblique;
            font-size: large;
            font-weight: 100;
            height: 100%;
        }

        .container {
            position: absolute;
            top: 60%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 2px solid #2D3D34;
        }

        table {
            width: 900px;
            border-collapse: collapse;
            overflow: hidden;
            box-shadow: 12px 12px 2px 1px rgba(64, 103, 77, 0.2);
        }

        th,
        td {
            padding: 15px;
            background-color: #858067  ;
            color: white;
            border: 1px solid #2D3D34;
        }

        th {
            text-align: left;
        }

        thead {
            th {
                background-color: #FBEEE6  ;
            }
        }

        tbody {
            tr {
                &:hover {
                    background-color: #FBEEE6  ;
                }
            }
            td {
                position: relative;
                &:hover {
                    &:before {
                        content: "";
                        position: absolute;
                        left: 0;
                        right: 0;
                        top: -9999px;
                        bottom: -9999px;
                        background-color: #FBEEE6;
                        z-index: -1;
                    }
                }
            }
        }
        a {
            text-decoration: none;
            color:#fdf2b3;
            font-weight: bolder;
        }
    </style>
    <body>
        <div class="container">
            <form method="post" >
                <table>
                    <thead>
                        <tr>
                            <td colspan="6" style="text-align: center; color: black"><h2><u><b>Blood CP</b></u></h2></td>
                        </tr>
                        <tr>
                            <td colspan="3">Name:<input type="text" name="patientName"></td>
                        </tr>
                        <tr>
                            <td colspan="3">Email:<input type="email" name="patientEmail"></td>
                        </tr>
                        <tr>
                            <td colspan="3">Age:<input type="text" name="patientAge"></td>
                        </tr>

                    <trs>
                        <th><b>Test Name</b></th>
                        <th><b>Result</b></th>
                        <th><b>Reference Interval</b></th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="3">Blood Counts:</td>
                            </tr>
                            <tr>
                                <td>TLC</td>
                                <td>
                                    <input type="text" name="result1">
                                </td>
                                <td>
                                    4 - 10
                                </td>
                            </tr>
                            <tr>
                                <td>RBC</td>
                                <td>
                                    <input type="text" name="result2">
                                </td>
                                <td>
                                    3.80 - 5.80
                                </td>
                            </tr>
                            <tr>
                                <td>HCT</td>
                                <td>
                                    <input type="text" name="result3">
                                </td>
                                <td>
                                    13 - 17
                                </td>
                            </tr>
                            <tr>
                                <td>MCV</td>
                                <td>
                                    <input type="text" name="result4">
                                </td>
                                <td>
                                    40 - 52
                                </td>
                            </tr>
                            <tr>
                                <td>Monocytes</td>
                                <td>
                                    <input type="text" name="result5">
                                </td>
                                <td>
                                    76 - 96
                                </td>
                            </tr>
                            <tr>
                                <td>Lymphocytes</td>
                                <td>
                                    <input type="text" name="result6">
                                </td>
                                <td>
                                    20 - 40
                                </td>
                            </tr>
                            <tr style="text-align: center" >
                                <td colspan="3">Report authorized by: <input type="text" name="result7"></td> 
                            </tr>
                            <tr>
                                <td colspan="3"><center>  <button class="button1" id="submit" type="submit" name="submit" value="">Submit </button></center></td>
                        <tr>
                        </tr>
                        </tbody>
                </table>
            </form>
        </div>
        <%
            String patientName= request.getParameter("patientName");
            String patientEmail= request.getParameter("patientEmail");
            String createdBy= (String) session.getAttribute("createdBy");
            String patientAge= request.getParameter("patientAge");
            String result1= request.getParameter("result1");
            String result2= request.getParameter("result2");
            String result3= request.getParameter("result3");
            String result4= request.getParameter("result4");
            String result5= request.getParameter("result5");
            String result6= request.getParameter("result6");
            String result7= request.getParameter("result7");
            
             try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aoopproject","root","");
           PreparedStatement pst = con.prepareStatement("INSERT INTO blood (PatientName, Age, TLC ,RBC,HCT, MVC,Monocytes,Lymphocytes,Doctor,email,createdBy,forwarded,done) VALUES (?,?,?,?,?,?,?,?,?,?,?,'no','no')");
           pst.setString(1, patientName);
           pst.setString(2, patientAge);
           pst.setString(3, result1);
           pst.setString(4, result2);
           pst.setString(5, result3);
           pst.setString(6, result4);
           pst.setString(7, result5);
           pst.setString(8, result6);
           pst.setString(9, result7);
           pst.setString(10, patientEmail);
           pst.setString(11, (String) session.getAttribute("email"));
           pst.executeUpdate();
           con.close();           

          } catch (SQLException e){
            System.out.println(e);
          } 
        %>
    </body>
</html>
