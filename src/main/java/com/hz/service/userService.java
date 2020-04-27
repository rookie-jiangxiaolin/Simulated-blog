package com.hz.service;
import com.hz.bean.User;


public interface userService {
    //用户登录
    int login(User user);
    //创建新用户
    int create(User user);
    //查询用户信息
    User selectUserById(int id);
    //修改用户信息
    int updateUserById(User user);

    User quarryUserIdByName(User user);
}
