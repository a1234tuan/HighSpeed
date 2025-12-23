package com.hqyj.service;
import com.hqyj.pojo.User;
public interface UserService {
	//根据用户名查询User对象
	public User getUserByName(String username);
	public String login(User user);
	
}
