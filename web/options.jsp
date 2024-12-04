<%@ page import="entities.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Profile Settings</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-lg-8 offset-2">
            <h1 class="mt-4">Profile Settings</h1>
            <hr>
            <%
                if (request.getSession().getAttribute("login") != null) {
                    Users x = (Users) request.getSession().getAttribute("login");
            %>
            <form action="updatepasswordbyid" method="post">
                <p>Email: <% out.print(x.getEmail()); %></p>
                <p>Full Name: <% out.print(x.getName()); %> <% out.print(x.getSurname()); %></p>
                <p>Age: <% out.print(x.getAge()); %></p>
                <h4>Change Password</h4>
                <%
                    if (request.getAttribute("pasAndRePas") != null) {
                        boolean pasAndRePas = (boolean) request.getAttribute("pasAndRePas");
                        if (!pasAndRePas){
                %> <p style="color: red">Passwords do not match</p> <%
                    }
                }
                if (request.getAttribute("curPas") != null) {
                    boolean curPas = (boolean) request.getAttribute("curPas");
                    if (!curPas){
            %> <p style="color: red">Current password is incorrect</p> <%
                    }
                }

                if (request.getAttribute("curPas") != null && request.getAttribute("pasAndRePas") != null){
                    boolean pasAndRePas = (boolean) request.getAttribute("pasAndRePas");
                    boolean curPas = (boolean) request.getAttribute("curPas");
                    if (pasAndRePas && curPas){
            %> <p style="color: green">Password has been changed</p> <%
                    }
                }
            %>
                <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                <input class="form-control set-size my-2" type="password" name="currentPassword"
                       placeholder="Current Password">
                <input class="form-control set-size my-2" type="password" name="newPassword" placeholder="New Password">
                <input class="form-control set-size my-2" type="password" name="reNewPassword"
                       placeholder="Repeat New Password">
                <br>
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="mygoods">
                    <button type="button" class="btn btn-danger">Cancel</button>
                </a>
            </form>
            <%
            } else {
            %>
            <p><a href="registration.jsp">Register</a></p>
            <%
                }
            %>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
