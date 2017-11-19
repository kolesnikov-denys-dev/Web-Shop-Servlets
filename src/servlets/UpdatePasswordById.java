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
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean online = (boolean)request.getAttribute("userOnline");
        if (online) {
            int currentPassword = Integer.parseInt(request.getParameter("currentPassword"));
            String newPassword = request.getParameter("newPassword");
            String rePassword = request.getParameter("reNewPassword");
            String id = request.getParameter("idUser");

            boolean curPas = false;
            boolean pasAndRePas = false;
            if (newPassword.equals(rePassword)){
                pasAndRePas = true;
            }

            curPas = dbUtil.checkCurrentPassword(id, currentPassword);
            request.setAttribute("pasAndRePas", pasAndRePas);
            request.setAttribute("curPas", curPas);

            if (curPas && pasAndRePas) {
                dbUtil.updatePassword(id, newPassword);
            }
            request.getRequestDispatcher("/options.jsp").forward(request, response);
        }
    }
}
