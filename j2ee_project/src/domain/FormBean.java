package domain;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 封装的用户注册表单bean，用来接收register.jsp中的表单输入项的值
 * RegisterFormBean中的属性与register.jsp中的表单输入项的name一一对应
 * RegisterFormBean的职责除了负责接收register.jsp中的表单输入项的值之外还担任着校验表单输入项的值的合法性
 * @author gacl
 *
 */
public class FormBean {

        //RegisterFormBean中的属性与register.jsp中的表单输入项的name一一对应
        //<input type="text" name="userName"/>
        private String userName;
        //<input type="password" name="userPwd"/>
        private int userid;
        private String id_num;
        private String email;
        private String tel;
        private String nickname;
        private String pwd;
        private String img;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getId_num() {
        return id_num;
    }

    public void setId_num(String id_num) {
        this.id_num = id_num;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }




        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }




}

