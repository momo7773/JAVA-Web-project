package service;
import java.util.*;
import java.lang.*;
import  db.*;
import java.sql.*;
import domain.*;

public class BookSpService {
    private static String place_to_str(int place){
        String idplace="";
        if(place == 5){
            idplace = "1号体育馆";
        }
        else if(place == 6){
            idplace = "2号体育馆";
        }
        else if(place == 7){
            idplace = "3号体育馆";
        }
        return idplace;
    }
    private static String room_to_str(int room){
        String idroom="";
        if(room == 101){
            idroom = "乒乓球馆";
        }
        else if(room == 102){
            idroom = "羽毛球馆";
        }
        else if(room == 201){
            idroom = "篮球馆";
        }
        else if(room == 202){
            idroom = "游泳馆";
        }
        return idroom;
    }

    public ArrayList<BookSpBean>  sp_diplay(){
        Book_Place_sp_Db_Impl sp_book = new Book_Place_sp_Db_Impl();
        ResultSet rs =sp_book.order_select();
        ArrayList<BookSpBean> list = new ArrayList<BookSpBean>();
        try{
            if(rs!=null){
                while (rs.next()) {
                    BookSpBean bsb = new BookSpBean();
                    String[] obj = new String[5];
                    int idplace = rs.getInt("idplace");
                    int idroom = rs.getInt("idroom");
                    obj[0] =place_to_str(idplace);
                    obj[1] =room_to_str(idroom);
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
