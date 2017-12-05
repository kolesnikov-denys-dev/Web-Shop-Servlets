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
<jsp:include page="navigation.jsp"></jsp:include>
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
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
