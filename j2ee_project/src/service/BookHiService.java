package service;
import java.util.*;
import java.lang.*;
import  db.*;
import java.sql.*;
import domain.*;

public class BookHiService {
    private static String place_to_str(int place){
        String idplace="";
        if(place == 8){
            idplace = "宋庆龄故居";
        }
        else if(place == 9){
            idplace = "中共一大会址";
        }
        return idplace;
    }

    public ArrayList<BookHiBean>  hi_diplay(){
        Book_Place_hi_Db_Impl hi_book = new Book_Place_hi_Db_Impl();
        ResultSet rs =hi_book.order_select();
        ArrayList<BookHiBean> list = new ArrayList<BookHiBean>();
        try{
            if(rs!=null){
                while (rs.next()) {
                    BookHiBean bsb = new BookHiBean();
                    String[] obj = new String[5];
                    int idplace = rs.getInt("idplace");
                    int idroom = rs.getInt("idroom");
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
