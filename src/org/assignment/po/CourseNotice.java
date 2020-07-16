package org.assignment.po;

public class CourseNotice {
    private Integer courseNoticeID;
    private Integer courseID;
    private String courseNoticeTitle;
    private String courseNoticeTime;
    private String courseNoticeContent;

    public CourseNotice(){}

    public Integer getCourseNoticeID() {
        return courseNoticeID;
    }

    public void setCourseNoticeID(Integer courseNoticeID) {
        this.courseNoticeID = courseNoticeID;
    }

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public String getCourseNoticeTitle() {
        return courseNoticeTitle;
    }

    public void setCourseNoticeTitle(String courseNoticeTitle) {
        this.courseNoticeTitle = courseNoticeTitle;
    }

    public String getCourseNoticeTime() {
        return courseNoticeTime;
    }

    public void setCourseNoticeTime(String courseNoticeTime) {
        this.courseNoticeTime = courseNoticeTime;
    }

    public String getCourseNoticeContent() {
        return courseNoticeContent;
    }

    public void setCourseNoticeContent(String courseNoticeContent) {
        this.courseNoticeContent = courseNoticeContent;
    }

    @Override
    public String toString() {
        return "Title:"+courseNoticeTitle+", Content:"+courseNoticeContent;
    }
}
