package com.skillbucket.dao;

import java.util.List;

import com.skillbucket.model.Skill;

public interface SkillDao {
		
	public List<Skill> getSkills(String username);

	public int add(Skill skill);

	public boolean update(Skill skill);

	public boolean delete(Skill skill);
	
	
}
