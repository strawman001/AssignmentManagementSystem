package org.assignment.po;

public class CourseResource {
    private Integer courseResourceID;
    private Integer courseID;
    private String courseResourceName;
    private String documentType;
    private String uploadTime;
    private String courseResourceSaveLocation;

    public Integer getCourseResourceID() {
        return courseResourceID;
    }

    public void setCourseResourceID(Integer courseResourceID) {
        this.courseResourceID = courseResourceID;
    }

    public Integer getCourseID() {
        return courseID;
    }

    public void setCourseID(Integer courseID) {
        this.courseID = courseID;
    }

    public String getCourseResourceName() {
        return courseResourceName;
    }

    public void setCourseResourceName(String courseResourceName) {
        this.courseResourceName = courseResourceName;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getSaveLocation() {
        return courseResourceSaveLocation;
    }

    public void setSaveLocation(String saveLocation) {
        this.courseResourceSaveLocation = saveLocation;
    }
}
