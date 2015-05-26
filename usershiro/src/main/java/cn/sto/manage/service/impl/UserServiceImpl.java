package cn.sto.manage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.sto.manage.mapper.UserMapper;
import cn.sto.manage.pojo.User;
import cn.sto.manage.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User queryUserByUsername(String username) {

		return this.userMapper.queryUserByUsername(username);
	}

}
