package db;

import domain.OrderBean;
import domain.UserLoginBean;
import domain.UserOrderBean;

import javax.imageio.plugins.tiff.TIFFImageReadParam;
import java.awt.print.Book;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class IBookUserDaoImpl {

    public int order_insert(OrderBean order) {
        int result = 1;
        BaseDb db = null;
        PreparedStatement pstm1 = null;


        String select = "SELECT idplace,idroom,Book_time From book_user WHERE iduser=?";
        ResultSet rs = null;
        try {
            db = new BaseDb();
            pstm1 = (PreparedStatement) db.getconnection().prepareStatement(select);
            pstm1.setInt(1,order.getIduser());
            rs = pstm1.executeQuery();
            //System.out.println("get order info; "+order.getIduser()+order.getIdplace()+order.getBook_time());

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        PreparedStatement pstm = null;
        String insert = "insert into book_user(iduser,idplace,idroom,Book_time,status)values(?,?,?,?,?)";
        try {
            pstm = (PreparedStatement) db.getconnection().prepareStatement(insert);
            int idplace = 0;
            int idroom = 0;
            Timestamp Book_time = new Timestamp(new Date().getTime());
            if (rs != null) {
                System.out.println("rs is not empty!");
                    while(rs.next()){
                        System.out.println("rs has next");
                        idplace = rs.getInt("idplace");
                        idroom =  rs.getInt("idroom");
                        Book_time = rs.getTimestamp("Book_time");
                        System.out.println(idplace+" "+idroom+" "+Book_time);
                        if(Book_time.equals(order.getBook_time())){
                            System.out.println("有相同时间的order");
                            if(idplace == order.getIdplace() && idroom == order.getIdroom()){
                                System.out.println("预约了相同时间的相同地点");
                                result = 2;
                                break;
                            }
                            else {
                                System.out.println("预约了此时间的其他地点");
                                result = 0;
                                break;
                            }
                        }
                    }
            }
            if(result == 1){
                pstm.setInt(1, order.getIduser());
                pstm.setInt(2, order.getIdplace());
                pstm.setInt(3,order.getIdroom());
                pstm.setTimestamp(4, order.getBook_time());
                pstm.setInt(5, 0);
                result = pstm.executeUpdate();
                System.out.println("可以预约这个时间段 插入了 "+result+" 行order");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return result;
    }

    public ResultSet order_select(){
        BaseDb db=null;
        PreparedStatement pstm=null;
        String select="SELECT auto_incr,iduser,idplace,idroom,Book_time,status FROM book_user";
        ResultSet rs = null;
        try{
            db = new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(select);
            System.out.println(pstm.toString());
            rs=pstm.executeQuery();
        }catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("BookUserDaoImpl 查询数据异常");
        }
        return rs;
    }

    public int order_update(UserOrderBean uob){
        return 1;
    }

    public int order_delete1(UserOrderBean uob){
        int result=0;
        BaseDb db=null;
        PreparedStatement pstm=null;
        String delete="DELETE FROM book_user where auto_incr=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(delete);
            pstm.setInt(1, uob.getAuto_incr());
            result = pstm.executeUpdate();
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }

    //for admin only
    public int order_check(UserOrderBean uob){
        int result=0;
        BaseDb db=null;
        PreparedStatement pstm=null;
        String update = "UPDATE book_user SET status=? where iduser=? AND auto_incr=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            pstm.setInt(1, 1);
            pstm.setInt(2, uob.getUserid());
            pstm.setInt(3,uob.getAuto_incr());
            result = pstm.executeUpdate();
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;

    }
    public int order_delete(OrderBean ob){
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String delete="DELETE FROM book_user where iduser=? AND idplace=? AND idroom=? AND Book_time=?";
        try{
            db = new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(delete);
            pstm.setInt(1,ob.getIduser());
            pstm.setInt(2,ob.getIdplace());
            pstm.setInt(3,ob.getIdroom());
            pstm.setTimestamp(4,ob.getBook_time());

            result = pstm.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        db.close();
        return result;
    }

}
