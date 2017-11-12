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
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="modal.css">
</head>
<body>
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
                <%
                    if (null != request.getSession().getAttribute("login")) {
                %>
                <li class="nav-item active">
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
                <div class="col-lg-4 offset-2">
                    <button type="button" class="btn-new btn btn-warning btn-lg" data-toggle="modal" data-target="#myModal">
                        Новое объявление
                    </button>
                </div>


            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Новое объявление</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <%--ADD NEW--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="text" class="form-control input-lg" placeholder="Название">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control input-sm" placeholder="Стоимость">
                                </div>
                                <div class="col-md-6">
                                    <select class="form-control" name="category">
                                        <option value="0">Выбрать рубрику</option>
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
                            </div>
                            <div class="row">
                                <div class="col-md-12">

                                    <textarea class="form-control" rows="10" cols="50" id="message-text"
                                              placeholder="Описание..."></textarea>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="recipient-name" class="control-label">Recipient:</label>
                                        </div>
                                        <div class="form-group areaDesc">
                                            <label for="message-text" class="control-label">Message:</label>
                                        </div>


                                        <label class="radio-inline">
                                            <input type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                                   value="option1"> Сохранить и
                                            опубликовать
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                                   value="option2"> Сохранить без
                                            публикации
                                        </label>


                                    </form>


                                    <br>
                                </div>
                            </div>


                            <%--ADD NEW--%>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                            <button type="button" class="btn btn-primary">Сохранить</button>
                        </div>
                    </div>
                </div>
            </div>
            <%--modal--%>
            <br>
            <hr>
            <%
                ArrayList<Goods> MyListGoods = (ArrayList<Goods>) request.getAttribute("MyList");
                if (MyListGoods != null && MyListGoods.size() > 0) {
                    for (Goods g : MyListGoods) {
            %>
            <h3><% out.print(g.getTitle()); %></h3>
            <% if (g.getPublished() == 1) {
                out.print("<p class=\"published\">Объявление: опубликовано</p>");
            } else {
                out.print("<p class=\"no-published\">Объявление: не опубликовано</p>");
            }
            %>
            <p>Дата создания: <% out.print(g.getDate()); %> <% out.print(g.getTime()); %></p>
            <p>Номер товара # <% out.print(g.getId()); %></p>
            <p>Стоимость: <% out.print(g.getPrice()); %></p>
            <p>Описание товара: <% out.print(g.getDescription()); %></p>
            <p>Фотография: <% out.print(g.getPhoto()); %></p>
            <div class="form-inline">
                <form action="editgoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-primary editBtn" name="edit">Редактировать</button>
                </form>
                <form action="deletegoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-danger " name="delete">Удалить</button>
                </form>
                <p class="viewCout">Количество просмотров: <% out.print(g.getView_count()); %></p>
            </div>

            <hr>
            <%
                    }
                } else {
                    out.print("<p> Нет товаров !</p> ");
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
