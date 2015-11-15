package com.skillbucket.service;

import java.util.List;

import com.skillbucket.model.Skill;

public interface SkillService {

	public List<Skill> getSkills(String username);

	public boolean add(Skill skill, String username);
	
}
