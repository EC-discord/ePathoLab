<link href="./navbar.css" rel="stylesheet">
<%
    String uname = "";
    String type = "";
    boolean isLoggedIn = false;
    if (!(session.getAttribute("isLoggedIn") == null)) {
     uname = (String) session.getAttribute("username");
     type = (String) session.getAttribute("type");
     isLoggedIn = (boolean) session.getAttribute("isLoggedIn");
    } else {
        response.sendRedirect("./index.html");
    }
%>
<script src="./bootstrap/js/bootstrap.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <a class="navbar-brand" href="#">ePathoLab</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active dashboard" href="#">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./payment.jsp">Payment</a>
            </li>
        </ul>
        <ul class="navbar-nav d-flex align-items-center justify-content-end mb-2 mb-lg-0">
            <%
                out.println("<li><a href='logout.jsp' class='btn btn-danger' style='margin-right:10px'>Logout</a></li>");
                out.println("<li style='font-weight: 500; font-size: 20px'>" + uname + "</li>");
            %>
            <li class="nav-item">
                <a class="nav-link ml-auto" href="./index.html"><img src="./up.png" class="picon"></a>
            </li>
        </ul>
    </div>
</nav>