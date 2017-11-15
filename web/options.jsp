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
<jsp:include page="navigation.jsp"></jsp:include>
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
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
