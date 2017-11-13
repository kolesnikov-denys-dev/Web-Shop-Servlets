package servlets;

import dbutil.DBUtil;
import entities.Goods;
import entities.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/mygoods")
public class MyGoods extends HttpServlet {

    DBUtil dbUtil;

    public MyGoods() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users u = (Users) request.getSession().getAttribute("login");
        ArrayList<Goods> MyGoodsList = null;
        if(u != null) {
            MyGoodsList = dbUtil.showMyGoods(u);
        }
        request.setAttribute("MyList", MyGoodsList);
        request.getRequestDispatcher("/goods.jsp").forward(request, response);
    }
}
