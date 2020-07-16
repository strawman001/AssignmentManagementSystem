package org.assignment.service;

import org.assignment.po.Course;

import java.util.List;

public interface CourseTeacherService {
    public List<Course> findCourseByTeacher(String teacherCode);
}
