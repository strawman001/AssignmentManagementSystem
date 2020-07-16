package org.assignment.service.impl;

import org.assignment.dao.StudentDao;
import org.assignment.dao.TeacherDao;
import org.assignment.dao.UserDao;
import org.assignment.po.Student;
import org.assignment.po.Teacher;
import org.assignment.po.User;
import org.assignment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private StudentDao studentDao;

    @Override
    public User findUser(String userName, String password) {
        User user = userDao.findUser(userName,password);
        return user;
    }

    @Override
    public Teacher findTeacher(Integer userID) {
        User user = userDao.findUserByID(userID);
        Teacher teacher = teacherDao.findTeacher(user.getUserCode());
        return teacher;

    }

    @Override
    public Student findStudent(Integer userID) {
        User user = userDao.findUserByID(userID);
        Student student = studentDao.findStudent(user.getUserCode());
        return student;
    }

    @Override
    public String findUserType(Integer userID) {
        User user = userDao.findUserByID(userID);
        return user.getUserType();

    }
}
