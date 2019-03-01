package servlet;

import domain.OrderBean;
import service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class UserOrderServlet extends HttpServlet {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("调用UserOrderServlet");
        OrderService os = new OrderService();

        if(request.getParameter("del_userid")!=null){
            OrderBean ob = new OrderBean();
            ob.setIduser(Integer.parseInt(request.getParameter("del_userid")));
            ob.setIdplace(Integer.parseInt(request.getParameter("del_idplace")));
            ob.setIdroom(Integer.parseInt(request.getParameter("del_idroom")));
            ob.setBook_time(strToDate(request.getParameter("del_book_time")));
            if(ob.getIduser()!=0 && ob.getIdplace()!=0 && ob.getIdroom()!=0){
                os.delete_order(ob);
            }
        }

        response.setCharacterEncoding("utf-8");
        request.getRequestDispatcher("User_Order.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request,response);
    }
}
