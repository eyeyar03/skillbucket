package com.skillbucket.service;

import java.util.List;

import com.skillbucket.model.User;

public interface UsersService {

	public boolean add(User user);

	public boolean exists(String username);

	public User getUser(String username);
	
	public List<User> getAllUsers();
	
}
