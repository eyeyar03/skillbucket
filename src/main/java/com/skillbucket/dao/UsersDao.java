package com.skillbucket.dao;

import com.skillbucket.model.User;

public interface UsersDao {
	
	public boolean add(User user);

	public boolean exists(String username);

	public User getUser(String username);

}
