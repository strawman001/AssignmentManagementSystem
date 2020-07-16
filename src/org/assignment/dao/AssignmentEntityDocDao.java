package org.assignment.dao;

import org.apache.ibatis.annotations.Param;
import org.assignment.po.AssignmentEntityDoc;

import java.util.List;

public interface AssignmentEntityDocDao {
    public List<AssignmentEntityDoc> getAssignmentEntityDocInBufferForAll();
    public List<AssignmentEntityDoc> getAssignmentEntityDocList(Integer assignmentEntityID);
    public Integer updateAssignmentEntityDoc(AssignmentEntityDoc assignmentEntityDoc);
    public Integer addAssignmentEntityDoc(AssignmentEntityDoc assignmentEntityDoc);
    public Integer delAssignmentEntityDoc(Integer assignmentProjectDocID);
    public AssignmentEntityDoc getAssignmentEntityDocByProjectDoc(@Param("assignmentEntityID")Integer assignmentEntityID, @Param("assignmentProjectDocID")Integer assignmentProjectDocID);
    public AssignmentEntityDoc getAssignmentEntityDoc(Integer assignmentEntityDocID);
}
