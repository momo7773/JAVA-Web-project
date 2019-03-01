package service;
import java.text.SimpleDateFormat;
import java.util.*;
import java.lang.*;
import  db.*;
import java.sql.*;
import domain.*;

public class OrderLiService {

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

    public int request_order(BookLiBean blb, int userid){
        int result = 0;
        OrderBean ob = new OrderBean();
        IBookUserDaoImpl bud = new IBookUserDaoImpl();
        //Book_Place_li_Db_Impl bpld = new Book_Place_li_Db_Impl();
        ob.setIduser(userid);
        ob.setIdplace(Integer.parseInt(blb.getIdplace()));
        ob.setIdroom(Integer.parseInt(blb.getIdroom()));
        ob.setBook_time(strToDate(blb.getTime()));
        result = bud.order_insert(ob);
        if(result == 1){
            //bpld.order_update(blb);
        }
        return result;
    }

    public int delete_order(OrderBean ob){
        int result = 0;
        IBookUserDaoImpl bud = new IBookUserDaoImpl();
        bud.order_delete(ob);
        return result;
    }
}
