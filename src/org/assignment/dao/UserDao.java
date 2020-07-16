package org.assignment.dao;

import org.apache.ibatis.annotations.Param;
import org.assignment.po.User;

public interface UserDao {
    public User findUser(@Param("userName") String userName, @Param("password") String password);
    public User findUserByID(Integer userID);
}
