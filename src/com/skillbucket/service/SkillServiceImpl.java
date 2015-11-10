package com.skillbucket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillbucket.dao.SkillDao;
import com.skillbucket.dao.SkillDaoImpl;
import com.skillbucket.model.Skill;

@Service("skillService")
public class SkillServiceImpl implements SkillService{
	
	private SkillDao skillDao;
	
	@Autowired
	public void setSkillDao(SkillDaoImpl skillDao) {
		this.skillDao = skillDao;
	}

	@Override
	public List<Skill> getSkills(String username) {
		return skillDao.getSkills(username);
	}

	@Override
	public boolean add(Skill skill, String username) {
		skill.setUsername(username);
		int added = skillDao.add(skill);
		return added == 1;
	}

}
