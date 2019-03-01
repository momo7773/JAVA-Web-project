package service;

import db.*;
import domain.*;
import domain.PlaceShowBean;
import domain.UserLoginBean;

import java.awt.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class AdminServiceImpl {
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
            "宋庆龄故居","中共一大会址","黄浦区青少年活动中心","黄浦区科技馆"};
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
            if(i==141)
                multi=9;
            if(i==142)
                multi=10;
            if(i==143)
                multi=11;
            place_id[i-1]=index[(i-1)%20]+count*multi;
        }
        for(i=0;i<144;i++)
        {
            place.put(place_id[i],place_name[i]);
        }
    }
    public int update_user_order(UserOrderBean uob)
    {
        int result=0;
        IBookUserDaoImpl ibud=new IBookUserDaoImpl();
        result=ibud.order_check(uob);
        return result;


    }
    public int delete_user_order(UserOrderBean uob)
    {
        int result=0;
        IBookUserDaoImpl ibud=new IBookUserDaoImpl();
        result=ibud.order_delete1(uob);
        return result;
    }
    public ArrayList<UserOrderBean> display_order()
    {
        ArrayList<UserOrderBean> list=new ArrayList<UserOrderBean>();
        IBookUserDaoImpl ibud=new IBookUserDaoImpl();
        ResultSet rs=ibud.order_select();
        set_i();
        if(rs!=null)
        {
            try {
                while (rs.next()) {
                    UserOrderBean uob=new UserOrderBean();
                    int auto_incr=rs.getInt("auto_incr");
                    uob.setAuto_incr(auto_incr);
                    int idplace = rs.getInt("idplace");
                    uob.setIdplace(idplace);
                    int idroom = rs.getInt("idroom");
                    uob.setIdroom(idroom);
                    int idget = idroom + idplace * 1000;
                    System.out.println("get "+idget);
                    if (place.containsKey(idget)) {
                        String place_name = place.get(idget);
                        System.out.println(place_name);
                        uob.setPlace_name(place_name);
                    }
                    String sub_time = rs.getTimestamp("Book_time").toString();
                    uob.setSub_time(sub_time);
                    int status = rs.getInt("status");
                    if(status==0)
                        uob.setStatus("待审核");
                    else if(status==1)
                        uob.setStatus("已预约");
                    int iduser = rs.getInt("iduser");
                    uob.setUserid(iduser);
                    list.add(uob);
                }
            }catch(SQLException e)
            {
                System.out.println(e.getMessage());
            }
        }
        return list;

    }
    public int Login(AdminBean ab) {
        int result = 0;
        AdminDaoImpl adi = new AdminDaoImpl();
        if (adi.check(ab) == 1)
            return 1;
        else
            return 0;
    }
    public int addNews(NewsBean nb)
    {
        int result=0;
        NewsDb nd=new NewsDb();
        if(nd.add(nb)!=0)
        {
            System.out.println("result !=0 !!!");
            return 1;
        }
        else
            return 0;
    }

    public ArrayList<ShowNewsBean> select() {
        ResultSet rs = null;
        NewsDb nd = new NewsDb();
        ArrayList<ShowNewsBean> list = new ArrayList<ShowNewsBean>();
        System.out.println("准备select");
        rs = nd.select();
        try {
            while (rs.next()) {
                ShowNewsBean snb = new ShowNewsBean();
                snb.setTitle(rs.getString("title"));
                System.out.println(snb.getTitle());
                snb.setContent(rs.getString("content"));
                System.out.println(snb.getContent());
                snb.setSub_time(rs.getTimestamp("sub_time").toString());
                System.out.println(snb.getSub_time());
                snb.setImage(rs.getString("image"));
                System.out.println(snb.getImage());
                snb.setAuto_incr(rs.getInt("auto_incr"));
                System.out.println(" select return "+snb.getAuto_incr());
                list.add(snb);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    public int update(NewsBean nb)
    {
        int result=0;
        NewsDb nd = new NewsDb();
        result=nd.update(nb);
        if(result!=0)
             result=1;
        return result;
    }
    public int delete(NewsBean nb)
    {
        int result=0;
        NewsDb nd=new NewsDb();
        result=nd.delete(nb);
        if(result!=0)
            result=1;
        return result;
    }
    public int insert_book(UserOrderBean uob) {

        int result = 0;
        int idplace = uob.getIdplace();
        ResultSet rs = null;
        BookLiBean blb = new BookLiBean();
        if (idplace <= 4) {
            Book_Place_li_Db_Impl bpl = new Book_Place_li_Db_Impl();
            rs = bpl.order_select2(uob);
            if (rs != null) {
                try {
                    while (rs.next()) {
                        System.out.println("select 表返回了");
                        if (rs.getInt("vacancy") <= rs.getInt("max") && rs.getInt("vacancy") > 0) {
                            blb.setIdplace(String.valueOf(uob.getIdplace()));
                            System.out.println("空闲大于0");
                            blb.setIdroom(String.valueOf(uob.getIdroom()));
                            blb.setMax(String.valueOf(rs.getInt("max")));
                            blb.setVacancy(String.valueOf(rs.getInt("vacancy")));
                            blb.setTime(uob.getSub_time());
                            result = bpl.order_update(blb);
                        }
                        else if(rs.getInt("vacancy")==0)
                        {
                            result=-1;
                        }
                    }
                }catch(SQLException e)
                {
                    System.out.println(e.getMessage());
                }
            }
        }
        return result;
    }


}
