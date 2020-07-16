package org.assignment.dao;

import org.apache.ibatis.annotations.Param;
import org.assignment.po.AssignmentEntity;

import java.util.List;

public interface AssignmentEntityDao {
    public List<AssignmentEntity> getAssignmentEntityList(Integer assignmentProjectID);
    public AssignmentEntity getAssignmentEntity(Integer assignmentEntityID);
    public AssignmentEntity getAssignmentEntityByStudent(@Param("assignmentProjectID") Integer assignmentProjectID, @Param("studentCode") String studentCode);
    public Integer updateAssignmentEntity(AssignmentEntity assignmentEntity);
    public Integer addAssignmentEntity(AssignmentEntity assignmentEntity);
    public Integer delAssignmentEntity(Integer assignmentProjectID);

}
