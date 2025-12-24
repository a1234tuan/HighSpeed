package com.hqyj.service;

import com.hqyj.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hqyj.dao.UserDao;

@Service
@Transactional//service层每个方法添加事务
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public String login(User user) {
        //根据用户名得到User，如果user返回null，用户名不存在；如果不为空，判断输入密码和数据库是否一致
        String result = "密码错误";
        User userDB = userDao.getUserByName(user.getName());
        if(userDB==null){
            result = "用户名不存在";
        }else if(user.getPwd().equals(userDB.getPwd())){
            result = "登录成功";
        }
        return result;
    }
    @Override
    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }
}