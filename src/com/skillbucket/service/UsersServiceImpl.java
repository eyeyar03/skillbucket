package com.skillbucket.service;

import org.springframework.beans.factory.annotation.Autowired;
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
		
		user.setAuthority(Constants.USER);
		user.setEnabled(true);
		
		return usersDao.add(user);
	}
	
}
