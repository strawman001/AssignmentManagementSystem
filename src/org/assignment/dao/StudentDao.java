package org.assignment.dao;

import org.assignment.po.Student;

public interface StudentDao {
    public Student findStudent(String studentCode);
}
