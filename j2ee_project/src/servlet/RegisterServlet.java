package servlet;

import domain.*;
import service.*;
import util.*;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FormBean fb=WebUtils.request2Bean(request,FormBean.class);
        System.out.println("formbena结束");
        User user=new User();
        try{
            BeanUtils.copyProperties(user,fb);
            System.out.println("1");
            UserServiceImp us=new UserServiceImp() ;
            System.out.println("2");
            int result=us.Register(user);
            System.out.println(result);
            System.out.println("注册完啦");
            request.getRequestDispatcher("IndexServlet").forward(request,response);
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
