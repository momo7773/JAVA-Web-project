package servlet;

import domain.BoardBean;
import service.BoardService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import domain.UserLoginBean;

public class AdminBoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("In AdminBoardServlet doPost");

        BoardService bs = new BoardService();

        BoardBean del_bb = new BoardBean();
        if(request.getParameter("delete_user")!=null){
            del_bb.setIduser(Integer.parseInt(request.getParameter("delete_user")));
            del_bb.setTitle(request.getParameter("delete_title"));
            del_bb.setContent(request.getParameter("delete_content"));
            int rs = bs.delete_board(del_bb);
            if(rs == 1)
                System.out.println("Delete 成功！");
        }

        String cnt_board = "0";
        ArrayList<BoardBean> board = new ArrayList<BoardBean>();
        board = bs.get_board();
        cnt_board = String.valueOf(board.size());
        response.setCharacterEncoding("utf-8");
        request.setAttribute("board",board);
        request.setAttribute("cnt_board",cnt_board);
        System.out.println("BoardServlet attributeSet success");
        request.getRequestDispatcher("AdminBoard.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        System.out.println("In AdminBoardServlet doGet");
        doPost(request,response);
    }
}
