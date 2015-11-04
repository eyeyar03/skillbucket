package com.skillbucket.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skillbucket.model.Skill;
import com.skillbucket.service.SkillService;
import com.skillbucket.service.SkillServiceImpl;

@Controller
public class SkillController {
	
	private SkillService skillService;
	
	@Autowired
	public void setSkillService(SkillServiceImpl skillService) {
		this.skillService = skillService;
	}

	@RequestMapping("/skills")
	public String showSkills(Model model) {
		
		List<Skill> skills = skillService.getSkills();

		model.addAttribute("skills", skills);
		
		return "skills";
	}

	@RequestMapping("/createskill")
	public String createSkill() {
				
		return "createskill";
	}

}
