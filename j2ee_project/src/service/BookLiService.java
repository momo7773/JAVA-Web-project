package service;
import java.util.*;
import java.lang.*;
import  db.*;
import java.sql.*;
import domain.*;

public class BookLiService {
    private static String place_to_str(int place){
        String idplace="";
        if(place == 1){
            idplace = "1号图书馆";
        }
        else if(place == 2){
            idplace = "2号图书馆";
        }
        else if(place == 3){
            idplace = "3号图书馆";
        }
        else if(place == 4){
            idplace = "4号图书馆";
        }
        return idplace;
    }
    private static String room_to_str(int room){
        String idroom;
        idroom = String.valueOf(room);
        idroom = idroom + "室";
        return idroom;
    }
    public ArrayList<BookLiBean>  li_diplay(){
        Book_Place_li_Db_Impl li_book = new Book_Place_li_Db_Impl();
        ResultSet rs =li_book.order_select();
        ArrayList<BookLiBean> list = new ArrayList<BookLiBean>();
        try{
            if(rs!=null){
                while (rs.next()) {
                    BookLiBean blb = new BookLiBean();
                    String[] obj = new String[5];
                    int idplace = rs.getInt("idplace");
                    int idroom = rs.getInt("idroom");
                    obj[0] =place_to_str(idplace);
                    obj[1] =room_to_str(idroom);
                    obj[2] = rs.getTimestamp("Book_time").toString();
                    obj[3] = String.valueOf(rs.getInt("vacancy"));
                    obj[4] = String.valueOf(rs.getInt("max"));
                    blb.setIdplace(obj[0]);
                    blb.setIdroom(obj[1]);
                    blb.setTime(obj[2]);
                    blb.setVacancy(obj[3]);
                    blb.setMax(obj[4]);
                    list.add(blb);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
