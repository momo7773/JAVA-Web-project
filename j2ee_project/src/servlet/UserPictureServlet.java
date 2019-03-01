package servlet;

import domain.NewsBean;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;
import domain.*;
import service.UserServiceImp;

public class UserPictureServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        User user=(User)request.getSession().getAttribute("userinfo_detail");
        // Parse the request
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                //如果是普通的form元素
                if (item.isFormField()) {
                    System.out.println("是普通元素");
                } else {
                    String filename = item.getName();
                    System.out.println("文件" + filename);
                    //获取文件名的后缀
                    String suffix = filename.substring(filename.lastIndexOf('.'));
                    //为了防止上传到服务器中的文件重名，所以在上传的时候我们可以将文件进行自动生成前缀，只保留后缀，再拼接到一块的方法，来避免文件重名
                    UUID uuid = UUID.randomUUID();
                    String prefix = uuid.toString();
                    //拼接后的文件名
                    String savefilename = prefix + suffix;
                    savefilename = savefilename.replace("-", "");
                    //System.out.println("要保存的文件名为"+savefilename);
                    String path = servletContext.getRealPath("/Resources/images/userImage");
                    user.setImg(savefilename);

                    System.out.println("path" + path);
                    InputStream is = item.getInputStream();
                    OutputStream os = new FileOutputStream(new File(path + File.separator + savefilename));
                    byte[] b = new byte[1024];
                    int len;
                    while ((len = is.read(b)) != -1) {
                        os.write(b, 0, len);
                    }
                    is.close();
                    os.close();
                }
            }
        }catch(FileUploadException e)
        {
            System.out.println(e.getMessage());
        }
        request.getSession().setAttribute("userinfo_detail",user);
        UserServiceImp usi=new UserServiceImp();
        int result=usi.Update(user);
        if(result!=0)
            request.getRequestDispatcher("UserInfoServlet").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
