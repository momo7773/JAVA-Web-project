package db;

import domain.BoardBean;

import java.sql.ResultSet;

public interface IBoardDao {
    public int insert_comment(BoardBean bb);
    public ResultSet select_comment();
    public int delete_comment(BoardBean bb);
}
