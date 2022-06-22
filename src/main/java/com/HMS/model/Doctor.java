package com.HMS.model;

import java.sql.Date;
//IMPORTS
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Range;


public class Doctor 
{
	//INSTANCE VARIABLES
	private int id;
	
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
    @Range(min = 11, message = "Enter contact number in format: 03*********")
	private long contactNumber;
	
	@NotEmpty(message = "*Required")
	private String speciality;
	
	@NotEmpty(message = "*Required")
	private String qualification;
	
	@NotNull(message = "*Required")
	@Range(min = 0 , message = "*Invalid number entered")
	private double experience;
    
	@NotNull(message = "*Required")
    @Range(min = 1, message = "Consultation Time cannot be negative or 0")
	private int consultationTime;
	
	@NotEmpty(message = "*Required")
	private String availableDays;
	
	@NotEmpty(message = "*Required")
	@Pattern(regexp = "([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]", message = "Enter time in 24-hour format")
	private String startT;
	
	@NotEmpty(message = "*Required")
	@Pattern(regexp = "([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]", message = "Enter time in 24-hour format")
	private String endT;
	
	@NotEmpty(message = "*Required")
	@Pattern(regexp = "([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]", message = "Enter time in 24-hour format")
	private String startB;
	
	@NotEmpty(message = "*Required")
	@Pattern(regexp = "([01]?[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]", message = "Enter time in 24-hour format")
	private String endB;
	
	private Date dob;
	
	@NotNull(message = "*Required")
	@Range(min = 100, message = "Incorrect")
	private int fee;
	
	@NotEmpty(message = "*Required")
	private String department;
	

	//GETTERS AND SETTERS
	

	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	
	public String getStartT() {
		return startT;
	}

	public void setStartT(String startT) {
		this.startT = startT;
	}

	public String getEndT() {
		return endT;
	}

	public void setEndT(String endT) {
		this.endT = endT;
	}

	public String getStartB() {
		return startB;
	}

	public void setStartB(String startB) {
		this.startB = startB;
	}

	public String getEndB() {
		return endB;
	}

	public void setEndB(String endB) {
		this.endB = endB;
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
	
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	
	public double getExperience() {
		return experience;
	}
	public void setExperience(double experience) {
		this.experience = experience;
	}
	
	public int getConsultationTime() {
		return consultationTime;
	}
	public void setConsultationTime(int consultationTime) {
		this.consultationTime = consultationTime;
	}
	
	public String getAvailableDays() {
		return availableDays;
	}
	public void setAvailableDays(String availableDays) {
		this.availableDays = availableDays;
	}
	
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
	
}
