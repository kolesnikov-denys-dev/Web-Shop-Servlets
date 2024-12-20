<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="allgoods">Web Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <%
                    if (request.getSession().getAttribute("login") == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link text-warning" href="loginuser">New Listing
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <% } %>
                <li class="nav-item">
                    <a class="nav-link" href="allgoods">All Goods
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <%
                    if (null != request.getSession().getAttribute("login")) {
                %>
                <li class="nav-item ">
                    <%--active--%>
                    <a class="nav-link" href="mygoods">My Goods</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="options.jsp">Settings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</nav>