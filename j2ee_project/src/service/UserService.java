package service;
import domain.*;

public interface UserService {
    public int Register(User user);
    public int Login(UserLoginBean ulb);
    public User select(int userid);
}
