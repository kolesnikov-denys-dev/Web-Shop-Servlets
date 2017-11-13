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
        <a class="navbar-brand" href="allgoods">Барахолка</a>
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
        <div class="col-lg-8 offset-2">
            <h1 class="mt-4">Настройки профиля</h1>
            <hr>
            <%
                if (null != request.getSession().getAttribute("login")) {
                    Users x = (Users) request.getSession().getAttribute("login");
            %>
            <form action="updatepasswordbyid" method="post">
                <p>Email: <% out.print(x.getEmail()); %></p>
                <p>Ваше Ф.И: <% out.print(x.getName()); %> <% out.print(x.getSurname()); %></p>
                <p>Возраст: <% out.print(x.getAge()); %></p>

                <h4>Изменить пароль</h4>
                <%
                    if (request.getAttribute("errorPassword")!=null){
                    boolean exist = (boolean) request.getAttribute("errorPassword");
                    if (exist) {
                        out.print("<h4 style='color:red;'> Ошибка! </h4>");
                    }else {
                        out.print("<h4 style='color:green;'> Пароль изменен! </h4>");
                    }
                    }
                %>
                <p>Текущий пароль: </p> <input class="form-control set-size" type="password" name="currentPassword">
                <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                <p>Новый пароль: </p> <input class="form-control set-size" type="password" name="newPassword">
                <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                <p>Повторите пароль: </p> <input class="form-control set-size" type="password" name="reNewPassword">
                <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                <br>
                <button type="submit" class="btn btn-primary">Сохранить</button>
                <a href="mygoods"><button type="button" class="btn btn-danger">Отмена</button></a>
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
