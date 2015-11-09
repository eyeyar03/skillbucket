package com.skillbucket.model;

import org.springframework.stereotype.Component;

@Component
public class User {

	private String username;
	private String password;
	private boolean enabled = false;
	private String authority;
	private String title;

	public User() {

	}

	public User(String username, String password, boolean enabled, String authority, String title) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.authority = authority;
		this.title = title;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", enabled=" + enabled + ", authority="
				+ authority + ", title=" + title + "]";
	}

}
