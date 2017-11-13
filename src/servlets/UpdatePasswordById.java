package servlets;

import dbutil.DBUtil;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updatepasswordbyid")
public class UpdatePasswordById extends HttpServlet {
    DBUtil dbUtil;

    public UpdatePasswordById() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");
            String reNewPassword = request.getParameter("reNewPassword");
            String id = request.getParameter("idUser");
            boolean checkPass = dbUtil.checkCurrentPassword(id, currentPassword);
            boolean check = false;
            if (checkPass && newPassword.equals(reNewPassword)) {
                dbUtil.updatePassword(id, newPassword);
                response.sendRedirect("/loginuser");
                request.getSession().removeAttribute("login");
            } else {
                check = true;
                request.setAttribute("errorPassword", check);
                request.getRequestDispatcher("/options.jsp").forward(request, response);
            }
        }
    }
}
