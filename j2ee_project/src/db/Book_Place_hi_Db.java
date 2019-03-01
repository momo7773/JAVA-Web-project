package db;
import domain.*;

import java.sql.ResultSet;

public interface Book_Place_hi_Db {
    public int order_insert(BookHiBean ob );
    public int order_update(BookHiBean ob);
    public int order_delete(BookHiBean ob);
    public int order_check(BookHiBean ob);
    public ResultSet order_select();

}
