<%@ page import="java.util.ArrayList" %>
<%@ page import="entities.Goods" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>My Listings</title>
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
                    <h1 class="mt-4">My Listings</h1>
                </div>
                <%
                    boolean login = false;
                    login = (boolean) request.getAttribute("userOnline");
                %>
                <%
                    if (login) {
                %>
                <div class="col-lg-4 offset-2">
                    <button type="button" class="btn-new btn btn-warning btn-lg" data-toggle="modal"
                            data-target="#myModal">
                        New Listing
                    </button>
                </div>
                <% } %>
            </div>
            <!-- Modal -->
            <% if (login) { %>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">New Listing</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <%--ADD NEW--%>
                            <form action="addnewgoods" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="text" class="form-control input-lg" placeholder="Title"
                                               name="title">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control input-sm" placeholder="Price ₴"
                                               name="price">
                                    </div>
                                    <div class="col-md-6">
                                        <select class="form-control" name="category">
                                            <option value="0">Select Category</option>
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
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <textarea class="form-control" rows="10" cols="50" id="message-text"
                                                  name="description" placeholder="Description..."></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <label class="radio-inline">
                                            <input type="radio" name="published" id="inlineRadio1"
                                                   value="ok"> Save and Publish
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="published" id="inlineRadio2"
                                                   value="no"> Save Without Publishing
                                        </label>
                                        <br>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary editBtn">Ready</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%--modal--%>
            <% } %>
            <br>
            <hr>
            <%
                ArrayList<Goods> MyListGoods = (ArrayList<Goods>) request.getAttribute("MyList");
            %><p>Number of Your Listings: <% out.print(MyListGoods.size());%></p><%
            if (MyListGoods != null && MyListGoods.size() > 0) {
                for (Goods g : MyListGoods) {
        %>
            <h3><% out.print(g.getTitle()); %></h3>
            <% if (g.getPublished() == 1) {
                out.print("<p class=\"published\">Published</p>");
            } else {
                out.print("<p class=\"no-published\">Not Published</p>");
            } %>
            <p>Date Created: <% out.print(g.getDate()); %></p>
            <p>Time Created: <% out.print(g.getTime()); %></p>
            <p>Item Number # <% out.print(g.getId()); %></p>
            <p>Price: <% out.print(g.getPrice()); %></p>
            <p>Description: <% out.print(g.getDescription()); %></p>
            <p>Photo: <% out.print(g.getPhoto()); %></p>
            <div class="form-inline">
                <form action="editgoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-primary editBtn" name="edit">Edit</button>
                </form>
                <form action="deletegoods" method="post">
                    <input type="hidden" value="<% out.print(g.getId()); %>" name="idgoods">
                    <button type="submit" class="btn btn-danger " name="delete">Delete</button>
                </form>
                <p class="viewCout">View Count: <% out.print(g.getView_count()); %></p>
            </div>

            <hr>
            <%
                    }
                } else {
                    out.print("<p>No items!</p>");
                }
            %>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
