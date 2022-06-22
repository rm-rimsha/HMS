package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.ReceptionistLoginController;

public class ReceptionistChangePasswordService {
	private String username = ReceptionistLoginController.receptionistUsername;
	private String currentPassword;
	private String newPassword;
	private String confirmPassword;
	private Database db = new Database();
	private Connection connection = db.getConnection();
	
    public ReceptionistChangePasswordService(String currentPassword, String newPassword, String confirmPassword) {
		this.currentPassword = currentPassword;
		this.newPassword = newPassword;
		this.confirmPassword = confirmPassword;
	}

    public void setPassword(){
    	try {
        PreparedStatement pst = connection.prepareStatement(
        		"update receptionist set password = ? where username = ?");
        pst.setString(1, newPassword);
        pst.setString(2, username);
        pst.executeUpdate();
    }catch(Exception e) {
    	System.out.println(e);}
    }
    public boolean checkPassword() {
    	try {
    		PreparedStatement pst = connection.prepareStatement(
    				"select * from receptionist where username = ? and password = ?");
    		pst.setString(1,  username);
    		pst.setString(2,  currentPassword);
    		ResultSet result = pst.executeQuery();
    		if(result.next()) {
    			return true;
    		}
    	}catch(Exception e) {
    		System.out.println(e);
    	}
		return false;
    }

    public boolean passwordMatch() {
    	return newPassword.equals(confirmPassword);
    }
    
    public boolean checkLength() {
    	return newPassword.length() >= 8;
    }
    
    public boolean requiredFieldsEmpty() {
    	return isEmpty(currentPassword) || isEmpty(newPassword) || isEmpty(confirmPassword);
    }
    
    public boolean isEmpty(String string) {
        return string.replaceAll("\\s+", "").equals("");
    }
}
