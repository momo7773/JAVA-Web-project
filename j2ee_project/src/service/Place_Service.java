package service;
import java.util.*;
import java.lang.*;
import  db.*;
import java.sql.*;
import domain.*;

public class Place_Service {
    private static Map<Integer,String> place=new HashMap<Integer,String>();
    private static int[] place_id=new int[144];
    private static String[] place_name={
            "1号图书馆 101室","1号图书馆 102室","1号图书馆 103室","1号图书馆 104室","1号图书馆 105室",
            "1号图书馆 201室","1号图书馆 202室","1号图书馆 203室","1号图书馆 204室","1号图书馆 205室",
            "1号图书馆 301室","1号图书馆 302室","1号图书馆 303室","1号图书馆 304室","1号图书馆 305室",
            "1号图书馆 401室","1号图书馆 402室","1号图书馆 403室","1号图书馆 404室","1号图书馆 405室",
            "2号图书馆 101室","2号图书馆 102室","2号图书馆 103室","2号图书馆 104室","2号图书馆 105室",
            "2号图书馆 201室","2号图书馆 202室","2号图书馆 203室","2号图书馆 204室","2号图书馆 205室",
            "2号图书馆 301室","2号图书馆 302室","2号图书馆 303室","2号图书馆 304室","2号图书馆 305室",
            "2号图书馆 401室","2号图书馆 402室","2号图书馆 403室","2号图书馆 404室","2号图书馆 405室",
            "3号图书馆 101室","3号图书馆 102室","3号图书馆 103室","3号图书馆 104室","3号图书馆 105室",
            "3号图书馆 201室","3号图书馆 202室","3号图书馆 203室","3号图书馆 204室","3号图书馆 205室",
            "3号图书馆 301室","3号图书馆 302室","3号图书馆 303室","3号图书馆 304室","3号图书馆 305室",
            "3号图书馆 401室","3号图书馆 402室","3号图书馆 403室","3号图书馆 404室","3号图书馆 405室",
            "4号图书馆 101室","4号图书馆 102室","4号图书馆 103室","4号图书馆 104室","4号图书馆 105室",
            "4号图书馆 201室","4号图书馆 202室","4号图书馆 203室","4号图书馆 204室","4号图书馆 205室",
            "4号图书馆 301室","4号图书馆 302室","4号图书馆 303室","4号图书馆 304室","4号图书馆 305室",
            "4号图书馆 401室","4号图书馆 402室","4号图书馆 403室","4号图书馆 404室","4号图书馆 405室",
            "1号体育馆 101室","1号体育馆 102室","1号体育馆 103室","1号体育馆 104室","1号体育馆 105室",
            "1号体育馆 201室","1号体育馆 202室","1号体育馆 203室","1号体育馆 204室","1号体育馆 205室",
            "1号体育馆 301室","1号体育馆 302室","1号体育馆 303室","1号体育馆 304室","1号体育馆 305室",
            "1号体育馆 401室","1号体育馆 402室","1号体育馆 403室","1号体育馆 404室","1号体育馆 405室",
            "2号体育馆 101室","2号体育馆 102室","2号体育馆 103室","2号体育馆 104室","2号体育馆 105室",
            "2号体育馆 201室","2号体育馆 202室","2号体育馆 203室","2号体育馆 204室","2号体育馆 205室",
            "2号体育馆 301室","2号体育馆 302室","2号体育馆 303室","2号体育馆 304室","2号体育馆 305室",
            "2号体育馆 401室","2号体育馆 402室","2号体育馆 403室","2号体育馆 404室","2号体育馆 405室",
            "3号体育馆 101室","3号体育馆 102室","3号体育馆 103室","3号体育馆 104室","3号体育馆 105室",
            "3号体育馆 201室","3号体育馆 202室","3号体育馆 203室","3号体育馆 204室","3号体育馆 205室",
            "3号体育馆 301室","3号体育馆 302室","3号体育馆 303室","3号体育馆 304室","3号体育馆 305室",
            "3号体育馆 401室","3号体育馆 402室","3号体育馆 403室","3号体育馆 404室","3号体育馆 405室",
            "1号名人故居","2号名人故居","1号科普基地","2号科普基地"};
    private static void set_i() {
        int i;
        int count=1000;
        int multi=1;
        int[] index=new int[20];
        index[0]=101; index[1]=102; index[2]=103;index[3]=104; index[4]=105;
        index[5]=201; index[6]=202; index[7]=203; index[8]=204; index[9]=205;
        index[10]=301; index[11]=302; index[12]=303; index[13]=304; index[14]=305;
        index[15]=401; index[16]=402; index[17]=403; index[18]=404; index[19]=405;
    for (i = 1; i <= 144; i = i + 1)
        {
            if(i==20)
                multi=2;
            if(i==40)
                multi=3;
            if(i==60)
                multi=4;
            if(i==80)
                multi=5;
            if(i==100)
                multi=6;
            if(i==120)
                multi=7;
            if(i==140)
                multi=8;
            place_id[i-1]=index[(i-1)%20]+count*multi;
        }
        for(i=0;i<144;i++)
        {
            place.put(place_id[i],place_name[i]);
        }
    }
    public ArrayList<PlaceShowBean>  diplay() {
        Book_Place_li_Db_Impl book = new Book_Place_li_Db_Impl();
        ResultSet rs = book.order_select();
        int rowCount=0;
        int count = 0;
        ArrayList<PlaceShowBean> list = new ArrayList<PlaceShowBean>();
        set_i();
        try {
            while (rs.next()) {
                count++;
                PlaceShowBean psb = new PlaceShowBean();
                System.out.println(count);
                if (count >= 50)
                    break;
                String[] obj = new String[4];
                System.out.println("-");
                int idroom = rs.getInt("idroom");
                System.out.println(idroom);
                int idplace = rs.getInt("idplace");
                System.out.println(idplace);
                int idget = idroom + idplace * 1000;
                if (place.containsKey(idget)) {
                    obj[0] = place.get(idget);
                    System.out.println(obj[0]);
                }
                else {
                    System.out.println("obj异常");
                }
                obj[1] = rs.getTimestamp("Book_time").toString();
                obj[2] = String.valueOf(rs.getInt("vacancy"));
                obj[3] = String.valueOf(rs.getInt("max"));
                for(int i=1;i<=3;i++)
                    System.out.println(obj[i]);
                psb.setPlace(obj[0]);
                psb.setTime(obj[1]);
                psb.setVacant(obj[2]);
                psb.setMax(obj[3]);
                System.out.println(psb.getPlace());
                list.add(psb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


}
