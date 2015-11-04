package com.skillbucket.dao;

import java.util.List;

import com.skillbucket.model.Skill;

public interface SkillDAO {
	
	public Skill getSkill(int id);
	
	public List<Skill> getSkills();
	
	
}
