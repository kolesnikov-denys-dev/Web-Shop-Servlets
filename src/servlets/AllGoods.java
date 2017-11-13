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

@WebServlet("/allgoods")
public class AllGoods extends HttpServlet {
    DBUtil dbUtil;

    public AllGoods() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Goods> AllGoodsLi = null;
        String search = request.getParameter("search");
        String category = request.getParameter("category");

        AllGoodsLi = dbUtil.getGoodsByParam(search, category);

        request.setAttribute("AllGo", AllGoodsLi);
        request.getRequestDispatcher("/main-goods.jsp").forward(request, response);
    }
}
