package org.assignment.web.controller;

import org.assignment.po.DocumentType;
import org.assignment.po.User;
import org.assignment.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.List;

@Controller
public class ChangePageController {
    @Autowired
    DocumentService documentService;

    @RequestMapping(value = "/goCourseNoticePage.action",method = RequestMethod.GET)
    public String goCourseNoticePage(HttpSession httpSession){
        if (httpSession.getAttribute("userType").equals(User.TEACHER))
            return "/WEB-INF/jsp/Teacher/courseNotice.jsp";
        else
            return "/WEB-INF/jsp/Student/courseNotice.jsp";
    }

    @RequestMapping(value = "/goCourseResourcePage.action",method = RequestMethod.GET)
    public String goCourseResourcePage(HttpSession httpSession){
        if (httpSession.getAttribute("userType").equals(User.TEACHER))
            return "/WEB-INF/jsp/Teacher/courseResource.jsp";
        else
            return "/WEB-INF/jsp/Student/courseResource.jsp";
    }

    @RequestMapping(value = "/goAssignmentProjectPage.action",method = RequestMethod.GET)
    public String goAssignmentProjectPage(HttpSession httpSession){
        if (httpSession.getAttribute("userType").equals(User.TEACHER))
            return "/WEB-INF/jsp/Teacher/assignmentProject.jsp";
        else
            return "/WEB-INF/jsp/Student/assignmentProject.jsp";
    }

    @RequestMapping(value = "/getDocumentTypeList.action",method = RequestMethod.GET)
    @ResponseBody
    public List<DocumentType> getDocumentTypeList(){
        return documentService.getDocumentTypeAll();
    }


}
