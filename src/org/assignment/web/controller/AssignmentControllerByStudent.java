package org.assignment.web.controller;

import org.assignment.dao.AssignmentEntityDocDao;
import org.assignment.po.AssignmentEntity;
import org.assignment.po.AssignmentEntityDoc;
import org.assignment.po.AssignmentProject;
import org.assignment.po.AssignmentProjectDoc;
import org.assignment.service.AssignmentEntityService;
import org.assignment.service.AssignmentProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AssignmentControllerByStudent {
    @Autowired
    AssignmentProjectService assignmentProjectService;
    @Autowired
    AssignmentEntityService assignmentEntityService;

    @RequestMapping(value = "/getAssignmentProjectListStudent.action",method = RequestMethod.GET)
    @ResponseBody
    public List<AssignmentProject> getAssignmentProjectListStudent(HttpSession httpSession){
        Integer courseID = (Integer) httpSession.getAttribute("courseID");
        return  assignmentProjectService.findAssignmentProjectList(courseID);
    }

    @RequestMapping(value = "/getAssignmentProjectListDocStudent.action",method = RequestMethod.GET)
    @ResponseBody
    public List<AssignmentProjectDoc> getAssignmentProjectListDocStudent(HttpServletRequest httpServletRequest){
        Integer assignmentProjectID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID"));
        return assignmentProjectService.getAssignmentProjectListDoc(assignmentProjectID);
    }

    @RequestMapping(value = "/getAssignmentEntityDocStudent.action",method = RequestMethod.GET)
    @ResponseBody
    public AssignmentEntityDoc getAssignmentEntityDocStudent(HttpServletRequest httpServletRequest,HttpSession httpSession){
        String studentCode = (String)httpSession.getAttribute("userCode");
        Integer assignmentProjectID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID"));
        Integer assignmentProjectDocID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectDocID"));
        return assignmentEntityService.getAssignmentEntityDoc(assignmentProjectID,assignmentProjectDocID,studentCode);
    }

    @RequestMapping(value = "/downloadAssignmentEntityDocStudent.action",method = RequestMethod.GET)
    public ResponseEntity<byte[]> downloadAssignmentEntityDoc(HttpServletRequest httpServletRequest){
        Integer assignmentEntityDocID = Integer.parseInt(httpServletRequest.getParameter("assignmentEntityDocID"));
        return assignmentEntityService.downloadAssignmentEntityDoc(assignmentEntityDocID);
    }

    @RequestMapping(value = "/submitAssignmentProjectEntityDocStudent.action",method = RequestMethod.POST)
    @ResponseBody
    public Boolean submitAssignmentProjectEntity(@RequestParam("file") MultipartFile multipartFile, @RequestParam("assignmentEntityDocID") Integer assignmentEntityDocID){
       return assignmentEntityService.submitAssignmentProjectEntityDoc(assignmentEntityDocID,multipartFile);
    }

}
