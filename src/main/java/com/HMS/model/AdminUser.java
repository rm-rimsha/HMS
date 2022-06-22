package com.HMS.model;

import javax.validation.constraints.NotEmpty;

public class AdminUser 
{
	@NotEmpty(message = "*Required")
	private String adminName;
	
	@NotEmpty(message = "*Required")
	private String adminPassword;
	
	private String adminNewPs;
	
	private String confirmNewPs;
	
	private String adminEmail;
	private long adminContact;
	
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public long getAdminContact() {
		return adminContact;
	}
	public void setAdminContact(long adminContact) {
		this.adminContact = adminContact;
	}
	public String getAdminNewPs() {
		return adminNewPs;
	}
	public void setAdminNewPs(String adminNewPs) {
		this.adminNewPs = adminNewPs;
	}
	public String getConfirmNewPs() {
		return confirmNewPs;
	}
	public void setConfirmNewPs(String confirmNewPs) {
		this.confirmNewPs = confirmNewPs;
	}
	
	
	

}
