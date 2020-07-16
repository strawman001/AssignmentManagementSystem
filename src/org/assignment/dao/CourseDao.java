package org.assignment.dao;

import org.assignment.po.Course;

import java.util.List;

public interface CourseDao {
    public Course findCourse(Integer courseID);
    public Integer updateCourse(Course course);
}
