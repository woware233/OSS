package com.oss.dao;

import com.oss.domain.User;

import java.util.List;

public interface UserDao {
    User userlogin(User user);
    List<User> usermanager();
    int addUser(User user);
    int deleteUser(List<Integer> list);
    int shenheUser(User user);
}
