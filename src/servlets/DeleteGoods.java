package servlets;

import dbutil.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deletegoods")
public class DeleteGoods extends HttpServlet {
    DBUtil dbUtil;

    public DeleteGoods() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {
            String idGood = request.getParameter("idgoods");
            if (idGood != null) {
                dbUtil.deleteGoodsById(idGood);
                response.sendRedirect("mygoods");
            }
        } else {
            response.sendRedirect("pages");
        }
    }
}
