package db;
import domain.*;
import java.sql.*;
import java.text.SimpleDateFormat;

import db.BaseDb.*;
public class Book_Place_hi_Db_Impl implements Book_Place_hi_Db {
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

    public int order_insert(BookHiBean ob)
    {
        int result=0;
        BaseDb db=null;
        PreparedStatement pstm=null;
        String insert="insert into book_place_hi(idplace,idroom,Book_time,vacancy,max)values(?,?,?,?,?)";
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(insert);
            pstm.setString(1,String.valueOf(ob.getIdplace()));
            pstm.setString(2,"0");
            pstm.setTimestamp(3,strToDate(ob.getTime()));
            pstm.setString(4,String.valueOf(ob.getVacancy()));
            pstm.setString(5,String.valueOf(ob.getMax()));
            result=pstm.executeUpdate();

        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("插入hi数据异常");
        }
        db.close();
        return result;
    }

    //select where vacancy>0
    public ResultSet order_select()
    {
        BaseDb db=null;
        PreparedStatement pstm=null;
        String select="SELECT * FROM book_place_hi where vacancy>0";
        ResultSet rs=null;
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(select);
            System.out.println(pstm.toString());
            rs=pstm.executeQuery();
          /*  if(pstm!=null)
            {
                pstm.close();
            }*/
        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("查询Book_Place_hi_Db数据异常");
        }
        //  db.close();
        return rs;
    }

    //update
    public int order_delete(BookHiBean ob)
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String delete="DELETE FROM book_place_hi where idplace=? AND idroom=? AND Book_time=?";
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(delete);
            pstm.setString(1,ob.getIdplace());
            pstm.setString(2,ob.getIdroom());
            pstm.setTimestamp(3,strToDate(ob.getTime()));

            result=pstm.executeUpdate();
        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("删除hi数据异常");
        }
        db.close();
        return result;
    }
    public int order_update(BookHiBean ob)
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update="UPDATE book_place_hi SET vacancy=? where idplace=? AND idroom=? AND Book_time=?";
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(update);
            int int_vaca = Integer.valueOf(ob.getVacancy()).intValue();
            System.out.println("vacancy: "+int_vaca);
            pstm.setInt(1,int_vaca-1);
            pstm.setString(2,ob.getIdplace());
            pstm.setString(3,ob.getIdroom());
            pstm.setTimestamp(4,strToDate(ob.getTime()));

            result=pstm.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("更新hi数据异常");
        }
        db.close();
        return result;
    }

    //待定
    public int order_check(BookHiBean ob)
    {

        return 1;
    }
}
