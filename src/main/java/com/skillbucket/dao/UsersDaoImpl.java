package com.skillbucket.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.zip.DataFormatException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
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
	public boolean add(User user) throws DataFormatException {
		
		if (user == null || user.getUsername().isEmpty() || user.getEmail() == null || user.getEmail().isEmpty()
				|| user.getPassword() == null || user.getPassword().isEmpty()) {
			throw new DataFormatException("Empty username, email or password.");
		}
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);
		
		jdbc.update("insert into users (username, password, email, first_name, last_name, enabled, title) values (:username, :password, :email, :firstName, :lastName, :enabled, :title)", params);
		
		return jdbc.update("insert into authorities (username, authority) values (:username, :authority)", params) == 1;
	}

	@Override
	public boolean exists(String username) {
		return jdbc.queryForObject("select count(*) from users where username = :username"
				, new MapSqlParameterSource("username", username), Integer.class) > 0;
	}

	@Override
	public User getUser(String username) {
		StringBuilder query = new StringBuilder( 
				"select a.username, a.email, a.first_name, a.last_name, a.enabled, a.title, b.authority" );
		query.append(" from users a join authorities b");
		query.append(" on a.username = b.username");
		query.append(" where a.username = :username");
		User result = jdbc.queryForObject(query.toString()
				, new MapSqlParameterSource("username", username.trim())
				, new RowMapper<User>() {
					@Override
					public User mapRow(ResultSet rs, int arg1) throws SQLException {
						if (rs == null || rs.wasNull()) {
							return null;
						}
						User user = new User();
						user.setUsername(rs.getString("username"));
						user.setEmail(rs.getString("email"));
						user.setFirstName(rs.getString("first_name"));
						user.setLastName(rs.getString("last_name"));
						user.setTitle(rs.getString("title"));
						user.setEnabled(rs.getBoolean("enabled"));
						user.setAuthority(rs.getString("authority"));
						
						return user;
					}
		});
		return result;
	}

	@Override
	public List<User> getAllUsers() {
		StringBuilder query = new StringBuilder( 
				"select a.username, a.email, a.first_name, a.last_name, a.enabled, a.title, b.authority" );
		query.append(" from users a join authorities b");
		query.append(" on a.username = b.username");
		
		List<User> users = jdbc.query(query.toString(), new RowMapper<User>() {
					@Override
					public User mapRow(ResultSet rs, int arg1) throws SQLException {
						if (rs == null || rs.wasNull()) {
							return null;
						}
						User user = new User();
						user.setUsername(rs.getString("username"));
						user.setEmail(rs.getString("email"));
						user.setFirstName(rs.getString("first_name"));
						user.setLastName(rs.getString("last_name"));
						user.setTitle(rs.getString("title"));
						user.setEnabled(rs.getBoolean("enabled"));
						user.setAuthority(rs.getString("authority"));
						
						return user;
					}
		});
		return users;
	}

}
