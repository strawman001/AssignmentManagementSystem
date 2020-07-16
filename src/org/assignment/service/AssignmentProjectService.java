package org.assignment.service;

import org.assignment.po.AssignmentProject;
import org.assignment.po.AssignmentProjectDoc;
import org.assignment.po.DocumentType;

import java.util.List;

public interface AssignmentProjectService {
    //
    public Boolean addAssignmentProject(AssignmentProject assignmentProject);
    public Boolean delAssignmentProject(Integer assignmentProjectID);
    public Boolean editAssignmentProject(AssignmentProject assignmentProject);
    public List<AssignmentProject> findAssignmentProjectList(Integer courseID);
    //
    public Boolean addAssignmentProjectDoc(AssignmentProjectDoc assignmentProjectDoc);
    public Boolean delAssignmentProjectDoc(Integer assignmentProjectDocID);
    public List<AssignmentProjectDoc> getAssignmentProjectListDoc(Integer assignmentProjectID);
    //


}
