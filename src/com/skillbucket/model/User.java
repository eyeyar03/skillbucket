package com.skillbucket.model;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class User {

	private int id;
	private String name;
	private String email;
	private String password;
	private String title;
	private List<Skill> skillSet;

	public User() {

	}

	public User(String name, String email, String password, String title) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.title = title;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Skill> getSkillSet() {
		return skillSet;
	}

	public void setSkillSet(List<Skill> skillSet) {
		this.skillSet = skillSet;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", title=" + title
				+ "]";
	}
	
}
