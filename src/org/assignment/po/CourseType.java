package org.assignment.po;

public class CourseType {
    private Integer courseTypeID;
    private String courseTypeCode;
    private String courseName;
    private String coursePeriod;//春/秋
    private String majorCode;
    private String courseType;//必修、选修
    private String courseInfo;
    private String coursePicLocation;

    public Integer getCourseTypeID() {
        return courseTypeID;
    }

    public void setCourseTypeID(Integer courseTypeID) {
        this.courseTypeID = courseTypeID;
    }

    public String getCourseCode() {
        return courseTypeCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseTypeCode = courseCode;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCoursePeriod() {
        return coursePeriod;
    }

    public void setCoursePeriod(String coursePeriod) {
        this.coursePeriod = coursePeriod;
    }

    public String getMajorCode() {
        return majorCode;
    }

    public void setMajorCode(String majorCode) {
        this.majorCode = majorCode;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    public String getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(String courseInfo) {
        this.courseInfo = courseInfo;
    }

    public String getCoursePicLocation() {
        return coursePicLocation;
    }

    public void setCoursePicLocation(String coursePicLocation) {
        this.coursePicLocation = coursePicLocation;
    }
}
