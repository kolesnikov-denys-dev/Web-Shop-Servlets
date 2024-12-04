package servlets;

import dbutil.DBUtil;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/pages")
public class Pages extends HttpServlet {
    private DBUtil dbUtil;

    public Pages() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {
            ArrayList<Users> usersList = (ArrayList<Users>) dbUtil.listUsers();
            request.setAttribute("users", usersList);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login.jsp");
        }
    }
}