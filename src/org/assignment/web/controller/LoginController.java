package org.assignment.web.controller;

import org.assignment.po.User;
import org.assignment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
    @Autowired
    UserService userService;

    @RequestMapping(value = "/login.action",method = RequestMethod.POST)
    public String login(HttpSession httpSession, String userName,String password, Model model){
        User realUser = userService.findUser(userName,password);
        if (realUser!=null){
            httpSession.setAttribute("userID",realUser.getUserID());
            httpSession.setAttribute("userCode",realUser.getUserCode());
            httpSession.setAttribute("userType",realUser.getUserType());
            if(realUser.getUserType().equals(User.STUDENT)){
                System.out.println("跳转学生课程页");
                return "/WEB-INF/jsp/Student/courseListPage.jsp";
            }
            else if(realUser.getUserType().equals(User.TEACHER)){
                System.out.println("跳转老师课程页");
                return "/WEB-INF/jsp/Teacher/courseListPage.jsp";
            }
            else
                return "login.jsp";
        }else {
            System.out.println("没有这个用户");
            model.addAttribute("msg", "账号未启用或被禁用，请联系管理员！");
            return "login.jsp";
        }
    }
}
