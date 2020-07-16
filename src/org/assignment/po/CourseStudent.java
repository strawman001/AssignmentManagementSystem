package org.assignment.po;

public class CourseStudent {
    private Integer courseStudentID;
    private Integer courseID;
    private String studentCode;
    private String courseMark;

    public Integer getCourseStudentID() {
        return courseStudentID;
    }

    public void setCourseStudentID(Integer courseStudentID) {
        this.courseStudentID = courseStudentID;
    }

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public String getStudentCode() {
        return studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    public String getCourseMark() {
        return courseMark;
    }

    public void setCourseMark(String courseMark) {
        this.courseMark = courseMark;
    }
}
