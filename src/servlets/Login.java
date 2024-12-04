package servlets;

import dbutil.DBUtil;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginuser")
public class Login extends HttpServlet {
    DBUtil dbUtil;

    public Login() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Users checkedUser = dbUtil.getUserByEmailAndPassword(email, password);
        if (checkedUser != null) {
            request.getSession().setAttribute("login", checkedUser);
            response.sendRedirect("allgoods");
        } else {
            response.sendRedirect("/login.jsp");
        }
    }
}
//            HttpSession session = request.getSession();   //long way
//            session.setAttribute("login", checkedUser);
