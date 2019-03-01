package service;

import db.IBookUserDaoImpl;
import domain.OrderBean;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class OrderService {
    public ArrayList<OrderBean> get_my(int cur_iduser){
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
                        System.out.println("存在当前用户的预约!!!");
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

    public int delete_order(OrderBean ob){
        int result = 0;
        IBookUserDaoImpl bud = new IBookUserDaoImpl();
        bud.order_delete(ob);
        return result;
    }
}
