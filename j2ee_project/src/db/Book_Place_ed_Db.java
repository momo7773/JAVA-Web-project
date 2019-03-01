package db;
import domain.*;

import java.sql.ResultSet;

public interface Book_Place_ed_Db {
    public int order_insert(BookEdBean ob );
    public int order_update(BookEdBean ob);
    public int order_delete(BookEdBean ob);
    public int order_check(BookEdBean ob);
    public ResultSet order_select();

}
