<%@ page import="entities.Goods" %>
<%@ page import="entities.Users" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Comments" %>
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
    <link rel="stylesheet" href="modal.css">
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
                    <a class="nav-link active" href="allgoods">Все товары
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <%
                    if (null != request.getSession().getAttribute("login")) {
                %>
                <li class="nav-item">
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
        <div class="col-lg-8 offset-2">
            <div class="form-inline">
                <div class="col-lg-6">
                    <h1 class="mt-4">Мои товары</h1>
                </div>
            </div>


            <hr>
            <%
                Goods g = (Goods) request.getAttribute("currentGoodsId");
                if (g != null) {
            %>
            <h3><% out.print(g.getTitle()); %></h3>
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
                Users u = (Users) request.getSession().getAttribute("login");
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
                } else {
                    out.print("<p> Нет товаров !</p> ");
                }
            %>
            <%--------------------------------------------------------%>
            <h5>Коментарии </h5>
            <hr>
            <%
                if (request.getAttribute("commentsList")!=null){
                ArrayList<Comments> list = (ArrayList<Comments>) request.getAttribute("commentsList");

               %>
            <h6> Количество комментариев: <% out.print(list.size()); %></h6>
            <%

                 for (Comments c:list){
                    %>
                    <p>Пользователь:  <% out.print(c.getUserName()); %></p>
                    <p>Когда написал: <% out.print(c.getUserSurname()); %></p>
                    <p><% out.print(c.getContent()); %></p>
            <hr>
            <%
                }}

            %>
            <%--------------------------------------------------------%>
            <form action="postcomments" method="get">
                    <div class="row">
                        <div class="col-md-12">
                            <input type="hidden" value="<% out.print(g.getId()); %>" name="currentId" >
                            <input type="text" class="form-control input-lg" name="title"  placeholder="Заголовок комментария">
                        </div>
                        <div class="col-md-12">
                                        <textarea class="form-control" rows="7" cols="30" id="message-text"
                                                  name="content" placeholder="Комментарий..."></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" name="delete">Коментировать</button>
            </form>
        </div>
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
