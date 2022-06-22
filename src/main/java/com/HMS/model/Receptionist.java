package com.HMS.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Range;

public class Receptionist 
{
	@NotEmpty(message = "*Required")
	private String username;
	
	@NotEmpty(message = "*Required")
	private String password;
	
	@NotEmpty(message = "*Required")
	private String name;
	
	@NotEmpty(message = "*Required")
	private String gender;
	
	@NotEmpty(message = "*Required")
	private String email;
	
	@NotNull(message = "*Required")
	@Range(min = 11, message = "Enter contact number in format 03*********")
	private long contactNumber;
	
	@NotEmpty(message = "*Required")
	private String departmentName;

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	


}
