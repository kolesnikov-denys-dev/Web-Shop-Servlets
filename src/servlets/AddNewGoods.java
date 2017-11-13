package servlets;

import dbutil.DBUtil;
import entities.Goods;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.util.Date;

@WebServlet("/addnewgoods")
public class AddNewGoods extends HttpServlet {
    DBUtil dbUtil;

    public AddNewGoods() {
        super();
        dbUtil = new DBUtil();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {

            Date date = new Date();

            Users u = (Users) request.getSession().getAttribute("login");
            int idUser = u.getId();
            String published = request.getParameter("published");
            int active;
            if (published.equals("ok")) {
                active = 1;
            }
            else {
                active = 0;
            }
            String currentDateAndTime = date.toString();
            String currentTime = currentDateAndTime.substring(11, 18);
            String currentDate = currentDateAndTime.substring(0, 10);
            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            String photo = ("photo");
            String title = request.getParameter("title");
            int category = Integer.parseInt(request.getParameter("category"));

            Goods goods = new Goods(idUser, active, currentDate, currentTime, price, description, photo, title, category );

            dbUtil.addNewGoods(goods);

            response.sendRedirect("mygoods");
        } else {
            response.sendRedirect("/login.jsp");
        }

    }
}
