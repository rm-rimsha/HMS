package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.PatientLoginController;
public class PatientLoginService {
	private String username;
	private String password;
	private static int id;
	private static Database db;
	private static Connection connection;
	
	//constructor
	public PatientLoginService(String username,String password) {
		this.username=username;
		this.password=password;
		db=new Database();
		connection=db.getConnection();
		
	}
	public boolean check() {
		try {
			PreparedStatement pst=connection
					.prepareStatement("select id from patient where username=? and password=?");
			pst.setString(1,username);
			pst.setString(2, password);
			ResultSet result=pst.executeQuery();
			
			if(!result.next()) {
				return false;
			}
			id=result.getInt("id");
			PatientLoginController.patientId=id;
						
		}catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

	public boolean isEmpty() {
		return (username.replaceAll("\\s+", "").equals("") || password.replaceAll("\\s+", "").equals(""));
		
	}
	
	
	

}
