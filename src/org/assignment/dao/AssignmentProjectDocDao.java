package org.assignment.dao;

import org.assignment.po.AssignmentProjectDoc;

import java.util.List;

public interface AssignmentProjectDocDao {
    public Integer addAssignmentProjectDoc(AssignmentProjectDoc assignmentProjectDoc);
    public Integer delAssignmentProjectDoc(Integer assignmentProjectDocID);
    public List<AssignmentProjectDoc> getAssignmentProjectListDoc(Integer assignmentProjectID);
    public AssignmentProjectDoc getAssignmentProjectDoc(Integer assignmentProjectDocID);
    public Integer countAssignmentProjectDocNums();
}
