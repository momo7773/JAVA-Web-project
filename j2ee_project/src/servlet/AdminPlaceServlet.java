package servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import service.*;
import domain.*;

import java.lang.reflect.Array;
import java.util.*;
public class AdminPlaceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Place_Service ps = new Place_Service();
        BookSpService bss=new BookSpService();
        BookHiService bhs=new BookHiService();
        BookEdService bes=new BookEdService();
        System.out.println("new service");
        ArrayList<PlaceShowBean> list = ps.diplay();
        ArrayList<BookSpBean> list1=bss.sp_diplay();
        ArrayList<BookHiBean> list2=bhs.hi_diplay();
        ArrayList<BookEdBean> list3=bes.ed_diplay();
        response.setCharacterEncoding("utf-8");
        request.setAttribute("list",list);
        request.setAttribute("list1",list1);
        request.setAttribute("list2",list2);
        request.setAttribute("list3",list3);
        System.out.println("attributeSet");
        request.getRequestDispatcher("AdminOrderPlace.jsp").forward(request, response);

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
