package com.hz.service.impl;

import com.hz.bean.User;
import com.hz.dao.IUserDao;
import com.hz.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class userServiceImpl implements userService {
    @Autowired
    private IUserDao iUserDao;

    @Override
    public int login(User user) {

        if (iUserDao.login(user)>0){
            return 1;
        }else{
            return 0;
        }

    }

    @Override
    public int create(User user) {
        return iUserDao.register(user);
    }

    @Override
    public User selectUserById(int id) {
        return iUserDao.selectUserById(id);
    }

    @Override
    public int updateUserById(User user) {
        if (iUserDao.updateUserById(user)>0){
        return 1;
        }
        else {
            return 0;
        }
    }

    @Override
    public User quarryUserIdByName(User user) {
        return iUserDao.quarryUserIdByName(user);
    }
}
