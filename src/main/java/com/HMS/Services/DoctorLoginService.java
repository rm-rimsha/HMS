package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.DoctorLoginController;
import com.HMS.Controllers.DoctorPrescriptionController;
import com.HMS.Controllers.DoctorViewPatientDetailsController;

public class DoctorLoginService {
	private String username;
	private String password;
	private static int id;
	private static Database db;
	private static Connection connection;

	public DoctorLoginService(String username, String password) {
		this.username = username;
		this.password = password;
		db = new Database();
		connection = db.getConnection();
	}

	public boolean check() {
		try {
			PreparedStatement pst = connection
					.prepareStatement("select id from doctor where username = ? and password = ?");
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet result = pst.executeQuery();
			if (!result.next()) {
				return false;
			}
			id = result.getInt("id");
			DoctorLoginController.doctorId = id;
		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

	public boolean isEmpty() {
		return (username.replaceAll("\\s+", "").equals("") || password.replaceAll("\\s+", "").equals(""));
	}

	public static void fetchAppointments(ModelAndView mv) {
		try {
			DoctorPrescriptionController.nextScreen = "DoctorMain";
			DoctorViewPatientDetailsController.nextScreen = "DoctorMain";
			PreparedStatement pst1 = connection.prepareStatement(
					"select patientId, date, time from appointment "
					+ "where doctorId = ? and (date > curdate() or (date = curdate() and "
					+ "(time  + (select (consultationTime + floor(consultationTime/60)*40)*100 "
					+ "from doctor where id = ?)) >= current_time())) "
					+ "order by date, time");
			pst1.setInt(1, id);
			pst1.setInt(2,  id);
			ResultSet result1 = pst1.executeQuery();
			PreparedStatement pst2 = connection.prepareStatement("select name from patient where id = ?");
			ResultSet result2;
			int noOfAppointments = 0;
			String patientIds = "";
			String patients = "";
			String dates = "";
			String times = "";
			while (result1.next()) {
				pst2.setInt(1, result1.getInt("patientId"));
				result2 = pst2.executeQuery();
				if (result2.next()) {
					noOfAppointments++;
					patientIds += result1.getInt("patientId") + ",";
					patients += result2.getString("name") + ",";
					dates += result1.getDate("date") + ",";
					times += result1.getTime("time") + ",";
				}
			}
			if (noOfAppointments > 0) {
				patientIds = patientIds.substring(0, patientIds.length() - 1);
				patients = patients.substring(0, patients.length() - 1);
				dates = dates.substring(0, dates.length() - 1);
				times = times.substring(0, times.length() - 1);
			}
			mv.addObject("noOfAppointments", noOfAppointments);
			mv.addObject("patientIds", patientIds);
			mv.addObject("patients", patients);
			mv.addObject("dates", dates);
			mv.addObject("times", times);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
