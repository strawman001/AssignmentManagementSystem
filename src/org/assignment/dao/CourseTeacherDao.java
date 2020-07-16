package org.assignment.dao;

import org.assignment.po.Course;

import java.util.List;

public interface CourseTeacherDao {
    public List<Integer> findCourseIDListByTeacher(String teacherCode);
}
