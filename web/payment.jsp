<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="./payment.css">
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
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
            <a style="font-weight: 700;font-size: 25px;margin-left: 20px" class="navbar-brand" href="./dashboard.jsp">ePathoLab</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link dashboard" href="./dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a style="font-weight: bold; color: black!important; border-bottom: 2px solid;" class="nav-link active" href="./dashboard.jsp">Payment</a>
                    </li>
                </ul>
                <ul class="navbar-nav d-flex align-items-center justify-content-end mb-2 mb-lg-0">
                    <li><a href='logout.jsp' class='btn btn-danger' style='margin-right:10px'>Logout</a></li>
                    <li style='font-weight: 500; font-size: 20px; margin-right: 20px'> <%= uname %> </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <% out.println("<form action='./payment2.jsp?id=" + request.getParameter("id") + "' method='POST'>"); %>
                <div class="form-group mb-2">
                    <div class="row">
                        <h1>Payment details</h1>
                    </div>
                    <div class="row">
                        <div class="col-4 pl-4">
                            <label for="" class="">Full Name</label>
                        </div>
                        <div class="col">
                            <input type="text" name="fullname" required>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Card Number</label>
                        </div>
                        <div class="col">
                            <input type="text" name='cardno' required>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Card Expiration Date</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='cardexpiry'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Card CVV</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='cvv'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Email</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='email'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Address</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='address'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">City</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='city'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Postal Code</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='postal'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Country</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='country'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-4">
                            <label for="">Phone Number</label>
                        </div>
                        <div class="col">
                            <input type="text" required name='phone'>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-2">
                    <div class="row">
                        <div class="col-6">
                            <input type="submit" value="Submit" class="btn btn-dark">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>