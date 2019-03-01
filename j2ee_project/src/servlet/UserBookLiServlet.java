package servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import service.*;
import domain.*;
import java.util.*;

public class UserBookLiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookLiService bls = new BookLiService();
        LiOrderService llos = new LiOrderService();
        //System.out.println("new place service");
        ArrayList<BookLiBean> list = bls.li_diplay();
        ArrayList<OrderBean> latest_order = llos.get_latest_li();
        UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
        int userid = ulb.getUserid();
        ArrayList<OrderBean> my_order = llos.get_my_li(userid);
        response.setCharacterEncoding("utf-8");
        request.setAttribute("list",list);
        request.setAttribute("latest_order",latest_order);
        request.setAttribute("my_order",my_order);
        System.out.println("attributeSet");
        request.getRequestDispatcher("User_Book_Li.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
