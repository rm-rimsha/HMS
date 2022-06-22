package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.HMS.Controllers.PatientLoginController;
import com.HMS.ConfigAndDB.Database;

public class PatientChangePasswordService {
	private int id = PatientLoginController.patientId;
	private String currentpass;
	private String newpass;
	private String confirmpass;
	private static Database db;
	private static Connection connection;
	
	public PatientChangePasswordService(String currentpass,String newpass,String confirmpass) {		
		this.currentpass=currentpass;
		this.newpass=newpass;
		this.confirmpass=confirmpass;
		db=new Database();
		connection=db.getConnection();
				
	}
    //checks if the textfields are empty or not
	public boolean isEmpty() {
		return( Empty(currentpass)|| Empty(newpass) || Empty(confirmpass));
	}
	public boolean Empty(String string) {
		return string.replaceAll("\\s+", "").equals("");
	}
	//checks if username,currentpassword and id are of the same patient
	public boolean Check() {
		try {
			PreparedStatement pst=connection.prepareStatement("Select * from patient where id=? and password=?");
			pst.setInt(1, id);
			pst.setString(2, currentpass);
			ResultSet result=pst.executeQuery();
			if(result.next()) {
    			return true;
    		}
    	}catch(Exception e) {
    		System.out.println(e);
    	}
		return false;
	}
	
	public boolean passlength() {
		if(newpass.length()>=8) {
			return true;
		}
		else
			return false;
	}
	
	public boolean validatepass() {
		if(newpass.equals(confirmpass)) {
			return true;
		}
		else return false;
	}
	
	public void changepass() {
		try {
			PreparedStatement pst=connection.prepareStatement("update patient set password=? where id=?");
			pst.setString(1,newpass);
			pst.setInt(2, id);
			pst.executeUpdate();			
	
		}
		catch(Exception e){
			System.out.println(e);
		}
		
		
	}
	

}
