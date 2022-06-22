package com.HMS.Services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.HMS.ConfigAndDB.Database;

public class PatientRegisterService {

	private String fullname;
	private String gender;
	private String date;
	private String username;
	private String email;
	private String password;
	private String confirmpassword;
	private String mobile;
	private String address;
	private static Database db;
	private static Connection connection;
	
	//constructor
	public PatientRegisterService(String fullname,String gender,String date,String username,
			String email,String password,String confirmpassword,String mobile,String address) {
		
		this.fullname=fullname;
		this.gender=gender;
		this.date=date;
		this.username=username;
		this.email=email;
		this.password=password;
		this.confirmpassword=confirmpassword;
		this.mobile=mobile;
		this.address=address;
		db=new Database();
		connection=db.getConnection();
		
	}
	//to check if any text field is empty 
		public boolean isEmpty() {
			return (Empty(fullname) || Empty(date) || Empty(username) || Empty(gender) || Empty(email) 
					|| Empty(password) || Empty(confirmpassword) || Empty(address));
		}
		
		public boolean Empty(String string) {
			return string.replaceAll("\\s+", "").equals("");
		}
	
		public boolean checkusername() {
			try {
				PreparedStatement pst=connection
						.prepareStatement("select * from patient where username = ?");
				pst.setString(1,  username);
				ResultSet result=pst.executeQuery();
				
				if(result.next()) {
					return true;	
				}
							
			}catch (Exception e) {
				System.out.println(e);
			}
			return false;
			
		}

	
	public boolean checkpassword() {
		if(password.equals(confirmpassword)) {
			return true;
		}
		else
			return false;	
	}
	public boolean checkpasslength() {
		if(password.length()>8) {
			return true;
		}
		else 
			return false;
	}
	
	public void addData() throws ParseException {
		
		int dob = Integer.parseInt(date.replaceAll("-", ""));
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");  
		LocalDateTime now = LocalDateTime.now();  
		int currentDate = Integer.parseInt(dtf.format(now));
		int age = (int)((currentDate - dob)/10000);
		  
		Date date1 = Date.valueOf(date);
	    long mobile1=Long.parseLong(mobile);
		
		//inserts data into database
		try {
			PreparedStatement pst=connection
					.prepareStatement("insert into patient(username,password,name,gender,dateOfBirth,age,email"+
			",contactNumber,address)"+"values(?,?,?,?,?,?,?,?,?)");
			pst.setString(1,username);
			pst.setString(2,password);
			pst.setString(3,fullname);
			pst.setString(4,gender);
			pst.setDate(5,date1);
			pst.setInt(6,age);
			pst.setString(7,email);
			pst.setLong(8,mobile1);
			pst.setString(9,address);
			pst.executeUpdate();
						
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static int getPatientId(String username) {
		try {
			PreparedStatement pst = connection.prepareStatement(
					"select id from patient where username = ?");
			pst.setString(1,  username);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				return result.getInt("id");
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	
}



