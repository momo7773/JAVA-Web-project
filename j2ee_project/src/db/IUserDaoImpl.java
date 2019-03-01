package db;

import domain.*;

import java.awt.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IUserDaoImpl extends BaseDb implements IUserDao {
    public int add(User user) {

        int result = 0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update = "insert into user(iduser,user_name,Id_Num,Pwd,Tel,Email,Nickname,image)values(?,?,?,?,?,?,?,?)";
        try {
            System.out.println("数据库中");
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            pstm.setString(1, String.valueOf(user.getUserid()));
            pstm.setString(2, user.getUserName());
            pstm.setString(3, user.getId_num());
            pstm.setString(4, user.getPwd());
            pstm.setString(5, user.getTel());
            pstm.setString(6, user.getEmail());
            pstm.setString(7, user.getNickname());
            pstm.setString(8,user.getImg());
            result = pstm.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return result;
    }

    @Override
    public int check(UserLoginBean ulb) {
        int result = 0;
        int userid = ulb.getUserid();
        String pwd = ulb.getPwd();
        BaseDb db = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String select = "SELECT iduser,Pwd From user WHERE iduser=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(select);
            System.out.println(ulb.getUserid());
            pstm.setInt(1, ulb.getUserid());
            rs = pstm.executeQuery();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        String passwd = "";
        if (rs != null) {
            try {
                if (rs.next()) {
                    passwd = rs.getString("Pwd");
                }
            } catch (SQLException ee) {
                ee.printStackTrace();
            }
        } else
            System.out.println("rs==null");
        if (passwd.equals(pwd)) {
            return 1;
        } else
            return 0;
    }
    public User select(int userid)
    {
        BaseDb db = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        User user=new User();

        String select = "SELECT * From user WHERE iduser=?";
        try {
            db = new BaseDb();

            pstm = (PreparedStatement) db.getconnection().prepareStatement(select);
            pstm.setInt(1, userid);
            rs = pstm.executeQuery();
        }catch(SQLException e)
        {
            System.out.println(e.getMessage());
        }
        if (rs != null) {
            try {
                if(rs.next())
                {
                    user.setUserid(rs.getInt("iduser"));
                    user.setUserName(rs.getString("user_name"));
                    user.setEmail(rs.getString("Email"));
                    user.setTel(rs.getString("Tel"));
                    user.setId_num(rs.getString("Id_Num"));
                    System.out.println("usernickname "+rs.getString("Id_Num"));
                    user.setNickname(rs.getString("Nickname"));
                    System.out.println("usernickname "+rs.getString("Nickname"));
                    user.setPwd(rs.getString("Pwd"));
                    System.out.println("usernickname "+rs.getString("Pwd"));
                    user.setImg(rs.getString("image"));
                    System.out.println("image "+user.getImg());
                }
            } catch (SQLException ee) {
                ee.printStackTrace();
            }
        } else
            System.out.println("rs==null");
        return user;
    }
    public int update_user(User u)
    {
        int result=0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update="UPDATE user SET image=? where iduser=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            pstm.setString(1, u.getImg());
            pstm.setInt(2, u.getUserid());
            result=pstm.executeUpdate();
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
    public int update_info(User user)
    {
        int result=0;
        BaseDb db = null;
        PreparedStatement pstm = null;
        String update="UPDATE user SET Nickname=?,Email=?,Tel=? where iduser=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(update);
            pstm.setString(1, user.getNickname());
            pstm.setString(2, user.getEmail());
            pstm.setString(3, user.getTel());
            pstm.setInt(4,user.getUserid());
            result = pstm.executeUpdate();
        }catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
}