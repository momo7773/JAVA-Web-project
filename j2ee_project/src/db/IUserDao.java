package db;
import domain.*;

public interface IUserDao {
    public int add(User user);
    public int check(UserLoginBean ulb);
    public User select(int userid);
    public int update_user(User u);
}
