package servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import service.*;
import domain.*;
import java.util.*;

public class UserBookSpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookSpService bss = new BookSpService();
        SpOrderService sos = new SpOrderService();
        //System.out.println("new place service");
        ArrayList<BookSpBean> list = bss.sp_diplay();
        ArrayList<OrderBean> latest_order = sos.get_latest_sp();
        UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
        int userid = ulb.getUserid();
        ArrayList<OrderBean> my_order = sos.get_my_sp(userid);
        if(my_order.size()!=0){
            System.out.println("my_order_sp非空!!!!!!!!");
        }
        response.setCharacterEncoding("utf-8");
        request.setAttribute("list",list);
        request.setAttribute("latest_order",latest_order);
        request.setAttribute("my_order",my_order);
        System.out.println("attributeSet");
        request.getRequestDispatcher("User_Book_Sp.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
