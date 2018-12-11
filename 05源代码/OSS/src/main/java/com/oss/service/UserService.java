package com.oss.service;

import com.oss.dao.UserDao;
import com.oss.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserDao userDao;

    public User userlogin(User user){
        return userDao.userlogin(user);
    };
    public List<User> usermanager(){
        return userDao.usermanager();
    };
    public int addUser(User user) {
        return userDao.addUser(user);
    }
    public int deleteUser(List<Integer> list){return userDao.deleteUser(list);}
    public int shenheUser(User user){ return userDao.shenheUser(user);}
}
