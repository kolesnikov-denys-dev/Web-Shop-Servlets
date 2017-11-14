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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="allgoods">Барахолка</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <%
                    Users u = (Users) request.getSession().getAttribute("login");
                    if (u == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link text-warning" href="loginuser">Новое объявление
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <% } %>
                <li class="nav-item active">
                    <a class="nav-link" href="allgoods">Все товары
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <%

                    if (null != request.getSession().getAttribute("login")) {
                %>
                <li class="nav-item ">
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
                    <form action="opengoods" method="post">
                        <input type="hidden" name="currentId" value="<% out.print(g.getId()); %>"></input>
                        <button type="submit" class="btn btn-warning" name="delete">Подробнее</button>
                    </form>




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
                    switch (g.getCategory()) {
                        case 0: {
                            out.print("Не определена");
                        }
                        break;
                        case 1: {
                            out.print("Детский мир");
                        }
                        break;
                        case 2: {
                            out.print("Недвижимость");
                        }
                        break;
                        case 3: {
                            out.print("Транспорт");
                        }
                        break;
                        case 4: {
                            out.print("Запчасти для транспорта");
                        }
                        break;
                        case 5: {
                            out.print("Работа");
                        }
                        break;
                        case 6: {
                            out.print("Животные");
                        }
                        break;
                        case 7: {
                            out.print("Дом и сад");
                        }
                        break;
                        case 8: {
                            out.print("Электроника");
                        }
                        break;
                        case 9: {
                            out.print("Бизнес и услуги");
                        }
                        break;
                        case 10: {
                            out.print("Мода и стиль");
                        }
                        break;
                        case 11: {
                            out.print("Хобби, отдых и спорт");
                        }
                        break;
                    }
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
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Барахолка 2017</p>
    </div>
</footer>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
