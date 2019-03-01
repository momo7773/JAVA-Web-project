package db;

import domain.NewsBean;
import domain.ShowNewsBean;

import java.sql.*;
import java.util.ArrayList;

public class NewsDb {
    public int add(NewsBean nb)
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update = "insert into news(idplace,title,content,sub_time,image)values(?,?,?,?,?)";
        try {
            System.out.println("数据库中插新闻");
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            System.out.println("set pstm");
            pstm.setInt(1, nb.getIdplace());
            pstm.setString(2, nb.getTitle());
            pstm.setString(3, nb.getContent());
            pstm.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            pstm.setString(5, nb.getImage());
            System.out.println("insert standby");
            result = pstm.executeUpdate();
        }catch (SQLException r)
        {
            System.out.println(r.getMessage());
        }
        return result;
    }
    public ResultSet select()
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update = "Select * from news;";
        ResultSet rs=null;
        try {
            System.out.println("数据库中查询新闻");
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            rs = pstm.executeQuery();
        }catch(SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return  rs;
    }
    public int update(NewsBean nb)
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update = "UPDATE news SET title=?,content=?,sub_time=? where auto_incr=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            System.out.println("newsdb "+nb.getAuto_incr());
            pstm.setString(1, nb.getTitle());
            pstm.setString(2, nb.getContent());
            pstm.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
            pstm.setInt(4, nb.getAuto_incr());
            result = pstm.executeUpdate();
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
    public int delete(NewsBean nb)
    {
        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String delete="DELETE FROM news where auto_incr=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(delete);
            System.out.println("newsdeletedb " + nb.getAuto_incr());
            pstm.setInt(1, nb.getAuto_incr());
            result = pstm.executeUpdate();
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
}
