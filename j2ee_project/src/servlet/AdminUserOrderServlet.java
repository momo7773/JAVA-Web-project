package servlet;

import domain.UserOrderBean;
import service.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminUserOrderServlet")
public class AdminUserOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            System.out.println("显示用户订单信息servlet");
        AdminServiceImpl asi=new AdminServiceImpl();
        ArrayList<UserOrderBean> list=asi.display_order();
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("list_order",list);
        request.getRequestDispatcher("AdminUserOrder.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
