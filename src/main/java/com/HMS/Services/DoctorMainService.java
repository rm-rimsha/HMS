package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.DoctorLoginController;
import com.HMS.Controllers.DoctorPrescriptionController;
import com.HMS.Controllers.DoctorViewPatientDetailsController;

public class DoctorMainService {
	private static int id = DoctorLoginController.doctorId;
	private static Database db = new Database();
	private static Connection connection = db.getConnection();
	
	public static void fetchProfile(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement("select * from doctor where id = ?");
			pst.setInt(1, id);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				mv.addObject("name", result.getString("name"));
				mv.addObject("username", result.getString("username"));
				mv.addObject("gender", result.getString("gender"));
				mv.addObject("dateOfBirth", result.getString("dateOfBirth"));
				mv.addObject("email", result.getString("email"));
				mv.addObject("contactNumber", result.getBigDecimal("contactNumber"));
				mv.addObject("speciality", result.getString("speciality"));
				mv.addObject("qualification", result.getString("qualification"));
				mv.addObject("experience", result.getString("experience"));
				mv.addObject("consultationTime", result.getInt("consultationTime"));
				mv.addObject("availableDays", result.getString("availableDays"));
				mv.addObject("fee", result.getInt("fee"));
				mv.addObject("departmentName", result.getString("departmentName"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public static void fetchPatients(ModelAndView mv) {
		try {
			DoctorPrescriptionController.nextScreen = "DoctorViewPatients";
			DoctorViewPatientDetailsController.nextScreen = "DoctorViewPatients";
			PreparedStatement pst1 = connection.prepareStatement(
					"select patientId, date, time from appointment "
					+ "where doctorId = ? and (date < curdate() or (date = curdate() and time <= current_time())) "
					+ "order by date desc, time desc");
			pst1.setInt(1, id);
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
	
	public static void fetchPatientDetails(ModelAndView mv, int patientId) {
		try {
			PreparedStatement pst = connection.prepareStatement(
					"select * from patient left outer join medicalHistory"
					+ " on patient.id = medicalHistory.patientId where id = ?");
			pst.setInt(1, patientId);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				mv.addObject("name", result.getString("name"));
				mv.addObject("gender", result.getString("gender"));
				mv.addObject("age", result.getInt("age"));
				mv.addObject("email", result.getString("email"));
				mv.addObject("contactNumber", result.getBigDecimal("contactNumber"));
				mv.addObject("address", result.getString("address"));
				mv.addObject("bloodGroup", result.getString("bloodGroup"));
				mv.addObject("height", result.getDouble("height"));
				mv.addObject("weight", result.getDouble("weight"));
				mv.addObject("maritalStatus", result.getString("maritalStatus"));
				mv.addObject("drugAllergies", result.getString("drugAllergies"));
				mv.addObject("diseases", result.getString("diseases"));
				mv.addObject("otherIllnesses", result.getString("otherIllness"));
				mv.addObject("operations", result.getString("operations"));
				mv.addObject("currentMedications", result.getString("currentMedications"));
				mv.addObject("exercise", result.getString("exercise"));
				mv.addObject("diet", result.getString("diet"));
				mv.addObject("alcoholConsumption", result.getString("alcoholConsumption"));
				mv.addObject("caffeineConsumption", result.getString("caffeineConsumption"));
				mv.addObject("smoking", result.getString("smoking"));
				mv.addObject("investigationHistory", result.getString("investigationHistory"));
				mv.addObject("otherComments", result.getString("otherComments"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public static void fetchPrescription(ModelAndView mv, int patientId) {
		try {
			PreparedStatement pst = connection.prepareStatement(
					"select date, prescription from prescription "
					+ "where patientId = ? and doctorId = ? and date = curdate()");
			pst.setInt(1,  patientId);
			pst.setInt(2,  id);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				mv.addObject("prescription", result.getString("prescription"));
			}
		}catch(Exception e) {
			System.out.println();
		}
	}
	
}
