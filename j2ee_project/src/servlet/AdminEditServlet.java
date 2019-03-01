package servlet;

import db.NewsDb;
import domain.*;
import service.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminEditServlet")
public class AdminEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("调用编辑新闻servlet");
        NewsBean nb=new NewsBean();
        String title=request.getParameter("title");
        System.out.println(title);
        String content=request.getParameter("content");
        System.out.println(content);
        String image=request.getParameter("image");
        System.out.println(image);
        String auto_incr=request.getParameter("auto_incr");
        System.out.println("AUTO "+auto_incr);
       // String sub_time=request.getParameter("sub_time");
        nb.setTitle(title);
        nb.setContent(content);
        nb.setImage(image);
        nb.setAuto_incr(Integer.valueOf(auto_incr));
        request.getSession().setAttribute("newsbean",nb);
        request.getRequestDispatcher("AdminEditNews.jsp").forward(request,response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }
}
