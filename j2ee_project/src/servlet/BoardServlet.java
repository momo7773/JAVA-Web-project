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

public class BoardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("In BoardServlet doPost");

        BoardService bs = new BoardService();
        String title = request.getParameter("comment-title");
        String content = request.getParameter("comment-content");
        System.out.println("title: " + title);
        System.out.println("content: " + content);
        UserLoginBean ulb = (UserLoginBean) request.getSession().getAttribute("user");
        int userid = ulb.getUserid();
        BoardBean bb = new BoardBean();
        bb.setIduser(userid);
        bb.setTitle(title);
        bb.setContent(content);
        if (title != null && content != null) {
            int rs = bs.insert_board(bb);
            if (rs == 1) {
                System.out.println("插入新的留言成功！");
                request.getRequestDispatcher("BoardShowServlet").forward(request, response);
            }
            else
                request.getRequestDispatcher("404.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        System.out.println("In BoardServlet doGet");
        doPost(request,response);
    }
}
