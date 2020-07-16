package org.assignment.service.impl;

import org.assignment.dao.*;
import org.assignment.po.AssignmentEntity;
import org.assignment.po.AssignmentEntityDoc;
import org.assignment.po.AssignmentProject;
import org.assignment.po.AssignmentProjectDoc;
import org.assignment.service.AssignmentProjectService;
import org.assignment.utils.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("assignmentProjectService")
public class AssignmentProjectServiceImpl implements AssignmentProjectService {
    @Autowired
    AssignmentProjectDocDao assignmentProjectDocDao;
    @Autowired
    AssignmentProjectDao assignmentProjectDao;
    @Autowired
    CourseStudentDao courseStudentDao;
    @Autowired
    AssignmentEntityDao assignmentEntityDao;
    @Autowired
    AssignmentEntityDocDao assignmentEntityDocDao;
    @Autowired
    PathUtil pathUtil;


    @Override
    public Boolean addAssignmentProject(AssignmentProject assignmentProject) {
        int nums=0;
        if (assignmentProjectDao.countAssignmentProjectNums()==null)
            nums=0;
        else
            nums=assignmentProjectDao.countAssignmentProjectNums();
        assignmentProject.setAssignmentProjectID(nums+1);
        int rows = assignmentProjectDao.addAssignmentProject(assignmentProject);
        Integer courseID = assignmentProject.getCourseID();
        Integer assignmentProjectID = nums+1;
        boolean addProjectBool = rows>0?true:false;
        if (!addProjectBool)
            return false;

        List<String> studentCodeList = courseStudentDao.findStudentCodeListByCourse(courseID);
        for (String code : studentCodeList){
            AssignmentEntity assignmentEntity = new AssignmentEntity();
            assignmentEntity.setStudentCode(code);
            assignmentEntity.setAssignmentProjectID(assignmentProjectID);
            assignmentEntity.setAssignmentEntityState(0);
            int rows2 = assignmentEntityDao.addAssignmentEntity(assignmentEntity);
            boolean addEntityBool = rows2>0?true:false;
            System.out.println(addEntityBool);
            pathUtil.createAssignmentEntityPath(courseID,assignmentProjectID,code);
        }
        return true;

    }

    @Override
    public Boolean delAssignmentProject(Integer assignmentProjectID) {
        AssignmentProject assignmentProject = assignmentProjectDao.getAssignmentProject(assignmentProjectID);
        int rows = assignmentProjectDao.delAssignmentProject(assignmentProjectID);
        boolean delProjectBool = rows>0?true:false;
        if (delProjectBool){
            pathUtil.deleteFile(pathUtil.getAssignmentEntityPath(assignmentProject.getCourseID(),assignmentProjectID));
            assignmentEntityDao.delAssignmentEntity(assignmentProjectID);
            for (AssignmentProjectDoc assignmentProjectDoc : assignmentProjectDocDao.getAssignmentProjectListDoc(assignmentProjectID))
                delAssignmentProjectDoc(assignmentProjectDoc.getAssignmentProjectDocID());
            return true;
        }else {
            return false;
        }

    }

    @Override
    public Boolean editAssignmentProject(AssignmentProject assignmentProject) {
        int rows = assignmentProjectDao.updateAssignmentProject(assignmentProject);
        if (rows>0)
            return true;
        else
            return false;
    }

    @Override
    public List<AssignmentProject> findAssignmentProjectList(Integer courseID) {
        return assignmentProjectDao.getAssignmentProjectList(courseID);
    }

    @Override
    public Boolean addAssignmentProjectDoc(AssignmentProjectDoc assignmentProjectDoc) {
        int nums=0;
        if (assignmentProjectDocDao.countAssignmentProjectDocNums()==null)
            nums=0;
        else
            nums=assignmentProjectDocDao.countAssignmentProjectDocNums();
        assignmentProjectDoc.setAssignmentProjectDocID(nums+1);
        int rows = assignmentProjectDocDao.addAssignmentProjectDoc(assignmentProjectDoc);
        boolean addProjectBool = rows>0?true:false;
        if (!addProjectBool)
            return false;
        AssignmentProject assignmentProject = assignmentProjectDao.getAssignmentProject(assignmentProjectDoc.getAssignmentProjectID());
        int courseID = assignmentProject.getCourseID();
        int assignmentProjectID = assignmentProject.getAssignmentProjectID();
        String assignmentProjectDocName = assignmentProjectDoc.getAssignmentProjectDocName();
        String documentType = assignmentProjectDoc.getDocumentType();
        List<String> studentCodeList = courseStudentDao.findStudentCodeListByCourse(courseID);
        for (String code : studentCodeList){
            AssignmentEntity assignmentEntity = assignmentEntityDao.getAssignmentEntityByStudent(assignmentProjectID,code);
            AssignmentEntityDoc assignmentEntityDoc = new AssignmentEntityDoc();
            assignmentEntityDoc.setAssignmentProjectDocID(nums+1);
            assignmentEntityDoc.setAssignmentEntityDocState(0);
            assignmentEntityDoc.setAssignmentEntityID(assignmentEntity.getAssignmentEntityID());
            assignmentEntityDoc.setAssignmentEntityDocSaveLocation(pathUtil.getAssignmentEntityDocFile(courseID,assignmentProjectID,code,assignmentProjectDocName).getPath());
            assignmentEntityDoc.setDocumentType(documentType);
            assignmentEntityDoc.setHavePreView(false);
            assignmentEntityDocDao.addAssignmentEntityDoc(assignmentEntityDoc);
        }

        return true;
    }

    @Override
    public Boolean delAssignmentProjectDoc(Integer assignmentProjectDocID) {
        AssignmentProjectDoc assignmentProjectDoc = assignmentProjectDocDao.getAssignmentProjectDoc(assignmentProjectDocID);
        AssignmentProject assignmentProject = assignmentProjectDao.getAssignmentProject(assignmentProjectDoc.getAssignmentProjectID());
        int rows = assignmentProjectDocDao.delAssignmentProjectDoc(assignmentProjectDocID);
        boolean delProjectBool = rows>0?true:false;
        if (delProjectBool){
            List<String> studentCodeList = courseStudentDao.findStudentCodeListByCourse(assignmentProject.getCourseID());
            Integer courseID = assignmentProject.getCourseID();
            Integer assignmentProjectID = assignmentProject.getAssignmentProjectID();
            String assignmentProjectDocName = assignmentProjectDoc.getAssignmentProjectDocName();
            int rows2 = assignmentEntityDocDao.delAssignmentEntityDoc(assignmentProjectDoc.getAssignmentProjectDocID());
            boolean delProjectBool2 = rows2>0?true:false;
            if (!delProjectBool2)
                return false;
            for (String code : studentCodeList){
               pathUtil.deleteFile(pathUtil.getAssignmentEntityDocFile
                       (courseID,assignmentProjectID, code,assignmentProjectDocName));
            }
            return true;
        }else {
            return false;
        }
    }


    @Override
    public List<AssignmentProjectDoc> getAssignmentProjectListDoc(Integer assignmentProjectID) {
        return assignmentProjectDocDao.getAssignmentProjectListDoc(assignmentProjectID);
    }



}
