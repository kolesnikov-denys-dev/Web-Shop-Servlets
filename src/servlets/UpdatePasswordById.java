package servlets;

import dbutil.DBUtil;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatepasswordbyid")
public class UpdatePasswordById extends HttpServlet {

    DBUtil dbUtil;

    public UpdatePasswordById() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {
            String password = request.getParameter("pass");
            String id = request.getParameter("idUser");
            dbUtil.updatePassword(id, password);
            response.sendRedirect("/loginuser");
            request.getSession().removeAttribute("login");
        } else {
            response.sendRedirect("allgoods");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
