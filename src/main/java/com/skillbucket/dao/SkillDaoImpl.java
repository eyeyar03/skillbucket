package com.skillbucket.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.skillbucket.model.Skill;

@Component("skillDao")
public class SkillDaoImpl implements SkillDao {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@Override
	public List<Skill> getSkills(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource("username", username);
		
		return jdbc.query("select * from skill where username = :username order by priority", params, new RowMapper<Skill>() {

			@Override
			public Skill mapRow(ResultSet rs, int arg1) throws SQLException {
				Skill skill = new Skill();
				skill.setId(rs.getInt("id"));
				skill.setName(rs.getString("name"));
				skill.setLevel(rs.getString("level"));
				skill.setCategory(rs.getString("category"));
				skill.setPriority(rs.getInt("priority"));
				skill.setUsername(rs.getString("username"));
				return skill;
			}
		});
	}

	@Override
	public int add(Skill skill) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(skill);
		
		return jdbc.update("insert into skill (name, level, category, priority, username) values (:name, :level, :category, :priority, :username)", params);
	}

	@Override
	public boolean update(Skill skill) {
		
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(skill);
		
		return jdbc.update("update skill set name = :name, level = :level, category = :category, priority = :priority where id = :id", params) > 0;
	}

	@Override
	public boolean delete(Skill skill) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", skill.getUsername());
		params.addValue("id", skill.getId());
		
		return jdbc.update("delete from skill where id = :id and username = :username", params) > 0;
	}

}
