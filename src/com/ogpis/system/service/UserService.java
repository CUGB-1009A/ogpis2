package com.ogpis.system.service;

import java.util.List;

import com.ogpis.system.entity.User;

public interface UserService {
	
	public User save(User user);
	
	public User update(User user);
	
	public User findById(String id);
	
	public List<User> getAllUsers();

	public User findByUserName(String username);

}
