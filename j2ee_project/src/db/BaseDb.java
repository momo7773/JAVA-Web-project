package db;
import java.sql.*;
import java.util.*;
import javax.xml.*;
import com.sun.javaws.*;

public class BaseDb  {
    private String url = "jdbc:mysql://127.0.0.1:3306/j2ee_project?useUnicode=true&characterEncoding=utf-8";
    private String user = "root";
    private String pwd = "";
    private Connection conn=null;
    private Statement stmt=null;
    public BaseDb() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url,user,pwd);
            System.out.println(conn.toString());
            //  stmt=conn.createStatement();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("加载驱动失败");
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
    }

    public Connection getconnection()
    {
        return this.conn;
    }

    public void close()
    {
        try{
            if(stmt!=null)
                stmt.close();
            if(conn!=null)
                conn.close();
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
    }

}
