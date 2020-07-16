package org.assignment.service;

import org.assignment.po.Student;
import org.assignment.po.Teacher;
import org.assignment.po.User;

public interface UserService {
    public User findUser(String userName,String password);
    public Teacher findTeacher(Integer userID);
    public Student findStudent(Integer userID);
    public String findUserType(Integer userID);
}
