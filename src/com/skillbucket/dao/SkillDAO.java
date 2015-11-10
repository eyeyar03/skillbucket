package com.skillbucket.dao;

import java.util.List;

import com.skillbucket.model.Skill;

public interface SkillDao {
	
	public Skill getSkill(int id);
	
	public List<Skill> getSkills();

	public int add(Skill skill);
	
	
}
