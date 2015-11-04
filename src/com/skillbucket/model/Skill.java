package com.skillbucket.model;

public class Skill {

	private int id;
	private String name;
	private String level;
	private String category;
	private int priority;
	
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

	@Override
	public String toString() {
		return "Skill [id=" + id + ", name=" + name + ", level=" + level + ", category=" + category + ", priority="
				+ priority + "]";
	}
	
}
