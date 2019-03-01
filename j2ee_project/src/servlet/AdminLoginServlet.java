package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import service.AdminServiceImpl;
import util.*;
import domain.*;
import org.apache.commons.beanutils.BeanUtils;
import service.UserServiceImp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            AdminBean ab=WebUtils.request2Bean(request,AdminBean.class);
            System.out.println("formbena结束");
            int result=0;
            try{
                System.out.println(ab.getPwd());
                AdminServiceImpl asi=new AdminServiceImpl();
                System.out.println("2");
                result=asi.Login(ab);
            }catch(Exception e)
            {
                e.printStackTrace();
            }
            if(result==1)
            {
                System.out.println("Login success");
                HttpSession hs=request.getSession();
                hs.setAttribute("admin",ab);
                request.getRequestDispatcher("AdminMainPage.jsp").forward(request,response);
            }
            else
            {
                System.out.println("Login failure");
            }

        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
