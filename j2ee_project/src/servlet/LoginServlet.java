package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import util.*;
import domain.*;
import org.apache.commons.beanutils.BeanUtils;
import service.UserServiceImp;
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserLoginBean ulb=WebUtils.request2Bean(request,UserLoginBean.class);
        System.out.println("formbena结束");
        UserServiceImp usi=new UserServiceImp();
        int result=0;
        try{
            System.out.println("1");
            UserServiceImp us=new UserServiceImp() ;
            System.out.println("2");
            result=us.Login(ulb);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        if(result==1)
        {
            System.out.println("Login success");
            HttpSession hs=request.getSession();
            hs.setAttribute("user",ulb);
            request.getRequestDispatcher("User_Book.jsp").forward(request,response);
        }
        else
        {
            System.out.println("Login failure");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
