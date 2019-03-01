package servlet;

import domain.NewsBean;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.AdminServiceImpl;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "NewsUpdateServlet")
public class NewsUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Parse the request
        try {
            NewsBean nbu=new NewsBean();
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                System.out.println("更新servlet开始 ");
                //如果是普通的form元素
                if(item.isFormField()) {
                    String filename=item.getFieldName();
                    System.out.println("filename"+filename);
                    String value=item.getString("utf-8");
                    System.out.println("普通form元素"+filename+":"+value);
                    if(filename.equals("auto_incr")) {
                        nbu.setAuto_incr(Integer.valueOf(value));
                    }
                    if(filename.equals("title")) {
                        System.out.println("更新servlet content "+value);
                        nbu.setTitle(value);
                    }else if(filename.equals("content")) {
                        nbu.setContent(
                                value);
                    }else if(filename.equals("type")) {
                        if(value.equals("图书馆"))
                        {
                            nbu.setIdplace(1);
                        }
                        else if(value.equals("体育馆"))
                        {
                            nbu.setIdplace(2);
                        }
                        else if(value.equals("名人故居"))
                        {
                            nbu.setIdplace(3);
                        }
                        else if(value.equals("科普教育基地"))
                        {
                            nbu.setIdplace(4);
                        }
                        else
                            System.out.println("一个都不是选项!!");
                    }
                }
            }
            AdminServiceImpl asi=new AdminServiceImpl();
            int result=asi.update(nbu);
            if(result==1) {
                request.getRequestDispatcher("AdminShowServlet").forward(request, response);
            }else {
                request.getRequestDispatcher("index_3.jsp").forward(request, response);
            }
        } catch (FileUploadException e) {
            // TODO Auto-generated catch block
            System.out.println("上传error！！！");
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
