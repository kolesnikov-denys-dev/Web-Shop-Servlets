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
                <li class="nav-item ">
                <%
                    if (null != request.getSession().getAttribute("login")) {
                %>
                    <a class="nav-link" href="mygoods">Мои товары</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Настройки</a>
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
        <div class="col-lg-8 offset-2">
            <h1 class="mt-4">Настройки профиля</h1>
            <hr>
            <%
                if (null != request.getSession().getAttribute("login")) {
                    Users x = (Users) request.getSession().getAttribute("login");
            %>
            <form action="updateuser" method="post">
                <input class="form-control" type="text" name="email" value="<% out.print(x.getEmail()); %>">
                <input class="form-control" type="text" name="password"
                       value="<% out.print(x.getPassword()); %>">
                <input class="form-control" type="text" name="name" value="<% out.print(x.getName()); %>">
                <input class="form-control" type="text" name="surname"
                       value="<% out.print(x.getSurname()); %>">
                <input class="form-control" type="text" name="age" value="<% out.print(x.getAge()); %>">
                <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                <button type="submit" class="btn btn-primary">Сохранить</button>
                <a href="pages">
                    <button class="btn btn-danger">Отмена</button>
                </a>
            </form>
            <%
            }
            else {
            out.print("Зарегистрируйтесь");
            }
            %>
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
