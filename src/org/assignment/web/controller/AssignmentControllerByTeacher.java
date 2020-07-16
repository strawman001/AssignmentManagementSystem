package org.assignment.web.controller;

import org.assignment.po.AssignmentEntity;
import org.assignment.po.AssignmentEntityDoc;
import org.assignment.po.AssignmentProject;
import org.assignment.po.AssignmentProjectDoc;
import org.assignment.service.AssignmentEntityService;
import org.assignment.service.AssignmentProjectService;
import org.assignment.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AssignmentControllerByTeacher {
    @Autowired
    AssignmentEntityService assignmentEntityService;
    @Autowired
    AssignmentProjectService assignmentProjectService;



    //
    @RequestMapping(value = "/addAssignmentProject.action", method = RequestMethod.POST)
    @ResponseBody
    public boolean addAssignmentProject(@RequestBody AssignmentProject assignmentProject){
        return assignmentProjectService.addAssignmentProject(assignmentProject);
    }

    @RequestMapping(value = "/delAssignmentProject.action",method = RequestMethod.GET)
    @ResponseBody
    public boolean delAssignmentProject(HttpServletRequest httpServletRequest){
        Integer assignmentProjectID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID"));
        return assignmentProjectService.delAssignmentProject(assignmentProjectID);
    }

    @RequestMapping(value = "/modAssignmentProject.action",method = RequestMethod.POST)
    @ResponseBody
    public boolean modAssignmentProject(@RequestBody AssignmentProject assignmentProject){
        return assignmentProjectService.editAssignmentProject(assignmentProject);
    }

    @RequestMapping(value = "/getAssignmentProjectList.action",method = RequestMethod.GET)
    @ResponseBody
    public List<AssignmentProject> getAssignmentProjectList(HttpSession httpSession){
        Integer courseID = (Integer) httpSession.getAttribute("courseID");
        return  assignmentProjectService.findAssignmentProjectList(courseID);
    }

    //
    @RequestMapping(value = "/addAssignmentProjectDoc.action", method = RequestMethod.POST)
    @ResponseBody
    public boolean addAssignmentProjectDoc(@RequestBody AssignmentProjectDoc assignmentProjectDoc){
        return assignmentProjectService.addAssignmentProjectDoc(assignmentProjectDoc);
    }

    @RequestMapping(value = "/delAssignmentProjectDoc.action",method = RequestMethod.GET)
    @ResponseBody
    public boolean delAssignmentProjectDoc(HttpServletRequest httpServletRequest){
        Integer assignmentProjectDocID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectDocID"));
        return assignmentProjectService.delAssignmentProjectDoc(assignmentProjectDocID);
    }

    @RequestMapping(value = "/getAssignmentProjectListDoc.action",method = RequestMethod.GET)
    @ResponseBody
    public List<AssignmentProjectDoc> getAssignmentProjectListDoc(HttpServletRequest httpServletRequest){
        Integer assignmentProjectID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID"));
        return assignmentProjectService.getAssignmentProjectListDoc(assignmentProjectID);
    }


    @RequestMapping(value = "/getAssignmentEntityByStudent.action",method = RequestMethod.GET)
    @ResponseBody
    public AssignmentEntity getAssignmentEntityByStudent(HttpServletRequest httpServletRequest){
        String studentCode = httpServletRequest.getParameter("studentCode");
        Integer assignmentProjectID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID"));
        System.out.println("In controller ID:"+assignmentProjectID+", Code:"+studentCode);
        return assignmentEntityService.getAssignmentEntityByStudent(assignmentProjectID,studentCode);
    }

    @RequestMapping(value = "/getAssignmentEntityDocList.action",method = RequestMethod.GET)
    @ResponseBody
    public List<AssignmentEntityDoc> getAssignmentEntityDocList(HttpServletRequest httpServletRequest){
        Integer assignmentEntityID = Integer.parseInt(httpServletRequest.getParameter("assignmentEntityID"));
        return assignmentEntityService.getAssignmentEntityDocList(assignmentEntityID);
    }

    //有问题
    @RequestMapping(value = "/getPreView.action",method = RequestMethod.GET)
    @ResponseBody
    public String getPreView(HttpServletRequest httpServletRequest){
        Integer assignmentEntityDocID = Integer.parseInt(httpServletRequest.getParameter("assignmentEntityDocID"));
        return assignmentEntityService.getPreView(assignmentEntityDocID);
    }

    @RequestMapping(value = "/downloadAssignmentEntityDocAll.action",method = RequestMethod.GET)
    public ResponseEntity<byte[]> downloadAssignmentEntityDocAll(HttpServletRequest httpServletRequest){
        Integer assignmentProjectID = Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID"));
        return assignmentEntityService.downloadAssignmentEntityDocAll(assignmentProjectID);
    }

    @RequestMapping(value = "/downloadAssignmentEntityDoc.action",method = RequestMethod.GET)
    public ResponseEntity<byte[]> downloadAssignmentEntityDoc(HttpServletRequest httpServletRequest){
        Integer assignmentEntityDocID = Integer.parseInt(httpServletRequest.getParameter("assignmentEntityDocID"));
        return assignmentEntityService.downloadAssignmentEntityDoc(assignmentEntityDocID);
    }

    @RequestMapping(value = "/evalAssignmentEntity.action", method = RequestMethod.POST)
    @ResponseBody
    public boolean evalAssignmentEntity(@RequestBody AssignmentEntity assignmentEntity){
        return assignmentEntityService.evalAssignmentEntity(assignmentEntity);
    }

    @RequestMapping(value = "/getAssignmentEntityPage.action",method = RequestMethod.GET)
    public String getAssignmentEntityPage(HttpServletRequest httpServletRequest,HttpSession session){
        session.setAttribute("assignmentProjectID",Integer.parseInt(httpServletRequest.getParameter("assignmentProjectID")));
        return "/WEB-INF/jsp/Teacher/assignmentEntity.jsp";
    }

    @RequestMapping(value = "/canView.action",method = RequestMethod.GET)
    @ResponseBody
    public Boolean isCanView(HttpServletRequest httpServletRequest){
        String documentTypeName = httpServletRequest.getParameter("documentTypeName");
        return assignmentEntityService.canPreView(documentTypeName);
    }
}
