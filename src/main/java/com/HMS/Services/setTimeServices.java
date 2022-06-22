package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.text.ParseException;

import java.sql.Date;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.PatientLoginController;

public class setTimeServices {
	private String date;
	private String time;
	private int doctorId;
	private int patientId=PatientLoginController.patientId;
	private static Database db;
	private static Connection connection;
	
	public setTimeServices(int doctorId,String date,String time) {
		this.doctorId=doctorId;
		this.date=date;
		this.time=time;
		db=new Database();
		connection=db.getConnection();
	}
	
	public void insertData() throws ParseException {
		Date date1=Date.valueOf(date); 
		
		Time time1 = Time.valueOf(time);
		
		try {
			PreparedStatement pst=connection.prepareStatement(
					"insert into appointment (patientId,doctorId,time,date)"
					+ " values(?,?,?,?)");
			pst.setInt(1,patientId);
			pst.setInt(2, doctorId);
			pst.setTime(3,time1);
			pst.setDate(4,date1);
			pst.executeUpdate();
			
    	}catch(Exception e) {
    		System.out.println(e);
    	  }
		}
	

}
