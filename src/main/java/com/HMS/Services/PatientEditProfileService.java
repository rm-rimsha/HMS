package com.HMS.Services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.PatientLoginController;

public class PatientEditProfileService {
	private String email;
	private String Number;
	private String address;
	private static int id=PatientLoginController.patientId;
	private Database db;
	private static Connection connection;
	
	public PatientEditProfileService(String email,String Number,String address) {
		this.address=address;
		this.email=email;
		this.Number=Number;
		db=new Database();
		connection=db.getConnection();
	}
	
	public boolean isEmpty() {
		return (Empty(email) || Empty(Number) || Empty(address) );
	}
	
	public boolean Empty(String string) {
		return string.replaceAll("\\s+", "").equals("");
	}
    public void editData()  {
	    long mobile1=Long.parseLong(Number);
		
		try {
			PreparedStatement pst=connection
					.prepareStatement("update patient set email=?,contactNumber=?,address=? where id=?");
			pst.setString(1,email);
			pst.setLong(2,mobile1);
			pst.setString(3,address);
			pst.setInt(4, id);

			pst.executeUpdate();
						
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
    public static void setDefaultValue(ModelAndView mv) {
    	try {
			PreparedStatement pst=connection
					.prepareStatement("select email,contactNumber,address from patient where id=?");
			pst.setInt(1, id);
			ResultSet result=pst.executeQuery();
			if(result.next()) {
				mv.addObject("Email",result.getString("email"));
				mv.addObject("Number",result.getString("contactNumber"));
				mv.addObject("Address",result.getString("address"));
			}
	
						
		}catch (SQLException e) {
			e.printStackTrace();
		}
    	
    }

}
