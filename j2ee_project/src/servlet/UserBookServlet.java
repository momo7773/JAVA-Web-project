package servlet;

import domain.OrderBean;
import domain.UserLoginBean;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class UserBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderService os = new OrderService();
        UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
        int userid = ulb.getUserid();
        ArrayList<OrderBean> my_order = os.get_my(userid);
        if(my_order.size()!=0){
            System.out.println("my_order_all 非空!!!!!!!!");
        }
        response.setCharacterEncoding("utf-8");
        request.setAttribute("my_order",my_order);
        System.out.println("attributeSet");
        request.getRequestDispatcher("User_Order.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
