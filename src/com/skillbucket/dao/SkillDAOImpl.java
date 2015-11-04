package com.skillbucket.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.skillbucket.model.Skill;

@Component("skillDao")
public class SkillDAOImpl implements SkillDAO {
	
	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	@Override
	public Skill getSkill(int id) {
		
		MapSqlParameterSource params = new MapSqlParameterSource("id", id);
		
		Skill skill = (Skill) jdbc.queryForObject("select name, level, category from skill where id=:id", params, new RowMapper<Skill>() {

			@Override
			public Skill mapRow(ResultSet rs, int arg1) throws SQLException {
				Skill skill = new Skill();
				skill.setName(rs.getString("name"));
				skill.setLevel(rs.getString("level"));
				skill.setCategory(rs.getString("category"));
				
				return skill;
			}
			
		});
		
		return skill;
	}

	@Override
	public List<Skill> getSkills() {
		
		return jdbc.query("select * from skill", new RowMapper<Skill>() {

			@Override
			public Skill mapRow(ResultSet rs, int arg1) throws SQLException {
				Skill skill = new Skill();
				skill.setId(rs.getInt("id"));
				skill.setName(rs.getString("name"));
				skill.setLevel(rs.getString("level"));
				skill.setCategory(rs.getString("category"));
				skill.setPriority(rs.getInt("priority"));
				return skill;
			}
			
		});
		
	}

}
