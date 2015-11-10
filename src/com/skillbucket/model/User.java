package com.skillbucket.model;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Component;

@Component
public class User {

	@NotBlank(message="Username cannot be blank.")
	@Size(min=8, max=15, message="Username must be between 8 and 15 characters long.")
	@Pattern(regexp="^\\w{8,}$", message="Username must only consist of numbers, letters and the underscore.")
	private String username;
	
	@NotBlank(message="Password cannot be blank.")
	@Size(min=8, message="Password must be a minimum of 8 characters.")
	@Pattern(regexp="^\\S+$", message="Password must contain spaces.")
	private String password;
	
	@NotBlank(message="Email cannot be blank.")
	@Email(message="Please enter a valid email address.")
	private String email;
	
	@NotBlank(message="First name cannot be blank.")
	private String firstName;

	@NotBlank(message="Last name cannot be blank.")
	private String lastName;

	private String title;
	private String authority;
	private boolean enabled = false;

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
