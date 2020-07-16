package org.assignment.service;

import org.assignment.po.Course;
import org.assignment.po.Student;

import java.util.List;

public interface CourseService {
    public List<Course> findMyCourseList(Integer userID);
    public Course findCourse(Integer courseID);
    public Boolean editCourse(Course course);
}
