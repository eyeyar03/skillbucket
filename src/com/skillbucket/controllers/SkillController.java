package com.skillbucket.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skillbucket.model.Constants;
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

	@RequestMapping("/addskill")
	public String addSkill(Model model) {
		
		model.addAttribute("skill", new Skill());
		model.addAttribute("levels", Constants.levels);
		model.addAttribute("errorMsg", "");
		model.addAttribute("successMsg", "");
		
		return "addskill";
	}
	
	@RequestMapping(value="/doaddskill", method=RequestMethod.POST)
	public ModelAndView doAddSkill(ModelAndView mv, @Valid @ModelAttribute("skill") Skill skill, BindingResult result) {
		System.out.println(skill);
		
		mv = new ModelAndView("addskill");
		String errorMsg = "";
		String successMsg = "";
		
		if (result.hasErrors()) {
			System.out.println("Form does not validate.");
		} else {
			System.out.println("Form validated.");
			
			boolean added = skillService.addSkill(skill);
			if (added) {
				successMsg = "Your skill is added to your skill set.";
				mv.getModel().put("skill", new Skill());
			} else {
				errorMsg = "There was a problem adding your skill."; //maybe the skill was a duplicate. implement unique skill names
			}
		}
		
		mv.getModel().put("errorMsg", errorMsg);
		mv.getModel().put("successMsg", successMsg);
		mv.getModel().put("levels", Constants.levels);
		
		return mv;
	}


}
