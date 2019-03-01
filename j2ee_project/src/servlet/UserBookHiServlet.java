package servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import service.*;
import domain.*;
import java.util.*;

public class UserBookHiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookHiService bhs = new BookHiService();
        HiOrderService hos = new HiOrderService();
        //System.out.println("new place service");
        ArrayList<BookHiBean> list = bhs.hi_diplay();
        ArrayList<OrderBean> latest_order = hos.get_latest_hi();
        UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
        int userid = ulb.getUserid();
        ArrayList<OrderBean> my_order = hos.get_my_hi(userid);
        if(my_order.size()!=0){
            System.out.println("my_order_hi非空!!!!!!!!");
        }
        response.setCharacterEncoding("utf-8");
        request.setAttribute("list",list);
        request.setAttribute("latest_order",latest_order);
        request.setAttribute("my_order",my_order);
        System.out.println("attributeSet");
        request.getRequestDispatcher("User_Book_Hi.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
