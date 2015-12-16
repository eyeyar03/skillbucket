package com.skillbucket.test.tests;

import java.util.List;
import java.util.zip.DataFormatException;

import javax.sql.DataSource;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.internal.runners.statements.Fail;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.skillbucket.dao.UsersDao;
import com.skillbucket.dao.UsersDaoImpl;
import com.skillbucket.model.Constants;
import com.skillbucket.model.User;

@ActiveProfiles("dev")
@ContextConfiguration(locations = { 
		"file:WebContent/WEB-INF/dao-context.xml",
		"classpath:com/skillbucket/test/config/datasource.xml" })
@RunWith(SpringJUnit4ClassRunner.class)
public class UsersDAOTest {
	
	private UsersDao usersDao;
	private static final String USERSTABLE = "users";
	private static final String AUTHTABLE = "authorities";
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	public void setUsersDao(UsersDaoImpl usersDao) {
		this.usersDao = usersDao;
	}
	
	@Before
	public void init() {
		JdbcTemplate jdbc = new JdbcTemplate(dataSource);
		
		jdbc.execute("delete from " + USERSTABLE);
		jdbc.execute("delete from " + AUTHTABLE);
	}

	@Test
	public void testCreateUser() {
		User user = new User("angelarosario", "password", "angelarosario@gmail.com", "Angela", "Rosario", "Software Engineer", Constants.USER, true);
		try {
			Assert.assertTrue("User creation should return true", usersDao.add(user));
		} catch (DataFormatException e) {
			Assert.fail();
		}
		
		Assert.assertTrue("User should exist", usersDao.exists(user.getUsername()));
		
		List<User> users = usersDao.getAllUsers();
		Assert.assertEquals("User count must be 1", 1,  users.size());
		
		User userFetched = usersDao.getUser(user.getUsername());
		Assert.assertNotNull("User must not be null" ,userFetched);
		Assert.assertEquals("User created must be identical to the user fetched", user, userFetched);
		
	}
	
	@Test(expected=DataFormatException.class)
	public void testInvalidUser() throws DataFormatException {
		User invalidUser = new User("", "password", "angela@gmail.com", "Angela", "Rosario", "Software Engineer", Constants.USER, true);
		Assert.assertFalse("Creation of invalid user should return false", usersDao.add(invalidUser));
	}
	
}
