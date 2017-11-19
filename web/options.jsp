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
                if (request.getSession().getAttribute("login")!=null) {
                    Users x = (Users) request.getSession().getAttribute("login");
            %>
            <form action="updatepasswordbyid" method="post">
                <p>Email: <% out.print(x.getEmail()); %></p>
                <p>Ф.И: <% out.print(x.getName()); %> <% out.print(x.getSurname()); %></p>
                <p>Возраст: <% out.print(x.getAge()); %></p>
                <h4>Изменить пароль</h4>
                <%
                   if (request.getAttribute("pasAndRePas")!=null) {
                       boolean pasAndRePas = (boolean) request.getAttribute("pasAndRePas");
                       if (pasAndRePas!=true){
                           %> <p style="color: red">Пароли не совпадают</p> <%
                       }
                   }

                    if (request.getAttribute("curPas")!=null) {
                        boolean curPas = (boolean) request.getAttribute("curPas");
                        if (curPas!=true){
                            %> <p style="color: red">Текущий пароль не верный</p> <%
                        }
                    }

                if (request.getAttribute("curPas")!=null && request.getAttribute("pasAndRePas")!=null){
                    boolean pasAndRePas = (boolean) request.getAttribute("pasAndRePas");
                    boolean curPas = (boolean) request.getAttribute("curPas");
                    if (pasAndRePas && curPas){
                         %> <p style="color: green">Пароль изменен</p> <%
                    }
                }

            %>
                <input type="hidden" name="idUser" value="<% out.print(x.getId()); %>">
                <input class="form-control set-size my-2" type="password" name="currentPassword"
                       placeholder="Текущий пароль">
                <input class="form-control set-size my-2" type="password" name="newPassword" placeholder="Новый пароль">
                <input class="form-control set-size my-2" type="password" name="reNewPassword"
                       placeholder="Повторите пароль">
                <br>
                <button type="submit" class="btn btn-primary">Сохранить</button>
                <a href="mygoods">
                    <button type="button" class="btn btn-danger">Отмена</button>
                </a>
            </form>
            <%
            } else {
            %>
            <p><a href="registration.jsp">Зарегистрируйтесь</a></p>
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
