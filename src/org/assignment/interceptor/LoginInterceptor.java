package org.assignment.interceptor;

import org.assignment.po.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.interceptor.Interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("拦截程序");
        //获取请求的URL
        String url=request.getRequestURI();
        //除了登录请求外，其他的URL都进行拦截控制
        if(url.indexOf("/login.action")>=0){
            System.out.println("登陆请求不拦截");
            return true;
        }
        //获取Session
        HttpSession session=request.getSession();
        String userCode=(String)session.getAttribute("userCode");
        //判断Session中是否有用户数据，如果有，则返回true，表示用户已登录，继续向下执行
        if(userCode!=null){
            System.out.println("请求合法");
            return true;
        }else {
            System.out.println("需要先登录!");
            //不符合条件，给出提示信息，并转发到登录页面
            request.setAttribute("msg", "您还没有登录，请先登录！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return false;
        }

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
