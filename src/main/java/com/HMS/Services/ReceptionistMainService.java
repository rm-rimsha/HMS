package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.ReceptionistLoginController;

public class ReceptionistMainService {
	
	private static String username = ReceptionistLoginController.receptionistUsername;
	private static Database db = new Database();
	private static Connection connection = db.getConnection();
	
	public static void fetchProfile(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement("select * from receptionist where username = ?");
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				mv.addObject("name", result.getString("name"));
				mv.addObject("username", result.getString("username"));
				mv.addObject("gender", result.getString("gender"));
				mv.addObject("email", result.getString("email"));
				mv.addObject("contactNumber", result.getBigDecimal("contactNumber"));
				mv.addObject("departmentName", result.getString("departmentName"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public void cancelAppointment(String patientId, String doctorUsername, String date, String time) {
		try {
			PreparedStatement pst = connection.prepareStatement(
					"delete from appointment where patientId = ? and doctorId in "
					+ "(select id from doctor where username = ?) " 
					+ "and date = ? and time = ?");
			pst.setString(1,  patientId);
			pst.setString(2,  doctorUsername);
			pst.setString(3,  date);
			pst.setString(4,  time);
			pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
