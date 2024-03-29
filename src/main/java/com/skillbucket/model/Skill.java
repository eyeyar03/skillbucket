package com.skillbucket.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Skill {

	private int id;
	
	@NotBlank
	@Size(min=1, max=100)
	private String name;
	
	@NotBlank
	private String level;
	
	@NotBlank
	private String category;
	
	@Min(value=1)
	private int priority;
	
	private String username;
	
	public Skill() {
	}

	public Skill(String name, String level, String category, int priority) {
		this.name = name;
		this.level = level;
		this.category = category;
		this.priority = priority;
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

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Skill [id=" + id + ", name=" + name + ", level=" + level + ", category=" + category + ", priority="
				+ priority + ", username=" + username + "]";
	}
	
}
