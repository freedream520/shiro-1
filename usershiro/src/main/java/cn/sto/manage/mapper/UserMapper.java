package cn.sto.manage.mapper;

import cn.sto.manage.pojo.User;

public interface UserMapper {

	public User queryUserByUsername(String username);
}
