package servlet;

import domain.*;
import service.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入！！！！！！！！！");
        User user=(User)request.getSession().getAttribute("userinfo_detail");
        int userid=user.getUserid();
        String tel=request.getParameter("userTel");
        String email=request.getParameter("userEmail");
        String nickname=request.getParameter("userNickname");
        System.out.println("usertel "+tel+" useremail "+email+" userNickname "+nickname);
        user.setUserid(userid);
        user.setNickname(nickname);
        user.setTel(tel);
        user.setEmail(email);
        UserServiceImp usi=new UserServiceImp();
        int result=usi.Update_userinfo(user);
        if(result!=0)
            request.getRequestDispatcher("UserInfoServlet").forward(request,response);

    }
}
