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

@WebServlet("/edituser")
public class EditUser extends HttpServlet {

    DBUtil dbUtil;

    public EditUser() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession()!=null && request.getSession().getAttribute("login")!=null) {
            String idUser = request.getParameter("idUser");
            int id = Integer.parseInt(idUser);
            Users x = dbUtil.getUserById(id);
            request.setAttribute("userById", x);
            request.getRequestDispatcher("/edit.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("pages");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
