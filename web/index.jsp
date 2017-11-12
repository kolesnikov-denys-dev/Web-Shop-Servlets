<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Goods" %>
<%@ page import="entities.Users" %>
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Барахолка</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="allgoods">Все товары
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <%
                    if (null != request.getSession().getAttribute("login")) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="mygoods">Мои товары</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="options.jsp">Настройки</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Выход</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-12" align="center">
            <h1>Барахолка</h1>
            <hr>
            <h2 align="center">Admin Panel</h2>

            <a href="mygoods">Мой список товаров!</a>

            <%
                if (null != request.getSession().getAttribute("login")) {
                    Users x = (Users) request.getSession().getAttribute("login");
                    out.print("<h4>" + "Welcome: " + x.getName() + " " + x.getSurname());
                    out.print("");
                } else {
                    out.print("<h4> Welcome Anonum <a href=\"login.jsp\">Login</a></h4>");
                    out.print("");
                }
            %>
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
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Барахолка 2017</p>
    </div>
</footer>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>










































