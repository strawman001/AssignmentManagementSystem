package org.assignment.service;

import org.assignment.po.CourseResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CourseResourceService {
    public Boolean addCourseResource(CourseResource courseResource,MultipartFile multipartFile);
    public Boolean submitCourseResource(Integer courseID,MultipartFile multipartFile,String fileName);
    public Boolean delCourseResource(Integer courseResourceID);
    public List<CourseResource> findCourseResource(Integer courseID);
    public ResponseEntity<byte[]> downloadCourseResource(Integer courseResourceID);
}
