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
import java.text.SimpleDateFormat;
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

            request.setCharacterEncoding("UTF8");

            Users u = (Users) request.getSession().getAttribute("login");
            int idUser = u.getId();
            String published = request.getParameter("published");
            int active;
            if (published.equals("ok")) {
                active = 1;
            } else {
                active = 0;
            }

            Date date = new Date();
            SimpleDateFormat dateFormat = null;

            dateFormat = new SimpleDateFormat("HH:mm:ss");
            String currentTimeS = dateFormat.format(date);
            dateFormat = new SimpleDateFormat("dd MMMM y");
            String currentDateS = dateFormat.format(date);

            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            String photo = ("photo");
            String title = request.getParameter("title");
            int category = Integer.parseInt(request.getParameter("category"));

            Goods goods = new Goods(idUser, active, currentDateS, currentTimeS, price, description, photo, title, category);

            dbUtil.addNewGoods(goods);

            response.sendRedirect("mygoods");
        } else {
            response.sendRedirect("/login.jsp");
        }
    }
}