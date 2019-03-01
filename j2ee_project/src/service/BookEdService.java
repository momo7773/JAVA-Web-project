package service;
import java.util.*;
import java.lang.*;
import  db.*;
import java.sql.*;
import domain.*;

public class BookEdService {
    private static String place_to_str(int place){
        String idplace="";
        if(place == 10){
            idplace = "上海市黄浦区青少年活动中心";
        }
        else if(place == 11){
            idplace = "黄浦区科技馆";
        }
        return idplace;
    }

    public ArrayList<BookEdBean>  ed_diplay(){
        Book_Place_ed_Db_Impl ed_book = new Book_Place_ed_Db_Impl();
        ResultSet rs =ed_book.order_select();
        ArrayList<BookEdBean> list = new ArrayList<BookEdBean>();
        try{
            if(rs!=null){
                while (rs.next()) {
                    BookEdBean bsb = new BookEdBean();
                    String[] obj = new String[5];
                    int idplace = rs.getInt("idplace");
                    obj[0] =place_to_str(idplace);
                    obj[1] ="0";
                    obj[2] = rs.getTimestamp("Book_time").toString();
                    obj[3] = String.valueOf(rs.getInt("vacancy"));
                    obj[4] = String.valueOf(rs.getInt("max"));
                    bsb.setIdplace(obj[0]);
                    bsb.setIdroom(obj[1]);
                    bsb.setTime(obj[2]);
                    bsb.setVacancy(obj[3]);
                    bsb.setMax(obj[4]);
                    list.add(bsb);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
