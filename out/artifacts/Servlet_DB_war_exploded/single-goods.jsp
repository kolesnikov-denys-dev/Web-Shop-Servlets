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
    <title>My Goods</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/blog-post.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="modal.css">
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <div class="col-lg-8 offset-2">
            <div class="form-inline">
                <div class="col-lg-6">
                    <h1 class="mt-4">My Goods</h1>
                </div>
            </div>
            <hr>
            <%
                Goods g = (Goods) request.getAttribute("currentGoodsId");
                if (g != null) {
            %>
            <h3><% out.print(g.getTitle()); %></h3>
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
            <p>Item Number # <% out.print(g.getId()); %></p>
            <p class="viewCoutMain">View Count: <% out.print(g.getView_count()); %></p>
            <p>Date Created: <% out.print(g.getDate()); %> <% out.print(g.getTime()); %></p>
            <p>Price: <% out.print(g.getPrice()); %></p>
            <p>Item Description: <% out.print(g.getDescription()); %></p>
            <p>Photo: <% out.print(g.getPhoto()); %></p>
            <%
                Users u = (Users) request.getSession().getAttribute("login");
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
                } else {
                    out.print("<p>No goods available!</p>");
                }
            %>
            <%
                if (request.getAttribute("commentsList") != null) {
                    ArrayList<Comments> list = (ArrayList<Comments>) request.getAttribute("commentsList");

            %>
            <h5>Comments</h5>
            <h6>Number of Comments: <% out.print(list.size()); %></h6>
            <hr>
            <%
                for (Comments c : list) {
            %>
            <div class="row">
                <div class="col-lg-1">
                    <img src="img/anonym.gif" alt="avatar" style="width: 50px; height: 50px; border-radius: 100%;">
                </div>
                <div class="col-lg-5 m-0 ">
                    <span>User: </span>
                    <p class="m-0"><% out.print(c.getUserName()); %> <% out.print(c.getUserSurname()); %></p>
                </div>
                <div class="col-lg-3 m-0 ">
                </div>
                <div class="col-lg-3 m-0 align">
                    <p class="m-0"><% out.print(c.getPostDate()); %></p>
                    <p class="m-0"><% out.print(c.getPostTime()); %></p>
                </div>
            </div>
            <h5 class="mt-3"><% out.print(c.getTitle());%></h5>
            <p><% out.print(c.getContent()); %></p>
            <hr>
            <% if (request.getSession().getAttribute("login") != null) {
                Users u = (Users) request.getSession().getAttribute("login");
                if (u != null && c.getId_user() == u.getId()) {
            %>
            <form action="deletecomments" method="get">
                <input type="hidden" name="idComment" value="<% out.print(c.getId());%>">
                <input type="hidden" name="idPost" value="<% out.print(g.getId());%>">
                <button type="submit" class="btn btn-danger " name="delete">Delete</button>
            </form>
            <%
                            }
                        }
                    }
                }
            %>
            <form action="postcomments" method="get">
                <div class="row">
                    <div class="col-md-12">
                        <input type="hidden" value="<% out.print(g.getId()); %>" name="currentId">
                        <input type="text" class="form-control input-lg" name="title" placeholder="Comment Title">
                    </div>
                    <div class="col-md-12">
                        <textarea class="form-control" rows="7" cols="30" id="message-text"
                                  name="content" placeholder="Comment..."></textarea>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" name="post">Post Comment</button>
            </form>
        </div>
        <hr>
    </div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>