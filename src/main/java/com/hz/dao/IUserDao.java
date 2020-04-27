package com.hz.dao;

import com.hz.bean.User;
import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface IUserDao {

    int  login(User user);

    int register(User user);

    User quarryUserIdByName(User user);

    User selectUserById(int id);

    int updateUserById(User user);
}
