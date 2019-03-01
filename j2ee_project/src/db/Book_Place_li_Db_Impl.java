package db;
import domain.*;
import java.sql.*;
import db.BaseDb.*;
import java.text.SimpleDateFormat;
public class Book_Place_li_Db_Impl {
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
    public int order_insert(BookLiBean ob)
    {
        int result=0;
        BaseDb db=null;
        PreparedStatement pstm=null;
        String insert="insert into book_place_li(idplace,idroom,Book_time,vacancy,max)values(?,?,?,?,?)";
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(insert);
            pstm.setString(1,String.valueOf(ob.getIdplace()));
            pstm.setString(2,String.valueOf(ob.getIdroom()));
            pstm.setTimestamp(3,strToDate(ob.getTime()));
            pstm.setString(4,String.valueOf(ob.getVacancy()));
            pstm.setString(5,String.valueOf(ob.getMax()));
            result=pstm.executeUpdate();

        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("插入数据异常");
        }
        db.close();
        return result;
    }
    public ResultSet order_select()
    {
        BaseDb db=null;
        PreparedStatement pstm=null;
        String select="SELECT * FROM book_place_li;";
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
            System.out.println("查询数据异常");
        }
      //  db.close();
        return rs;
    }
    public int order_update(BookLiBean ob)
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update="UPDATE book_place_li SET vacancy=? where idplace=? AND idroom=? AND Book_time=?";
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(update);
            int int_vaca = Integer.valueOf(ob.getVacancy());
            System.out.println("vacancy: "+int_vaca);
            pstm.setInt(1,int_vaca-1);
            pstm.setString(2,ob.getIdplace());
            pstm.setString(3,ob.getIdroom());
            pstm.setTimestamp(4,strToDate(ob.getTime()));

            result=pstm.executeUpdate();
        }catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("更新数据异常");
        }
        db.close();
        return result;
    }
    public int order_delete(OrderBean ob)
    {
        return 1;
    }
    public int order_check(OrderBean ob)
    {
        return 1;
    }
    public ResultSet order_select2(UserOrderBean ob)
    {
        BaseDb db=null;
        PreparedStatement pstm=null;
        String select="SELECT vacancy,max FROM book_place_li where idplace=? and idroom=? and Book_time=?";
        ResultSet rs=null;
        try{
            db=new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(select);
            System.out.println(pstm.toString());
            pstm.setInt(1,ob.getIdplace());
            pstm.setInt(2,ob.getIdroom());
            pstm.setTimestamp(3,strToDate(ob.getSub_time()));
            rs=pstm.executeQuery();
          /*  if(pstm!=null)
            {
                pstm.close();
            }*/
        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("查询Book_Place_li_Db数据异常");
        }
        //  db.close();
        return rs;
    }

}
