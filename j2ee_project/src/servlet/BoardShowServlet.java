package servlet;

import domain.BoardBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import domain.*;
import service.BoardService;

public class BoardShowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardService bs=new BoardService();
        String cnt_board = "0";
        ArrayList<BoardBean> board = new ArrayList<BoardBean>();
        board = bs.get_board();
        cnt_board = String.valueOf(board.size());
        response.setCharacterEncoding("utf-8");
        request.setAttribute("board",board);
        request.setAttribute("cnt_board",cnt_board);
        System.out.println("BoardServlet attributeSet success");
        request.getRequestDispatcher("User_Board.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
