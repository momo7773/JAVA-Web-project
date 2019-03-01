package db;

import domain.AdminBean;
import domain.UserLoginBean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoImpl {
    public int check(AdminBean ab) {
        int result = 0;
        String name= ab.getName();
        String pwd = ab.getPwd();
        BaseDb db = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        String select = "SELECT Name,Pwd From admin WHERE Name=?";
        try {
            db = new BaseDb();
            pstm = (PreparedStatement) db.getconnection().prepareStatement(select);
            pstm.setString(1,name);
            rs = pstm.executeQuery();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        String passwd = "";
        if (rs != null) {
            try {
                System.out.println("非null" );
                if (rs.next()) {
                    passwd = rs.getString("Pwd");
                    System.out.println(passwd);
                }
            } catch (SQLException ee) {
                ee.printStackTrace();
            }
        } else
            System.out.println("rs==null");
        System.out.println("pwd "+pwd);
        if (passwd.equals(pwd)) {
            return 1;
        } else
            return 0;
    }
}
