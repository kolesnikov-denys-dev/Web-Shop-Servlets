package servlets;

import dbutil.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deletecomments")
public class DeleteComments extends HttpServlet {
    DBUtil dbUtil;

    public DeleteComments() {
        super();
        dbUtil = new DBUtil();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession() != null && request.getSession().getAttribute("login") != null) {
            String idPost = request.getParameter("idPost");
            String idComment = request.getParameter("idComment");
            dbUtil.deleteCommentsById(idComment);
            request.getRequestDispatcher("opengoods?currentId=" + idPost + "").forward(request, response);
        }
    }
}