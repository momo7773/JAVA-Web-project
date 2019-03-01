package util;

import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import org.apache.commons.logging.*;
public class WebUtils {
        /**
         * 将request对象转换成T对象
         * @param request
         * @param clazz
         * @return
         */
        public static <T> T request2Bean(HttpServletRequest request,Class<T> clazz){
            try{
                T bean = clazz.newInstance();
                Enumeration<String> e = request.getParameterNames();
                while(e.hasMoreElements()){
                    String name = (String) e.nextElement();
                    if(name.equals("conpwd"))
                        continue;
                    String value = request.getParameter(name);
                    System.out.println("有元素 "+value);
                    BeanUtils.setProperty(bean, name, value);
                    System.out.println("done 1");
                }
                System.out.println("复制成功");
                return bean;
            }catch (Exception e) {
                System.out.println("复制失败");
                throw new RuntimeException(e);

            }
        }
}
