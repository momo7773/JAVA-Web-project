package servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import service.*;
import domain.*;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

public class UserOrderSpServlet extends HttpServlet {

    public static Timestamp strToDate(String strDate) {
        String str = strDate;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss.SSS");
        java.util.Date d = null;
        try {
            d = format.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Timestamp timestamp = new Timestamp(d.getTime());
        return timestamp;
    }
    private static String str_to_place(String place){
        String idplace="";
        if(place.equals("1号体育馆")){
            idplace = "5";
        }
        else if(place.equals("2号体育馆")){
            idplace = "6";
        }
        else if(place.equals("3号体育馆")){
            idplace = "7";
        }
        return idplace;
    }
    private static String str_to_room(String room){
        String idroom="";
        if(room.equals("乒乓球馆")){
            idroom = "101";
        }
        else if(room.equals("羽毛球馆")){
            idroom = "102";
        }
        else if(room.equals("篮球馆")){
            idroom = "201";
        }
        else if(room.equals("游泳馆")){
            idroom = "202";
        }
        return idroom;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("调用UserOrderSpServlet");
        BookSpBean blb = new BookSpBean();
        SpOrderService ols = new SpOrderService();
        if(request.getParameter("userid")!=null){
            int userid = Integer.parseInt(request.getParameter("userid"));
            String idplace = request.getParameter("idplace");
            String idroom = request.getParameter("idroom");
            blb.setIdplace(str_to_place(idplace));
            blb.setIdroom(str_to_room(idroom));
            blb.setTime(request.getParameter("book_time"));
            blb.setVacancy(request.getParameter("vacancy"));
            System.out.println("表格里要预约的地点: "+blb.getIdplace()+"房间号"+blb.getIdroom()+"时间"+blb.getTime());
            int result = ols.request_order(blb, userid);
            if(result == 0){
                System.out.println("该时间你已经预约别的地方了!!!!");
            }
            else if(result == 1){
                System.out.println("可以预约!!!!");
            }
            else if(result == 2){
                System.out.println("小傻瓜，你已经预约过这个地方啦!!!");
            }
        }

        if(request.getParameter("del_userid")!=null){
            OrderBean ob = new OrderBean();
            ob.setIduser(Integer.parseInt(request.getParameter("del_userid")));
            ob.setIdplace(Integer.parseInt(request.getParameter("del_idplace")));
            ob.setIdroom(Integer.parseInt(request.getParameter("del_idroom")));
            ob.setBook_time(strToDate(request.getParameter("del_book_time")));
            if(ob.getIduser()!=0 && ob.getIdplace()!=0 && ob.getIdroom()!=0){
                ols.delete_order(ob);
            }
        }

        response.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("User_Book_Sp.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
