package org.assignment.dao;

import org.assignment.po.AssignmentProject;

import java.util.List;

public interface AssignmentProjectDao {
    public Integer addAssignmentProject(AssignmentProject assignmentProject);
    public Integer delAssignmentProject(Integer assignmentProjectID);
    public Integer updateAssignmentProject(AssignmentProject assignmentProject);
    public List<AssignmentProject> getAssignmentProjectList(Integer courseID);
    public AssignmentProject getAssignmentProject(Integer assignmentProjectID);
    public Integer countAssignmentProjectNums();
}
