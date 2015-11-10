package com.skillbucket.model;

import org.springframework.stereotype.Component;

@Component
public class User {

	private String username;
	private String password;
	private String email;
	private String authority;
	private boolean enabled = false;
	private String firstName;
	private String lastName;
	private String title;

	public User() {

	}

	public User(String username, String password, String authority, boolean enabled, String firstName,
			String lastName) {
		this.username = username;
		this.password = password;
		this.authority = authority;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", email=" + email + ", authority=" + authority
				+ ", enabled=" + enabled + ", firstName=" + firstName + ", lastName=" + lastName + ", title=" + title
				+ "]";
	}

}
