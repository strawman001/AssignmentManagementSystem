package org.assignment.web.controller;

import org.assignment.po.CourseNotice;
import org.assignment.service.CourseNoticeService;
import org.assignment.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseNoticeController {
    @Autowired
    CourseNoticeService courseNoticeService;
    @Autowired
    DateUtils dateUtils;

    @RequestMapping(value = "/addCourseNotice.action",method = RequestMethod.POST)
    @ResponseBody
    public boolean addCourseNotice(@RequestBody CourseNotice courseNotice){
        courseNotice.setCourseNoticeTime(dateUtils.getNowTime());
        return  courseNoticeService.addCourseNotice(courseNotice);
    }

    @RequestMapping(value = "/delCourseNotice.action",method = RequestMethod.GET)
    @ResponseBody
    public boolean delCourseResource(HttpServletRequest httpServletRequest){
        Integer courseNoticeID = Integer.parseInt(httpServletRequest.getParameter("courseNoticeID"));
        return courseNoticeService.delCourseNotice(courseNoticeID);
    }

    @RequestMapping(value = "/modCourseNotice.action",method = RequestMethod.POST)
    @ResponseBody
    public boolean modCourseNotice(@RequestBody CourseNotice courseNotice){
        return courseNoticeService.editCourseNotice(courseNotice);
    }

    @RequestMapping(value = "/getCourseNoticeList.action",method = RequestMethod.GET)
    @ResponseBody
    public List<CourseNotice> getCourseNoticeList(HttpSession httpSession){
        Integer courseID = (Integer) httpSession.getAttribute("courseID");
        List<CourseNotice> list = courseNoticeService.findCourseNotice(courseID);
        return list;
    }

}
