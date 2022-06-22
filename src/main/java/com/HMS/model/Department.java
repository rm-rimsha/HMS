package com.HMS.model;

import javax.validation.constraints.NotEmpty;

public class Department 
{
	@NotEmpty(message = "*Required")
	private String depName;

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}
	

}
