package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import domain.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.AdminServiceImpl;

public class AdminNewsAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Parse the request
        try {
            NewsBean nb=new NewsBean();
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                //如果是普通的form元素
                if(item.isFormField()) {
                    String filename=item.getFieldName();
                    System.out.println("filename"+filename);
                    String value=item.getString("utf-8");
                    System.out.println("普通form元素"+filename+":"+value);
                    if(filename.equals("title")) {
                        nb.setTitle(value);
                    }else if(filename.equals("content")) {
                        nb.setContent(
                                value);
                    }else if(filename.equals("type")) {
                        if(value.equals("图书馆"))
                        {
                            nb.setIdplace(1);
                        }
                        else if(value.equals("体育馆"))
                        {
                            nb.setIdplace(2);
                        }
                        else if(value.equals("名人故居"))
                        {
                            nb.setIdplace(3);
                        }
                        else if(value.equals("科普教育基地"))
                        {
                            nb.setIdplace(4);
                        }
                        else
                            System.out.println("一个都不是选项!!");
                    }
                }else {
                    String filename=item.getName();
                    System.out.println("文件"+filename);
                    //获取文件名的后缀
                    String suffix=filename.substring(filename.lastIndexOf('.'));
                    //为了防止上传到服务器中的文件重名，所以在上传的时候我们可以将文件进行自动生成前缀，只保留后缀，再拼接到一块的方法，来避免文件重名
                    UUID uuid=UUID.randomUUID();
                    String prefix=uuid.toString();
                    //拼接后的文件名
                    String savefilename=prefix+suffix;
                    savefilename=savefilename.replace("-", "");
                    //System.out.println("要保存的文件名为"+savefilename);
                    String path=servletContext.getRealPath("/Resources/images/newsImage");
                    nb.setImage(savefilename);

                    System.out.println("path"+path);
                    InputStream is=item.getInputStream();
                    OutputStream os=new FileOutputStream(new File(path+File.separator+savefilename));
                    byte[] b=new byte[1024];
                    int len;
                    while((len=is.read(b))!=-1) {
                        os.write(b, 0, len);
                    }
                    is.close();
                    os.close();
                }
            }
            AdminServiceImpl asi=new AdminServiceImpl();
            int result=asi.addNews(nb);
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

    }
}
