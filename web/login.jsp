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
                <h2 align="center">Вход</h2>
                <form action="loginuser" method="get">
                    <input class="form-control set-size m-2" type="email" name="email" placeholder="Емейл" autofocus>

                    <input class="form-control set-size m-2" type="password" name="password" placeholder="Пароль">
                    <button type="submit" class="btn btn-success">Вход</button>
                    <a href="/registration.jsp">
                        <button type="button" class="btn btn-primary">Регистрация</button>
                    </a>
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





















