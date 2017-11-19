package filter;

import com.sun.deploy.net.HttpRequest;
import dbutil.DBUtil;
import entities.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/filter.UserFilter")
public class UserFilter implements Filter {
    DBUtil dbUtil;

    public void destroy() {

    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        boolean userOnline = false;
        Users users = (Users) ((HttpServletRequest) req).getSession().getAttribute("login");

        if (users!=null) {
            System.out.println(users.getName()+" is online!");
        }

        if (users != null) {
            Users tmpUser = dbUtil.getUserByEmailAndPassword(users.getEmail(), users.getPassword());
            if (tmpUser != null) {
                userOnline = true;
                req.setAttribute("userOnline", userOnline);
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        dbUtil = new DBUtil();
    }
}
