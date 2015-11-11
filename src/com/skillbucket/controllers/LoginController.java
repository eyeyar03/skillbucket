package com.skillbucket.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skillbucket.model.User;
import com.skillbucket.service.UsersService;
import com.skillbucket.service.UsersServiceImpl;

@Controller
public class LoginController {
	
	private UsersService usersService;
	
	@Autowired
	private void setUsersService(UsersServiceImpl usersService) {
		this.usersService = usersService;
	}
	
	@RequestMapping( value = "/login", method = RequestMethod.GET )
	public String showLogin() {

		return "login";
	}

	@RequestMapping( value = "/logout", method = RequestMethod.GET )
	public String doLogout() {
		return "home";
	}

	@RequestMapping( value = "/signup", method = RequestMethod.GET )
	public String showCreateAccount(Model model) {

		model.addAttribute("user", new User());

		return "signup";
	}

	@RequestMapping( value = "/dosignup", method = RequestMethod.POST )
	public String doCreateAccount(@Valid @ModelAttribute("user") User user, BindingResult result, Model model ) {

		if (result.hasErrors()) {
			return "signup";
		}
		
		if (usersService.exists(user.getUsername())) {
			result.rejectValue("username", "DuplicateKey.user.username");
			return "signup";
		} 

		if (!usersService.add(user)) {
			model.addAttribute("errorMsg", "There was an error creating your account. Please try again.");
			return "signup";
		}
		
		return "accountcreated";
	}
	
}
