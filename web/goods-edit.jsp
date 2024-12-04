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
            <h1 class="mt-4">Edit Listing</h1>
            <hr>
            <%
                Goods yourGoods = (Goods) request.getAttribute("yourGoods");
            %>
            <form action="edit-goods" method="post">
                <p>Publication Date: <% out.print(yourGoods.getTime()); %>
                    <% out.print(yourGoods.getDate()); %></p>
                Listing Status:
                <%
                    int status = yourGoods.getPublished();
                    if (status == 1) {
                        out.print("<p class=\"published\">Published</p>");
                    } else {
                        out.print("<p class=\"no-published\">Not Published</p>");
                    }
                %>
                <p>Item Number: <% out.print(yourGoods.getId()); %></p>
                Listing Title: <input class="form-control input-lg" type="text" name="title"
                                      value="<% out.print(yourGoods.getTitle()); %>">
                Price: <input rows="6" class="form-control" type="text" name="price"
                              value="<% out.print(yourGoods.getPrice()); %>">
                Item Description:<textarea style="width: 90%" class="form-control" rows="10" cols="60">
                <% out.print(yourGoods.getDescription()); %></textarea>
                <input class="form-control" type="text" name="description" value="">
                Photo: <input class="form-control" type="text" name="photo"
                              value="<% out.print(yourGoods.getPhoto()); %>">
                <input class="form-control" type="text" name="view_count"
                       value="<% out.print(yourGoods.getView_count()); %>">
            </form>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Save and Publish
            </label>
            <label class="radio-inline">
                <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Save Without Publishing
            </label>
            <br>
            <button type="submit" class="btn btn-success">Done</button>
            <button type="submit" class="btn btn-danger" href="mygoods">Cancel</button>
            <hr>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
