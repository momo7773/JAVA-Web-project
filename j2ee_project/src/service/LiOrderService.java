package service;

import db.IBookUserDaoImpl;
import domain.OrderBean;

import java.sql.ResultSet;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;

public class LiOrderService {
    public ArrayList<OrderBean> get_latest_li(){
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

    public ArrayList<OrderBean> get_my_li(int cur_iduser){
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
                        OrderBean ob = new OrderBean();
                        int idplace = rs.getInt("idplace");
                        int idroom = rs.getInt("idroom");
                        Timestamp Book_time = rs.getTimestamp("Book_time");
                        ob.setIduser(iduser);
                        ob.setIdplace(idplace);
                        ob.setIdroom(idroom);
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


}
