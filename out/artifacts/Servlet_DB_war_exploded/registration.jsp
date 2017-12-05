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
        <div class="col-12">
            <div align="center">
                <h1>Барахолка</h1>
                <hr>
                <h2 align="center">Регистрация</h2>
                <form action="addUser" method="post">
                    <input <% if (request.getAttribute("lastEmail")!=null) {out.print("value=\""+ request.getAttribute("lastEmail")+"\"");}%>class="form-control m-2 set-size"
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
                    <input class="form-control set-size m-2" type="password" name="password" placeholder="Пароль">
                    <input class="form-control set-size m-2" type="password" name="password2" placeholder="Подтверждение пароля">
                    <input <% if (request.getAttribute("lastName")!=null) {out.print("value=\""+ request.getAttribute("lastName")+"\"");}%>class="form-control set-size m-2"
                           type="text" name="name" placeholder="Имя">
                    <input <% if (request.getAttribute("lastSur")!=null) {out.print("value=\""+ request.getAttribute("lastSur")+"\"");}%>class="form-control set-size m-2"
                           type="text" name="surname" placeholder="Фамилия">
                    <input <% if (request.getAttribute("lastAge")!=null) {out.print("value=\""+ request.getAttribute("lastAge")+"\"");}%>class="form-control set-size m-2"
                           type="number" name="age" placeholder="Возраст">
                    <a href="login.jsp">
                        <button type="button" class="btn btn-primary">Вход</button>
                    </a>
                    <button type="submit" class="btn btn-success">Регистрация</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>




































