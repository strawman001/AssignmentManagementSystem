package org.assignment.dao;

import org.assignment.po.Course;
import org.assignment.po.Student;

import java.util.List;

public interface CourseStudentDao {
    public List<String>  findStudentCodeListByCourse(Integer courseID);
    public List<Integer>  findCourseIDListByStudent(String studentCode);
}
