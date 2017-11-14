package servlets;

import dbutil.DBUtil;
import entities.Comments;
import entities.Goods;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/opengoods")
public class OpenGoods extends HttpServlet {

    DBUtil dbUtil;

    public OpenGoods() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idGoods = request.getParameter("currentId");
        Goods g =  dbUtil.showGoodsById(idGoods);
        request.setAttribute("currentGoodsId", g);

        ArrayList<Comments> commentsList = dbUtil.commentsList(idGoods);
        request.setAttribute("commentsList", commentsList);
        request.getRequestDispatcher("/single-goods.jsp").forward(request, response);



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
