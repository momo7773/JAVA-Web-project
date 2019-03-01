package service;

import db.IBookUserDaoImpl;
import domain.BookEdBean;
import domain.OrderBean;

import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class EdOrderService {
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

    public ArrayList<OrderBean> get_latest_ed(){
        IBookUserDaoImpl budi = new IBookUserDaoImpl();
        ResultSet rs = budi.order_select();
        ArrayList<OrderBean> latest_order = new ArrayList<OrderBean>();
        try{
            if(rs!=null){
                while ((rs.next())){
                    int status = rs.getInt("status");
                    System.out.println("statue = "+status);
                    if(status == 1){
                        System.out.println("book_user中存在status==1的order!");
                        //注意：此处的OrderBean是没有vacancy和max信息的!!!
                        OrderBean ob = new OrderBean();
                        int iduser = rs.getInt("iduser");
                        int idplace = rs.getInt("idplace");
                        int idroom = rs.getInt("idroom");
                        Timestamp Book_time = rs.getTimestamp("Book_time");
                        ob.setIduser(iduser);
                        ob.setIdplace(idplace);
                        ob.setIdroom(idroom);
                        ob.setBook_time(Book_time);
                        latest_order.add(ob);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return latest_order;
    }

    public ArrayList<OrderBean> get_my_ed(int cur_iduser){
        IBookUserDaoImpl budi = new IBookUserDaoImpl();
        ResultSet rs = budi.order_select();
        ArrayList<OrderBean> my_order = new ArrayList<OrderBean>();
        try{
            if(rs!=null){
                while ((rs.next())){
                    int iduser = rs.getInt("iduser");
                    int status = rs.getInt("status");
                    //注意：此处的OrderBean是没有vacancy和max信息的!!!
                    if(iduser == cur_iduser){
                        System.out.println("存在当前用户的科普基地预约!!!");
                        OrderBean ob = new OrderBean();
                        int idplace = rs.getInt("idplace");
                        Timestamp Book_time = rs.getTimestamp("Book_time");
                        ob.setIduser(iduser);
                        ob.setIdplace(idplace);
                        ob.setIdroom(0);
                        ob.setBook_time(Book_time);
                        ob.setStatus(status);
                        my_order.add(ob);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return my_order;
    }

    public int request_order(BookEdBean bhb, int userid){
        int result = 0;
        OrderBean ob = new OrderBean();
        IBookUserDaoImpl bud = new IBookUserDaoImpl();
        //Book_Place_ed_Db_Impl bpld = new Book_Place_ed_Db_Impl();
        ob.setIduser(userid);
        ob.setIdplace(Integer.parseInt(bhb.getIdplace()));
        ob.setIdroom(0);
        ob.setBook_time(strToDate(bhb.getTime()));
        result = bud.order_insert(ob);
        if(result == 1){
            //bpld.order_update(bhb);
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
