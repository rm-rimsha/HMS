package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.DoctorPrescriptionController;
import com.HMS.Controllers.DoctorViewPatientDetailsController;
import com.HMS.Controllers.ReceptionistLoginController;

public class ReceptionistLoginService {
	private String username;
	private String password;
	private static Database db = new Database();
	private static Connection connection = db.getConnection();

	public ReceptionistLoginService(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public boolean check() {
		try {
			PreparedStatement pst = connection
					.prepareStatement("select * from receptionist where username = ? and password = ?");
			pst.setString(1, username);
			pst.setString(2, password);
			ResultSet result = pst.executeQuery();
			if (!result.next()) {
				return false;
			}
			ReceptionistLoginController.receptionistUsername = username;
		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

	public boolean isEmpty() {
		return (username.replaceAll("\\s+", "").equals("") || password.replaceAll("\\s+", "").equals(""));
	}

	public static void fetchAppointments(ModelAndView mv, String whichAppointments, String doctorUsername) {
		try {
			if (whichAppointments.equals(""))
				whichAppointments = "today";
			if (doctorUsername.equals("")) {
				PreparedStatement pst = connection.prepareStatement("select username from doctor where "
						+ "departmentName in (select departmentName from receptionist where username = ?)");
				pst.setString(1,  ReceptionistLoginController.receptionistUsername);
				ResultSet result = pst.executeQuery();
				if (result.next()) {
					doctorUsername = result.getString("username");
				} else {
					doctorUsername = null;
				}
			}
			PreparedStatement pst1 = null;
			if (whichAppointments.equals("upcomingAppointments")) {
				pst1 = connection.prepareStatement("select patientId, date, time from appointment "
						+ "where doctorId in(select id from doctor where username = ?) and "
						+ "(date > curdate() or (date = curdate() and"
						+ "(time  + (select (consultationTime + floor(consultationTime/60)*40)*100 "
						+ "from doctor where username = ?)) >= current_time())) "
						+ "order by date desc, time desc");
				pst1.setString(1, doctorUsername);
				pst1.setString(2, doctorUsername);
			} else if (whichAppointments.equals("today")) {
				pst1 = connection.prepareStatement("select patientId, date, time from appointment "
						+ "where doctorId in(select id from doctor where username = ?) and (date = curdate()) "
						+ "order by date, time");
				pst1.setString(1, doctorUsername);
			} else if (whichAppointments.equals("previousAppointments")) {
				pst1 = connection.prepareStatement("select patientId, date, time from appointment "
						+ "where doctorId in(select id from doctor where username = ?) and "
						+ "(date < curdate() or (date = curdate() and"
						+ " (time  + (select (consultationTime + floor(consultationTime/60)*40)*100 "
						+ "from doctor where username = ?)) < current_time())) "
						+ "order by date desc, time desc");
				pst1.setString(1, doctorUsername);
				pst1.setString(2, doctorUsername);
			} else {
				pst1 = connection.prepareStatement("select patientId, date, time from appointment "
						+ "where doctorId in(select id from doctor where username = ?) " 
						+ "order by date desc, time desc");
				pst1.setString(1, doctorUsername);
			}
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
	public static void fetchDoctors(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement(
					"select name, username from doctor where departmentName in "
					+ "(select departmentName from receptionist where username = ?)");
			pst.setString(1,  ReceptionistLoginController.receptionistUsername);
			ResultSet result = pst.executeQuery();
			String doctorNames = "";
			String doctorUsernames = "";
			int noOfDoctors = 0;
			while(result.next()) {
				noOfDoctors++;
				doctorNames += result.getString("name") + ",";
				doctorUsernames += result.getString("username") + ",";
			}
			if(! doctorNames.equals("")) {
				doctorNames = doctorNames.substring(0, doctorNames.length() - 1);
				doctorUsernames = doctorUsernames.substring(0, doctorUsernames.length() - 1);
			}
			mv.addObject("doctorNames", doctorNames);
			mv.addObject("doctorUsernames", doctorUsernames);
			mv.addObject("noOfDoctors", noOfDoctors);
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
