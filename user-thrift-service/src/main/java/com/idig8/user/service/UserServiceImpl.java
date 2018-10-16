package com.idig8.user.service;

import com.idig8.thrift.user.UserInfo;
import com.idig8.thrift.user.UserService;
import com.idig8.user.mapper.UserMapper;
import org.apache.thrift.TException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService.Iface {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserInfo getUserById(int id) throws TException {
        return userMapper.getUserById(id);
    }

    @Override
    public UserInfo getUserByName(String username) throws TException {
        return userMapper.getUserByName(username);
    }

    @Override
    public void regiserUser(UserInfo userInfo) throws TException {
        userMapper.registerUser(userInfo);
    }

    @Override
    public UserInfo getTeacherById(int id) throws TException {
        return userMapper.getTeacherById(id);
    }
}
