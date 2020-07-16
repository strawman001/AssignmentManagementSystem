package org.assignment.po;

import java.util.List;

public class AssignmentEntity {
    private Integer assignmentEntityID;
    private Integer assignmentProjectID;
    private String studentCode;
    private Integer assignmentEntityScore;
    private String assignmentEntityComment;
    private String assignmentEntityTime;
    private Integer assignmentEntityState;//0未提交 1按时提交 2未按时提交
    //private List<AssignmentEntityDoc> assignmentEntityDocList;
    public static final int DOC_SUBMITED_DELAYTIME = 2;
    public static final int DOC_SUBMITED_ONTIME = 1;
    public static final int DOC_NO_SUBMITED = 0;

    public Integer getAssignmentEntityID() {
        return assignmentEntityID;
    }

    public void setAssignmentEntityID(Integer assignmentEntityID) {
        this.assignmentEntityID = assignmentEntityID;
    }

    public Integer getAssignmentProjectID() {
        return assignmentProjectID;
    }

    public void setAssignmentProjectID(Integer assignmentProjectID) {
        this.assignmentProjectID = assignmentProjectID;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public Integer getAssignmentEntityScore() {
        return assignmentEntityScore;
    }

    public void setAssignmentEntityScore(Integer assignmentEntityScore) {
        this.assignmentEntityScore = assignmentEntityScore;
    }

    public String getAssignmentEntityComment() {
        return assignmentEntityComment;
    }

    public void setAssignmentEntityComment(String assignmentEntityComment) {
        this.assignmentEntityComment = assignmentEntityComment;
    }

    public String getAssignmentEntityTime() {
        return assignmentEntityTime;
    }

    public void setAssignmentEntityTime(String assignmentEntityTime) {
        this.assignmentEntityTime = assignmentEntityTime;
    }

    public Integer getAssignmentEntityState() {
        return assignmentEntityState;
    }

    public void setAssignmentEntityState(Integer assignmentEntityState) {
        this.assignmentEntityState = assignmentEntityState;
    }


}
