package org.assignment.web.controller;

import com.sun.org.apache.xpath.internal.operations.Bool;
import org.assignment.po.CourseResource;
import org.assignment.service.CourseResourceService;
import org.assignment.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CourseResourceController {
    @Autowired
    CourseResourceService courseResourceService;
    @Autowired
    DateUtils dateUtils;

    @RequestMapping(value = "/addCourseResource.action",method = RequestMethod.POST)
    @ResponseBody
    public boolean addCourseResource(@RequestParam("file") MultipartFile multipartFile, @RequestParam("fileName") String fileName, HttpSession httpSession){
        CourseResource courseResource= new CourseResource();
        courseResource.setCourseResourceName(fileName);
        courseResource.setCourseID((Integer)httpSession.getAttribute("courseID"));
        courseResource.setDocumentType(fileName.substring(fileName.lastIndexOf(".")));
        return courseResourceService.addCourseResource(courseResource,multipartFile);
    }

    @RequestMapping(value = "/delCourseResource.action",method = RequestMethod.GET)
    @ResponseBody
    public boolean delCourseNotice(HttpServletRequest httpServletRequest){
        Integer courseResourceID = Integer.parseInt(httpServletRequest.getParameter("courseResourceID"));
        return courseResourceService.delCourseResource(courseResourceID);
    }

    @RequestMapping(value = "/getCourseResourceList.action",method = RequestMethod.GET)
    @ResponseBody
    public List<CourseResource> getCourseResourceList(HttpSession httpSession){
        System.out.println("请求课程资源！");
        Integer courseID = (Integer)httpSession.getAttribute("courseID");
        return courseResourceService.findCourseResource(courseID);
    }


    @RequestMapping(value = "/downloadCourseResource.action",method = RequestMethod.GET)
    public ResponseEntity<byte[]> downloadCourseResource(HttpServletRequest httpServletRequest){
        Integer courseResourceID = Integer.parseInt(httpServletRequest.getParameter("courseResourceID"));
        return courseResourceService.downloadCourseResource(courseResourceID);
    }


}
