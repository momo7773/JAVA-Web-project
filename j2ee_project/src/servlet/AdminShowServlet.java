package servlet;

import domain.ShowNewsBean;
import service.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminShowServlet")
public class AdminShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminServiceImpl asi=new AdminServiceImpl();
        ArrayList<ShowNewsBean> list=asi.select();
        response.setCharacterEncoding("utf-8");
        request.setAttribute("listnews",list);
        request.getRequestDispatcher("AdminNewPage.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
