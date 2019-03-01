package servlet;

import domain.PlaceShowBean;
import domain.ShowNewsBean;
import service.AdminServiceImpl;
import service.Place_Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class IndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Place_Service ps = new Place_Service();
        ArrayList<PlaceShowBean> list = ps.diplay();
        response.setCharacterEncoding("utf-8");
        request.setAttribute("list",list);
        AdminServiceImpl asi=new AdminServiceImpl();
        ArrayList<ShowNewsBean> listnews=asi.select();
        request.setAttribute("listnews",listnews);
        request.getRequestDispatcher("index_3.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
