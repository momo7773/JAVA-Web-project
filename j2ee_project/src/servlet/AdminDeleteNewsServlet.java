package servlet;

import domain.NewsBean;
import service.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class AdminDeleteNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("调用删除新闻servlet");
        NewsBean nb=new NewsBean();
        String auto_incr=request.getParameter("auto_incr");
        System.out.println("AUTO "+auto_incr);
        // String sub_time=request.getParameter("sub_time");
        nb.setAuto_incr(Integer.valueOf(auto_incr));
        AdminServiceImpl asi=new AdminServiceImpl();
        int result=asi.delete(nb);
        if(result!=0) {
            request.getRequestDispatcher("AdminShowServlet").forward(request, response);
        }
        else
            request.getRequestDispatcher("index_3.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
