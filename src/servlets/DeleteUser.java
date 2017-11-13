package servlets;

import dbutil.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteuser")
public class DeleteUser extends HttpServlet {
    DBUtil dbUtil;

    public DeleteUser() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {
            String idUser = request.getParameter("idUser");
            if (idUser != null) {
                dbUtil.deleteUser(idUser);
                response.sendRedirect("pages");
            }
        } else {
            response.sendRedirect("pages");
        }
    }
}
