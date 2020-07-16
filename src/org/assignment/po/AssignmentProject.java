package org.assignment.po;


public class AssignmentProject {
    private Integer assignmentProjectID;
    private Integer courseID;
    private String assignmentProjectName;
    private String assignmentProjectInfo;
    private Integer assignmentProjectProportion;
    private String assignmentProjectDeadLine;

    public Integer getAssignmentProjectID() {
        return assignmentProjectID;
    }

    public void setAssignmentProjectID(Integer assignmentProjectID) {
        this.assignmentProjectID = assignmentProjectID;
    }

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public String getAssignmentProjectName() {
        return assignmentProjectName;
    }

    public void setAssignmentProjectName(String assignmentProjectName) {
        this.assignmentProjectName = assignmentProjectName;
    }

    public String getAssignmentProjectInfo() {
        return assignmentProjectInfo;
    }

    public void setAssignmentProjectInfo(String assignmentProjectInfo) {
        this.assignmentProjectInfo = assignmentProjectInfo;
    }

    public Integer getAssignmentProjectProportion() {
        return assignmentProjectProportion;
    }

    public void setAssignmentProjectProportion(Integer assignmentProjectProportion) {
        this.assignmentProjectProportion = assignmentProjectProportion;
    }

    public String getAssignmentProjectDeadLine() {
        return assignmentProjectDeadLine;
    }

    public void setAssignmentProjectDeadLine(String assignmentProjectDeadLine) {
        this.assignmentProjectDeadLine = assignmentProjectDeadLine;
    }
}
