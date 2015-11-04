package com.skillbucket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillbucket.dao.SkillDAO;
import com.skillbucket.dao.SkillDAOImpl;
import com.skillbucket.model.Skill;

@Service("skillService")
public class SkillServiceImpl implements SkillService{
	
	private SkillDAO skillDao;
	
	@Autowired
	public void setSkillDao(SkillDAOImpl skillDao) {
		this.skillDao = skillDao;
	}

	@Override
	public Skill getSkill(int id) {
		return skillDao.getSkill(id);
	}

	@Override
	public List<Skill> getSkills() {
		return skillDao.getSkills();
	}

}
