package db;

import domain.BoardBean;

import java.sql.*;

public class IBoardDaoImpl extends BaseDb implements IBoardDao {
    public int insert_comment(BoardBean bb){
        boolean flag=false;
        int result = 0;
        BaseDb db =null;
        PreparedStatement pstm = null;
        String insert = "insert into board(iduser,title,content,sub_time)values(?,?,?,?)";
        ResultSet rs=this.select_comment_double(bb);
        if(rs!=null)
        {
            try {
                if (rs.next()) {
                    System.out.println("标题有啦啦啦啦");
                    flag = true;
                }
                else
                    System.out.println("标题还不在呀呀呀");
            }catch (SQLException e)
            {
                System.out.println(e.getMessage());
            }
        }
        if(flag==false) {
            try {
                db = new BaseDb();
                pstm = (PreparedStatement) db.getconnection().prepareStatement(insert);
                pstm.setInt(1, bb.getIduser());
                pstm.setString(2, bb.getTitle());
                pstm.setString(3, bb.getContent());
                Timestamp now = new Timestamp(System.currentTimeMillis());
                pstm.setTimestamp(4, now);

                result = pstm.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
        db.close();
        return result;
    }

    public ResultSet select_comment(){
        ResultSet rs = null;
        BaseDb db =null;
        PreparedStatement pstm = null;
        String select = "SELECT image,user.iduser,title,content,sub_time from board inner join user on user.iduser=board.iduser;";
        try {
            db = new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(select);
            rs=pstm.executeQuery();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return rs;
    }
    public ResultSet select_comment_double(BoardBean bb){
        ResultSet rs = null;
        BaseDb db =null;
        PreparedStatement pstm = null;
        String select = "SELECT image,user.iduser,title,content,sub_time from board inner join user on user.iduser=board.iduser and title=?;";
        try {
            db = new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(select);
            pstm.setString(1,bb.getTitle());
            rs=pstm.executeQuery();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return rs;
    }
    public int delete_comment(BoardBean bb){
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String delete="DELETE FROM board where iduser=? AND title=? AND content=?";
        try{
            db = new BaseDb();
            pstm=(PreparedStatement)db.getconnection().prepareStatement(delete);
            pstm.setInt(1,bb.getIduser());
            pstm.setString(2,bb.getTitle());
            pstm.setString(3,bb.getContent());

            result = pstm.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }
        db.close();
        return result;
    }
}
