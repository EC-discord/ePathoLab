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
        <title>Test Form</title>
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
                            <td colspan="6" style="text-align: center; color: black"><h2><u><b>Test Report</b></u></h2></td>

                        </tr>
                        <tr>
                            <td colspan="3">Name:<input type="text" name="patientName"></td>
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
                                <td colspan="3">Lipid Profile</td>
                            </tr>
                            <tr>
                                <td>Cholesterol</td>
                                <td>
                                    <input type="text" name="result1">
                                </td>
                                <td>
                                    Desirable <5.2 
                                    <br>
                                    Moderate 5.2 - 6.2
                                    <br>
                                    High risk > 6.2
                                </td>
                            </tr>
                            <tr>
                                <td>Triglycerides</td>
                                <td>
                                    <input type="text" name="result2">
                                </td>
                                <td>
                                    Desirable 0.4 - 1.6 
                                    <br>
                                    Borderline 1.7 - 2.2
                                    <br>
                                    High risk 2.3 - 5.6
                                </td>
                            </tr>
                            <tr>
                                <td>HDL cholesterol</td>
                                <td>
                                    <input type="text" name="result3">
                                </td>
                                <td>
                                    Desirable > 1.3
                                </td>
                            </tr>
                            <tr>
                                <td>LDL Cholesterol</td>
                                <td>
                                    <input type="text" name="result4">
                                </td>
                                <td>
                                    Optimal < 2.59
                                    <br>
                                    Near/Above Optimal 2.60 - 3.34
                                    <br>
                                    Borderline 3.37 - 4.12
                                    <br>
                                    High risk 4.15 - 4.90
                                </td>
                            </tr>
                            <tr>
                                <td>VLDL</td>
                                <td>
                                    <input type="text" name="result5">
                                </td>
                                <td>
                                    0 - 0.78
                                </td>
                            </tr>
                            <tr style="text-align: center" >
                                <td colspan="3">Report authorized by: <input type="text" name="result6"></td> 
                            </tr>
                            <tr>
                                <td colspan="3"> <center><button class="button1" id="submit" type="submit" name="submit" value="">Submit </button></center></td>
                        <tr>
                        </tr>
                        </tbody>
                </table>
            </form>
        </div>
        <%
           String patientName= request.getParameter("patientName");
           String patientAge= request.getParameter("patientAge");
           String result1= request.getParameter("result1");
           String result2= request.getParameter("result2");
           String result3= request.getParameter("result3");
           String result4= request.getParameter("result4");
           String result5= request.getParameter("result5");
           String result6= request.getParameter("result6");
            
            try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aoopproject","root","");

           
          PreparedStatement pst = con.prepareStatement("INSERT INTO lipid (PatientName, Age,Cholesterol ,Triglycerides,HDL ,LDL,VLDL, Doctor) VALUES (?,?,?,?,?,?,?,?)");
          pst.setString(1, patientName);
          pst.setString(2, patientAge);
          pst.setString(3, result1);
          pst.setString(4, result2);
          pst.setString(5, result3);
          pst.setString(6, result4);
          pst.setString(7, result5);
          pst.setString(8, result6);
          pst.executeUpdate();
          //con.close(); 
          out.println("Inserted Successfully!");
         } catch (SQLException e){
           System.out.println(e);
         }
        
        %>
    </body>
</html>
