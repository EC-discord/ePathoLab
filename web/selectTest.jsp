<!DOCTYPE html>
<html>
    <head>
        <title>Lab Test</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
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
                top: 50%;
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
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <td colspan="6" style="text-align: center; font-style: italic;"><h2><b>LAB TESTS</b></h2></td>

                    </tr>
                <trs>
                    <th><b>Sr No</b></a></th>
                    <th><b>Test Name</b></th>
                    <th><b>Sample Required</b></th>
                    <th><b>Volume</b></th>
                    <th><b>Turnaround Time</b></th>
                    <th><b>Price(PKR)</b> </th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><a href="TestForm.jsp">Blood CP</td>
                            <td>Plasma</td>
                            <td>3-5 ml</td>
                            <td>5 hours</td>
                            <td>200</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="TestForm1.jsp">Liver Profile</td>
                            <td>Plasma</td>
                            <td>3-5 ml</td>
                            <td>5 hours</td>
                            <td>200</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><a href="TestForm2.jsp">Liver Function Test</td>
                            <td>Serum</td>
                            <td>4 ml</td>
                            <td>5 hours</td>
                            <td>300</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><a href="TestForm3.jsp">Renal Function Test</td>
                            <td>Serum</td>
                            <td>4 ml</td>
                            <td>5 hours</td>
                            <td>300</td>

                        </tr>
                        <tr>
                    </tbody>
            </table>
        </div>
         </body>
</html>