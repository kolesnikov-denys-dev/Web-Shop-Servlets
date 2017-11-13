package servlets;

import dbutil.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateuser")
public class UpdateUser extends HttpServlet {

    DBUtil dbUtil;

    public UpdateUser() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idUser = request.getParameter("idUser");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        int age = Integer.parseInt(request.getParameter("age"));

        dbUtil.updateUser(email, password, name, surname, age, idUser);
        response.sendRedirect("pages");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
