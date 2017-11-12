package servlets;

import dbutil.DBUtil;
import entities.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editgoods")
public class EditGoods extends HttpServlet {

    DBUtil dbUtil;

    public EditGoods() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id_goods = request.getParameter("idgoods");

        Goods g =  dbUtil.getGoodsById(id_goods);

        request.setAttribute("yourGoods", g);
        request.getRequestDispatcher("/goods-edit.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
