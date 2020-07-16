package org.assignment.dao;

import org.assignment.po.CourseResource;

import java.util.List;

public interface CourseResourceDao {
    public Integer addCourseResource(CourseResource courseResource);
    public Integer delCourseResource(Integer courseResourceID);
    public List<CourseResource> findCourseResourceList(Integer courseID);
    public CourseResource findCourseResource(Integer courseResourceID);
}
