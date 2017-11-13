package servlets;

import dbutil.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addUser")
public class AddUser extends HttpServlet {
    private DBUtil dbutil;

    public AddUser() {
        dbutil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        int age = Integer.parseInt(request.getParameter("age"));

        boolean exist = dbutil.emailAlreadyExist(email);

        if (exist) {
            request.setAttribute("lastEmail", email);
            request.setAttribute("lastName", name);
            request.setAttribute("lastSur", surname);
            request.setAttribute("lastAge", age);
        }

        request.setAttribute("emailExist", exist);

        if (password.equals(password2) && (surname != null) && (name != null) && (email != null) && exist != true) {
            dbutil.addUser(email, password, name, surname, age);
            response.sendRedirect("pages?succes=1");
            System.out.println("Correctly registration! -------->");
        } else {
            System.out.println("Not correctly registration! -------->");
        }
        request.getRequestDispatcher("/registration.jsp").forward(request, response);
    }
}
