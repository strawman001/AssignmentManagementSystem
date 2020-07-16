package org.assignment.service;

import org.assignment.po.Course;
import org.assignment.po.Student;

import java.util.List;

public interface CourseStudentService {
    public List<Student> findStudentByCourse(Integer courseID);
    public List<Course> findCourseByStudent(String studentCode);

}

