package com.skillbucket.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/addskill")
	public String addSkill(Model model) {
		
		model.addAttribute("skill", new Skill());
		model.addAttribute("levels", Constants.LEVELS);
		model.addAttribute("errorMsg", "");
		model.addAttribute("successMsg", "");
		
		return "addskill";
	}
	
	@RequestMapping( value = "/doaddskill", method = RequestMethod.POST )
	public ModelAndView doAddSkill(ModelAndView mv, HttpSession session, @Valid @ModelAttribute("skill") Skill skill, BindingResult result) {
		System.out.println(skill);
		
		mv = new ModelAndView("addskill");
		String errorMsg = "";
		String successMsg = "";
		
		if (result.hasErrors()) {
			System.out.println("Form does not validate.");
		} else {
			System.out.println("Form validated.");

			boolean added = skillService.add(skill, (String) session.getAttribute("username"));
			if (added) {
				successMsg = "Your skill has been added to your skill set.";
				mv.getModel().put("skill", new Skill());
			} else {
				errorMsg = "There was a problem adding your skill."; //maybe the skill was a duplicate. implement unique skill names
			}
		}
		
		mv.getModel().put("errorMsg", errorMsg);
		mv.getModel().put("successMsg", successMsg);
		mv.getModel().put("levels", Constants.LEVELS);
		
		return mv;
	}

	@RequestMapping(value="/skills", params="update", method=RequestMethod.POST)
	public ModelAndView updateSkill(ModelAndView mv, HttpSession session, @Valid @ModelAttribute("updateskill") Skill updateskill, BindingResult result) {
		updateskill.setUsername((String) session.getAttribute("username"));
		System.out.println(updateskill);
		
	    mv = new ModelAndView("skills");
	    
		String errorMsg = "";
		String errorUpdateMsg = "";
		String successMsg = "";
		
	    if (!result.hasErrors()) {
	    	System.out.println("Form validates");
	    	boolean updated = skillService.update(updateskill);
	    	if (updated) {
	    		successMsg = "Your skill has been updated.";
	    	} else {
	    		errorMsg = "There was a problem updating your skill.";
	    	}
	    } else {
	    	System.out.println("Form does not validate");
	    	errorUpdateMsg = "There was a problem updating your skill. Please check your skill details.";
			mv.getModel().put("updateAttempt", "true");
	    }
	    List<Skill> skills = skillService.getSkills((String) session.getAttribute("username"));

		mv.getModel().put("skills", skills);
		mv.getModel().put("updateskill", new Skill());
	    mv.getModel().put("errorMsg", errorMsg);
	    mv.getModel().put("errorUpdateMsg", errorUpdateMsg);
		mv.getModel().put("successMsg", successMsg);
		mv.getModel().put("levels", Constants.LEVELS);

		return mv;
	}

	@RequestMapping( value = "/skills", params="id" )
	public ModelAndView deleteSkill(ModelAndView mv, HttpSession session, @RequestParam int id) {
		System.out.println(id);
		
		mv = new ModelAndView("skills");
		
		Skill skill = new Skill();
		skill.setUsername((String) session.getAttribute("username"));
		skill.setId(id);
		
		boolean deleted = skillService.delete(skill);
		if (!deleted) {
			mv.getModel().put("errorMsg", "There was an error removing that skill.");
		} else {
			System.out.println("Skill deleted");
			mv.getModel().put("successMsg", "Your skill has been removed from your list.");
		}
		
		List<Skill> skills = skillService.getSkills((String) session.getAttribute("username"));

		mv.getModel().put("skills", skills);
		mv.getModel().put("updateskill", new Skill()); //pass a skill object to back the model attribute for update functionality
		mv.getModel().put("levels", Constants.LEVELS);
		
		return mv;
	}

	@RequestMapping(value="/skills")
	public String showSkills(Model model, HttpSession session) {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    String username = auth.getName(); //get logged in username
	    session.setAttribute("username", username);
	    System.out.println("Logged in username : " + username);
	    
		List<Skill> skills = skillService.getSkills(username);

		model.addAttribute("skills", skills);
		model.addAttribute("updateskill", new Skill()); //pass a skill object to back the model attribute for update functionality
		model.addAttribute("levels", Constants.LEVELS);
		
		return "skills";
	}

}
