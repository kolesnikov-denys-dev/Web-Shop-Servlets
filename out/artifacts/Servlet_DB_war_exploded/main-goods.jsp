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
    <title>Товары</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<%
    Users u = (Users) request.getSession().getAttribute("login");
%>
<div class="container">
    <div class="row">
        <div class="col-lg-2 col-sm-0">
        </div>
        <div class="col-lg-8 col-sm-12">
            <h1 class="mt-4">Все товары</h1>
            <form action="allgoods" method="get">
                <div class="form-group search-form">
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 p-sm-2">
                            <input class="form-control" type="search" name="search" value="" placeholder="Поиск">
                        </div>
                        <div class="col-lg-4 col-sm-6 p-sm-2">
                            <select class="form-control" name="category">
                                <option value="0">Все товары</option>
                                <option value="1">Детский мир</option>
                                <option value="2">Недвижимость</option>
                                <option value="3">Транспорт</option>
                                <option value="4">Запчасти для транспорта</option>
                                <option value="5">Работа</option>
                                <option value="6">Животные</option>
                                <option value="7">Дом и сад</option>
                                <option value="8">Электроника</option>
                                <option value="9">Бизнес и услуги</option>
                                <option value="10">Мода и стиль</option>
                                <option value="11">Хобби, отдых и спорт</option>
                            </select>
                        </div>
                        <div class="col-lg-4 col-sm-12 p-sm-2">
                            <button type="submit" class="btn btn-primary">Показать товары</button>
                        </div>
                    </div>
                </div>
            </form>
            <hr>
            <%
                ArrayList<Goods> MyListGoods = (ArrayList<Goods>) request.getAttribute("AllGo");
            %>
            <p>Найдено объявления по вашему запросу: <% out.print(MyListGoods.size());%></p>
            <%
                if (MyListGoods != null && MyListGoods.size() > 0) {
                    for (Goods g : MyListGoods) {
            %>
            <div class="row">
                <div class="col-lg-2">
                    <a href="/opengoods?currentId=<% out.print(g.getId()); %>" class="btn btn-warning">Подробнее</a>
                </div>
                <div class="col-lg-7">
                    <h3><% out.print(g.getTitle()); %></h3>
                </div>
            </div>

            <% if (g.getPublished() == 1) {
                out.print("<p class=\"published\">Объявление: опубликовано</p>");
            } else {
                out.print("<p class=\"no-published\">Объявление: не опубликовано</p>");
            }
            %>
            <p>Рубрика:
                <%
                    String rybrika[] = {"Не определена", "Детский мир", "Недвижимость", "Транспорт", "Запчасти для транспорта", "Работа", "Животные", "Дом и сад", "Электроника", "Бизнес и услуги", "Мода и стиль", "Хобби, отдых и спорт"};
                    out.print(rybrika[g.getCategory()]);
                %>
            </p>
            <%--<p>Автор: <% out.print(u.getName());%>  <% %></p>--%>
            <p>Номер товара # <% out.print(g.getId()); %></p>
            <p class="viewCoutMain">Количество просмотров: <% out.print(g.getView_count()); %></p>
            <p>Дата создания: <% out.print(g.getDate()); %> <% out.print(g.getTime()); %></p>
            <p>Стоимость: <% out.print(g.getPrice()); %></p>
            <p>Описание товара: <% out.print(g.getDescription()); %></p>
            <p>Фотография: <% out.print(g.getPhoto()); %></p>
            <%
                if (u != null) {
                    if (u.getId() == g.getId_user()) {
            %>
            <div class="form-inline">
                <form action="editgoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-primary editBtn" name="edit">Редактировать</button>
                </form>
                <form action="deletegoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-danger " name="delete">Удалить</button>
                </form>
            </div>
            <%
                    }
                }
            %>
            <hr>
            <%
                    }
                } else {
                    out.print("<p> Нет товаров !</p> ");
                }
            %>
        </div>
        <div class="col-lg-2 col-sm-0">
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
