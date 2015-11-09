package com.skillbucket.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skillbucket.model.User;

@Controller
public class LoginController {

	@RequestMapping( value = "/login", method = RequestMethod.GET )
	public String showLogin() {

		return "login";
	}

	@RequestMapping( value = "/signup", method = RequestMethod.GET )
	public String showCreateAccount(Model model) {

		model.addAttribute("user", new User());

		return "signup";
	}

	@RequestMapping( value = "/dosignup", method = RequestMethod.POST )
	public String doCreateAccount() {

		return "accountcreated";
	}

}
