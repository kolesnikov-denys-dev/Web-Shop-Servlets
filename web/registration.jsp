<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Goods" %>
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
        <div class="col-12">
            <div align="center">
                <h1>Барахолка</h1>
                <hr>
                <h2 align="center">Регистрация</h2>
                <form action="addUser" method="post">
                    <input <% if (request.getAttribute("lastEmail")!=null) {out.print("value=\""+ request.getAttribute("lastEmail")+"\"");}%>class="form-control"
                           type="email" name="email" placeholder="Емейл" autofocus>
                    <%
                        boolean exist = false;
                        if (request.getAttribute("emailExist") != null) {
                            exist = (boolean) request.getAttribute("emailExist");
                            if (exist) {
                                out.print("<h4 style='color:red;'> Такой Email занят!</h4>");
                            }
                        }
                    %>
                    <input class="form-control" type="password" name="password" placeholder="Пароль">
                    <input class="form-control" type="password" name="password2" placeholder="Подтверждение пароля">
                    <input <% if (request.getAttribute("lastName")!=null) {out.print("value=\""+ request.getAttribute("lastName")+"\"");}%>class="form-control"
                           type="text" name="name" placeholder="Имя">
                    <input <% if (request.getAttribute("lastSur")!=null) {out.print("value=\""+ request.getAttribute("lastSur")+"\"");}%>class="form-control"
                           type="text" name="surname" placeholder="Фамилия">
                    <input <% if (request.getAttribute("lastAge")!=null) {out.print("value=\""+ request.getAttribute("lastAge")+"\"");}%>class="form-control"
                           type="number" name="age" placeholder="Возраст">
                    <br>
                    <a href="login.jsp">
                        <button type="button" class="btn btn-primary">Вход</button>
                    </a>
                    <button type="submit" class="btn btn-success">Регистрация</button>
                </form>
            </div>
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




































