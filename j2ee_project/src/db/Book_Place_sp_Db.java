package db;
import domain.*;

import java.sql.ResultSet;

public interface Book_Place_sp_Db {
    public int order_insert(BookSpBean ob );
    public int order_update(BookSpBean ob);
    public int order_delete(BookSpBean ob);
    public int order_check(BookSpBean ob);
    public ResultSet order_select();

}
