package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import domain.*;
import service.UserServiceImp;

@WebServlet(name = "UserInfoServlet")
public class UserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("get");
        UserLoginBean ulb=(UserLoginBean)request.getSession().getAttribute("user");
        System.out.println("get user");
        if(ulb!=null)
        {
            System.out.println("ulb!-null");
            int userid=ulb.getUserid();
            UserServiceImp usi=new UserServiceImp();
            User user=new User();
            user=usi.select(userid);
            System.out.println("get user!!");
            System.out.println("usernickname"+user.getNickname());
            request.getSession().setAttribute("userinfo_detail",user);
            response.setCharacterEncoding("utf-8");
            System.out.println(user.getImg());
            request.getRequestDispatcher("User_Info.jsp").forward(request,response);
        }
        else
            System.out.println("ulb==null!");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
