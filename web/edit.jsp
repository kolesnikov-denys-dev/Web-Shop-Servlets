<%@ page import="entities.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%
    Users x = (Users) request.getAttribute("userById");
%>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div align="center">
                <h1>Барахолка</h1>
                <hr>
                <h3>Edit User</h3>

                <form action="filedownload" method="post" enctype="multipart/form-data">
                    <input type="file" name="file">
                    <button type="submit" class="btn btn-success">Upload</button>
                </form>
                <form action="updateuser" method="post">
                    <input class="form-control" type="text" name="email" value="<% out.print(x.getEmail()); %>">
                    <input class="form-control" type="text" name="password"
                           value="<% out.print(x.getPassword()); %>">
                    <input class="form-control" type="text" name="name" value="<% out.print(x.getName()); %>">
                    <input class="form-control" type="text" name="surname"
                           value="<% out.print(x.getSurname()); %>">
                    <input class="form-control" type="text" name="age" value="<% out.print(x.getAge()); %>">
                    <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                    <a href="pages">
                        <button class="btn btn-danger">Cancel</button>
                    </a>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
