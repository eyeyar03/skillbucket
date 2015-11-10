package com.skillbucket.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skillbucket.model.User;

@Component("usersDao")
public class UsersDaoImpl implements UsersDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@Transactional
	@Override
	public boolean add(User user) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		jdbc.update("insert into users (username, password, email, first_name, last_name, enabled, title) values (:username, :password, :email, :firstName, :lastName, :enabled, :title)", params);
		
		return jdbc.update("insert into authorities (username, authority) values (:username, :authority)", params) == 1;
	}

	@Override
	public boolean exists(String username) {
		return jdbc.queryForObject("select count(*) from users where username = :username", new MapSqlParameterSource("username", username), Integer.class) > 0;
	}

}
