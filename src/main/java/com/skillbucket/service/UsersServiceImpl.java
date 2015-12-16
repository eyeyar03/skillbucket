package com.skillbucket.service;

import java.util.List;
import java.util.zip.DataFormatException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.skillbucket.dao.UsersDao;
import com.skillbucket.dao.UsersDaoImpl;
import com.skillbucket.model.Constants;
import com.skillbucket.model.User;

@Service("usersService")
public class UsersServiceImpl implements UsersService {
	
	private UsersDao usersDao;
	
	@Autowired
	public void setUsersDao(UsersDaoImpl usersDao) {
		this.usersDao = usersDao;
	}

	@Override
	public boolean add(User user) {
		
		try {
			user.setAuthority(Constants.USER);
			user.setEnabled(true);
		
			usersDao.add(user);
		} catch (DataAccessException | DataFormatException e) {
			return false;
		}
		
		return true;
	}

	@Override
	public boolean exists(String username) {
		return usersDao.exists(username);
	}

	@Override
	public User getUser(String username) {
		return usersDao.getUser(username);
	}

	@Override
	public List<User> getAllUsers() {
		return usersDao.getAllUsers();
	}
	
}
