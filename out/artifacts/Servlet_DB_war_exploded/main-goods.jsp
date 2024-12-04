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
    <title>Goods</title>
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
            <h1 class="mt-4">All Goods</h1>
            <form action="allgoods" method="get">
                <div class="form-group search-form">
                    <div class="row">
                        <div class="col-lg-4 col-sm-6 p-sm-2">
                            <input class="form-control" type="search" name="search" value="" placeholder="Search">
                        </div>
                        <div class="col-lg-4 col-sm-6 p-sm-2">
                            <select class="form-control" name="category">
                                <option value="0">All Goods</option>
                                <option value="1">Kids' World</option>
                                <option value="2">Real Estate</option>
                                <option value="3">Transportation</option>
                                <option value="4">Auto Parts</option>
                                <option value="5">Jobs</option>
                                <option value="6">Pets</option>
                                <option value="7">Home and Garden</option>
                                <option value="8">Electronics</option>
                                <option value="9">Business and Services</option>
                                <option value="10">Fashion and Style</option>
                                <option value="11">Hobbies, Leisure, and Sports</option>
                            </select>
                        </div>
                        <div class="col-lg-4 col-sm-12 p-sm-2">
                            <button type="submit" class="btn btn-primary">Show Goods</button>
                        </div>
                    </div>
                </div>
            </form>
            <hr>
            <%
                ArrayList<Goods> MyListGoods = (ArrayList<Goods>) request.getAttribute("AllGo");
            %>
            <p>Number of listings found: <% out.print(MyListGoods.size());%></p>
            <%
                if (MyListGoods != null && MyListGoods.size() > 0) {
                    for (Goods g : MyListGoods) {
            %>
            <div class="row">
                <div class="col-lg-2">
                    <a href="/opengoods?currentId=<% out.print(g.getId()); %>" class="btn btn-warning">Details</a>
                </div>
                <div class="col-lg-7">
                    <h3><% out.print(g.getTitle()); %></h3>
                </div>
            </div>

            <% if (g.getPublished() == 1) {
                out.print("<p class=\"published\">Listing: Published</p>");
            } else {
                out.print("<p class=\"no-published\">Listing: Not Published</p>");
            }
            %>
            <p>Category:
                <%
                    String categories[] = {"Undefined", "Kids' World", "Real Estate", "Transportation", "Auto Parts", "Jobs", "Pets", "Home and Garden", "Electronics", "Business and Services", "Fashion and Style", "Hobbies, Leisure, and Sports"};
                    out.print(categories[g.getCategory()]);
                %>
            </p>
            <%--<p>Author: <% out.print(u.getName());%>  <% %></p>--%>
            <p>Item ID # <% out.print(g.getId()); %></p>
            <p class="viewCoutMain">View Count: <% out.print(g.getView_count()); %></p>
            <p>Date Created: <% out.print(g.getDate()); %> <% out.print(g.getTime()); %></p>
            <p>Price: <% out.print(g.getPrice()); %></p>
            <p>Description: <% out.print(g.getDescription()); %></p>
            <p>Photo: <% out.print(g.getPhoto()); %></p>
            <%
                if (u != null) {
                    if (u.getId() == g.getId_user()) {
            %>
            <div class="form-inline">
                <form action="editgoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-primary editBtn" name="edit">Edit</button>
                </form>
                <form action="deletegoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-danger " name="delete">Delete</button>
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
                    out.print("<p>No goods available!</p>");
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
