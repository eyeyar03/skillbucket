package com.skillbucket.service;

import java.util.List;

import com.skillbucket.model.Skill;

public interface SkillService {

	public Skill getSkill(int id);
	
	public List<Skill> getSkills();

	public boolean addSkill(Skill skill);
	
}
