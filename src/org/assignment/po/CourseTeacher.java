package org.assignment.po;

public class CourseTeacher {
    private Integer courseTeacherID;
    private Integer courseID;
    private String teacherCode;
    private String courseEvaluation;

    public Integer getCourseTeacherID() {
        return courseTeacherID;
    }

    public void setCourseTeacherID(Integer courseTeacherID) {
        this.courseTeacherID = courseTeacherID;
    }

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public String getTeacherCode() {
        return teacherCode;
    }

    public void setTeacherCode(String teacherCode) {
        this.teacherCode = teacherCode;
    }

    public String getCourseEvaluation() {
        return courseEvaluation;
    }

    public void setCourseEvaluation(String courseEvaluation) {
        this.courseEvaluation = courseEvaluation;
    }
}
