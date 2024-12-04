<%@ page import="entities.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Blog Post - Start Bootstrap Template</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-12" align="center">
            <table align="center" class="table table-hover">
                <tr>
                    <th>id</th>
                    <th>email</th>
                    <th>password</th>
                    <th>name</th>
                    <th>surname</th>
                    <th>age</th>
                    <th></th>
                    <th></th>
                </tr>
                <%
                    ArrayList<Users> users = (ArrayList<Users>) request.getAttribute("users");
                    for (Users u : users) {
                %>
                <tr>
                    <td><% out.print(u.getId()); %></td>
                    <td><% out.print(u.getEmail()); %></td>
                    <td><% out.print(u.getPassword()); %></td>
                    <td><% out.print(u.getName()); %></td>
                    <td><% out.print(u.getSurname()); %></td>
                    <td><% out.print(u.getAge()); %></td>
                    <td>
                        <form action="edituser" method="post">
                            <input type="hidden" name="idUser" value="<% out.print(u.getId()); %>">
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </form>
                    </td>
                    <td>
                        <form action="deleteuser" method="post">
                            <input type="hidden" name="idUser" value="<% out.print(u.getId()); %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>