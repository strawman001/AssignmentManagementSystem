package org.assignment.web.controller;

import org.assignment.po.Course;
import org.assignment.po.Student;
import org.assignment.po.User;
import org.assignment.service.CourseService;
import org.assignment.service.CourseStudentService;
import org.assignment.service.CourseTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseController {
    @Autowired
    CourseService courseService;
    @Autowired
    CourseTypeService courseTypeService;
    @Autowired
    CourseStudentService courseStudentService;

    @RequestMapping(value="/getCourseList.action",method=RequestMethod.GET)
    @ResponseBody
    public List<Course> getCourseList(HttpSession httpSession){
        //System.out.println("获取课程列表");
        List<Course> list = courseService.findMyCourseList((Integer) httpSession.getAttribute("userID"));
        return list;
    }

    @RequestMapping(value = "/getCourse.action",method = RequestMethod.GET)
    public String getCourse(HttpServletRequest httpServletRequest, HttpSession httpSession){
        Integer courseID = Integer.parseInt(httpServletRequest.getParameter("courseID"));
        httpSession.setAttribute("courseID",courseID);
        if (httpSession.getAttribute("userType").equals(User.TEACHER))
            return "/WEB-INF/jsp/Teacher/courseNotice.jsp";
        else
            return "/WEB-INF/jsp/Student/courseNotice.jsp";
    }

    @RequestMapping(value = "/modCourse.action",method = RequestMethod.POST)
    @ResponseBody
    public boolean modCourse(@RequestBody Course course){
        return courseService.editCourse(course);
    }

    @RequestMapping(value = "/getCourseStudent.action",method = RequestMethod.GET)
    @ResponseBody
    public List<Student> getCourseStudentList(HttpSession httpSession){
        Integer courseID = (Integer) httpSession.getAttribute("courseID");
        return courseStudentService.findStudentByCourse(courseID);
    }
    
    @RequestMapping(value = "/getSession.action",method = RequestMethod.GET)
    @ResponseBody
    public HttpSession getSession(HttpSession session){
        return session;
    }

}
