package com.javaclimb.houserent.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.javaclimb.houserent.entity.User;
import com.javaclimb.houserent.mapper.UserMapper;
import com.javaclimb.houserent.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * 用户服务接口实现
 * */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /*
     * mapper对象
     * */
    @Override
    public BaseMapper<User> getRepository() {
        return userMapper;
    }
}
