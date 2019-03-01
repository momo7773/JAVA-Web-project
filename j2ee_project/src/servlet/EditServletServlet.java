package servlet;

import domain.UserOrderBean;
import service.AdminServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditServletServlet")
public class EditServletServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result2=0;
        int option=Integer.valueOf(request.getParameter("option"));
        int userid=Integer.valueOf(request.getParameter("userid"));
        int auto_incr=Integer.valueOf(request.getParameter("auto_incr"));

        UserOrderBean uob=new UserOrderBean();
        uob.setUserid(userid);
        uob.setAuto_incr(auto_incr);

        AdminServiceImpl asi=new AdminServiceImpl();
        if(option==1) {
            int idroom=Integer.valueOf(request.getParameter("room"));
            int idplace=Integer.valueOf(request.getParameter("place"));
            String sub_time=request.getParameter("time");
            uob.setIdroom(idroom);
            uob.setIdplace(idplace);
            uob.setSub_time(sub_time);
            asi.update_user_order(uob);
            request.getRequestDispatcher("AdminUserOrderServlet").forward(request, response);
         /*   if(result!=0) {
                result2=asi.insert_book(uob);
                if(result2!=0&&result2!=-1)
                    request.getRequestDispatcher("AdminUserOrderServlet").forward(request, response);
            }
            else
                request.getRequestDispatcher("index.jsp").forward(request,response);*/
        }
        else if(option==2)
        {
            System.out.println("option=2");
            int result=asi.delete_user_order(uob);
            if(result!=0)
                request.getRequestDispatcher("AdminUserOrderServlet").forward(request,response);
            else
                request.getRequestDispatcher("index.jsp").forward(request,response);
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
