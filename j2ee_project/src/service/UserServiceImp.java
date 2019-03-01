package service;

import db.IUserDaoImpl;
import domain.*;
import java.util.*;

public class UserServiceImp implements UserService {
    public int Register(User user)
    {
        Random rand=new Random();
        int userid=rand.nextInt(9999);
        user.setUserid(userid);
        IUserDaoImpl u=new IUserDaoImpl();
        if(u.add(user)!=0)
        {
            return 1;
        }
        else
            return 0;
    }

    @Override
    public int Login(UserLoginBean ulb) {
        int result=0;
        IUserDaoImpl u=new IUserDaoImpl();
        if(u.check(ulb)==1)
            return 1;
        else
            return 0;
    }
    public User select(int userid)
    {
        User user=null;
        IUserDaoImpl u=new IUserDaoImpl();
        user=u.select(userid);
        return user;
    }
    public int Update(User user)
    {
        int result=0;
        IUserDaoImpl u=new IUserDaoImpl();
        result=u.update_user(user);
        if(result!=0)
            result=1;
        return result;
    }
    public int Update_userinfo(User user)
    {
        int result=0;
        IUserDaoImpl iudi=new IUserDaoImpl();
        result=iudi.update_info(user);
        return result;
    }
}
