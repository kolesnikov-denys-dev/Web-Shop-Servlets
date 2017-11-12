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

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

</head>

<body>

<!-- Navigation -->
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
                <li class="nav-item">
                    <a class="nav-link" href="mygoods">Мои товары</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Настройки</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Выход</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="col-lg-8 offset-2">
            <h1 class="mt-4">Редактировать объявление</h1>
            <hr>
            <%
                Goods yourGoods = (Goods) request.getAttribute("yourGoods");
            %>
            <form action="edit-goods" method="post">
                <p>Дата публикации: <% out.print(yourGoods.getTime()); %>
                    <% out.print(yourGoods.getDate()); %></p>
                Статус объявления:
                <%
                    int status = yourGoods.getPublished();
                    if (status == 1) {
                        out.print("<p class=\"published\">Опубликовано</p>");
                    } else {
                        out.print("<p class=\"no-published\">Не Опубликовано</p>");
                    }
                %>
                <p>Номер товара: <% out.print(yourGoods.getId()); %></p>
                Заголовок объявления: <input class="form-control input-lg" type="text" name="email"
                                             value="<% out.print(yourGoods.getTitle()); %>">
                Цена: <input rows="6" class="form-control" type="text" name="email"
                             value="<% out.print(yourGoods.getPrice()); %>">

                Описание товара:<textarea style="width: 90%" class="form-control" rows="10" cols="60">
                <% out.print(yourGoods.getDescription()); %></textarea>

                <input class="form-control" type="text" name="email" value="">
                Фотография: <input class="form-control" type="text" name="email"
                                   value="<% out.print(yourGoods.getPhoto()); %>">
                <input class="form-control" type="text" name="email"
                       value="<% out.print(yourGoods.getView_count()); %>">
            </form>

            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Сохранить и
                опубликовать
            </label>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Сохранить без
                публикации
            </label>
            <br>
            <button type="submit" class="btn btn-success ">Готово</button>
            <button type="submit" class="btn btn-danger" href="mygoods">Отмена</button>
            <hr>
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
