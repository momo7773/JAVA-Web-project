package service;

import db.IBoardDao;
import db.IBoardDaoImpl;
import domain.BoardBean;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardService {
    public ArrayList<BoardBean> get_board(){
        ArrayList<BoardBean> board_comment = new ArrayList<BoardBean>();
        IBoardDaoImpl bd = new IBoardDaoImpl();
        ResultSet rs = bd.select_comment();
        try{
            if(rs!=null){
                while (rs.next()){
                    BoardBean bb = new BoardBean();
                    int iduser = rs.getInt("iduser");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Timestamp sub_time = rs.getTimestamp("sub_time");
                    String img=rs.getString("image");
                    System.out.println("img "+img);
                    bb.setIduser(iduser);
                    bb.setTitle(title);
                    bb.setContent(content);
                    bb.setSub_time(sub_time);
                    bb.setImg(img);
                    board_comment.add(bb);
                }
            }
            else
                System.out.println("留言板选择null");
        }catch (Exception e){
            e.printStackTrace();
        }
        return board_comment;
    }

    public int insert_board(BoardBean bb){
        IBoardDaoImpl bd = new IBoardDaoImpl();
        int rs = 0;
        rs = bd.insert_comment(bb);
        return rs;
    }

    public int delete_board(BoardBean bb){
        IBoardDaoImpl bd = new IBoardDaoImpl();
        int rs = 0;
        rs = bd.delete_comment(bb);
        return rs;
    }
}
