package com.skillbucket.dao;

import java.util.List;
import java.util.zip.DataFormatException;

import com.skillbucket.model.User;

public interface UsersDao {
	
	public boolean add(User user) throws DataFormatException;

	public boolean exists(String username);

	public User getUser(String username);
	
	public List<User> getAllUsers();

}
