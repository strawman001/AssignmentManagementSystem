package org.assignment.po;

public class Course {
    private Integer courseID;
    private String courseTypeCode;
    private String courseLocation;
    private String courseTime;
    private String courseBeginTime;//年月日
    private String courseIntro;
    private String courseRequirement;
    private String courseScoreFormula;
    private String courseName;
    private String coursePicLocation;

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public String getCourseTypeCode() {
        return courseTypeCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseTypeCode = courseCode;
    }

    public String getCourseLocation() {
        return courseLocation;
    }

    public void setCourseLocation(String courseLocation) {
        this.courseLocation = courseLocation;
    }

    public String getCourseTime() {
        return courseTime;
    }

    public void setCourseTime(String courseTime) {
        this.courseTime = courseTime;
    }

    public String getCourseBeginTime() {
        return courseBeginTime;
    }

    public void setCourseBeginTime(String courseBeginTime) {
        this.courseBeginTime = courseBeginTime;
    }

    public String getCourseIntro() {
        return courseIntro;
    }

    public void setCourseIntro(String courseIntro) {
        this.courseIntro = courseIntro;
    }

    public String getCourseRequirement() {
        return courseRequirement;
    }

    public void setCourseRequirement(String courseRequirement) {
        this.courseRequirement = courseRequirement;
    }

    public String getCourseScoreFormula() {
        return courseScoreFormula;
    }

    public void setCourseScoreFormula(String courseScoreFormula) {
        this.courseScoreFormula = courseScoreFormula;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCoursePicLocation() {
        return coursePicLocation;
    }

    public void setCoursePicLocation(String coursePicLocation) {
        this.coursePicLocation = coursePicLocation;
    }

    @Override
    public String toString() {
        return "CourseName:"+courseName+", CourseTypeCode:"+courseTypeCode+", CoursePicLocation:"+coursePicLocation;
    }
}
