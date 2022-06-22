package com.HMS.Services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.web.servlet.ModelAndView;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.PatientLoginController;

public class PatientMainService {
	
	private static int id=PatientLoginController.patientId ;
	private static Database db=new Database();
	private static Connection connection=db.getConnection();
	
	public static void fetchPatientProfile(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement("select * from patient where id = ?");
			pst.setInt(1, id);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				mv.addObject("name", result.getString("name"));
				mv.addObject("username", result.getString("username"));
				mv.addObject("gender", result.getString("gender"));
				mv.addObject("dateOfBirth",result.getDate("dateOfBirth"));
				mv.addObject("age",result.getInt("age"));
				mv.addObject("email", result.getString("email"));
				mv.addObject("contactNumber", result.getLong("contactNumber"));
				mv.addObject("address",result.getString("address"));
				
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	public static void fetchPatientHistory(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement("select * from medicalhistory where patientId=?");
			pst.setInt(1, id);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
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
	
	public static void fetchPrescription(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement("select (select name from doctor where id = p.doctorId) as name, "
					+ "prescription, date, doctorId from prescription p where  patientId = ?;");
			pst.setInt(1, id);
			ResultSet result = pst.executeQuery();
			
			int noOfCheckups = 0;
			String date = "";
			String doctorName = "";
			String prescription="";
			
			while(result.next()) {
				noOfCheckups++;
				doctorName += result.getString("name") + ",";
				date += result.getString("date") + ",";
				prescription += result.getString("prescription") + ",";
				
			}
			
		if (noOfCheckups > 0) {
			date = date.substring(0, date.length() - 1);
			doctorName = doctorName.substring(0, doctorName.length() - 1);
			prescription = prescription.substring(0, prescription.length() - 1);
			
		}
		mv.addObject("noOfCheckups", noOfCheckups);
		mv.addObject("dates", date);
		mv.addObject("prescriptions", prescription);
		mv.addObject("doctorNames", doctorName);
		
		
			}
		catch(Exception e) {
			System.out.println();
		}
	}
	
	//Cancel Appointment method
	public void cancelAppointment(String doctorId, String date, String time) {
		
		int did=Integer.parseInt(doctorId);  
        Date date1=Date.valueOf(date); 	
		//Time time1 = Time.valueOf(time);
		System.out.println(doctorId);
		try {
			PreparedStatement pst = connection.prepareStatement(
					"delete from appointment where patientId = ? and doctorId =? "
																 + "and date = ? and time = ?");
			pst.setInt(1,id);
			pst.setInt(2,  did);
			pst.setDate(3,  date1);
			pst.setString(4,  time);
			pst.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
	}


	public static void fetchAppointments(ModelAndView mv, String whichAppointments) {
		
		PreparedStatement pst1;
		try {
			if (whichAppointments.equals(""))
				whichAppointments = "today";
			if (whichAppointments.equals("upcomingAppointments")) {
				pst1 = connection.prepareStatement("select doctorId, date, time from appointment "
						+ "where patientId =?  and (date > curdate() or (date = curdate() and"
						+ "(time >= current_time()))) "
						+ "order by date desc, time desc");
				pst1.setInt(1, id);
				//pst1.setInt(2, doctorId);
			} else if (whichAppointments.equals("today")) {
				pst1 = connection.prepareStatement("select doctorId, date, time from appointment "
						+ "where patientId=? and (date = curdate()) "
						+ "order by date, time");
				pst1.setInt(1, id);
			} else if (whichAppointments.equals("previousAppointments")) {
				pst1 = connection.prepareStatement("select doctorId, date, time from appointment "
						+ "where patientId=? and (date < curdate() or (date = curdate() and"
						+ " (time < current_time()))) "
						+ "order by date desc, time desc");
				pst1.setInt(1, id);
				//pst1.setInt(2, doctorId);
			} else {
				pst1 = connection.prepareStatement("select doctorId, date, time from appointment "
						+ "where patientId=? " + "order by date desc, time desc");
				pst1.setInt(1, id);
			}
			ResultSet result1 = pst1.executeQuery();
			//int doctorsId=result1.getInt("doctorId");
			PreparedStatement pst2 = connection.prepareStatement("select name,departmentName,speciality,fee from doctor where id = ?");
			ResultSet result2;
			int noOfAppointments = 0;
			String doctorIds = "";
			String doctorName = "";
			String departments="";
			String fees="";
			String speciality="";
			String dates = "";
			String times = "";
			while (result1.next()) {
				pst2.setInt(1, result1.getInt("doctorId"));
				result2 = pst2.executeQuery();
				if (result2.next()) {
					noOfAppointments++;
					doctorIds += result1.getInt("doctorId") + ",";
					doctorName += result2.getString("name") + ",";
					departments += result2.getString("departmentName") + ",";
					fees += result2.getString("fee") + ",";
					speciality += result2.getString("speciality") + ",";
					dates += result1.getDate("date") + ",";
					times += result1.getTime("time") + ",";
				}
			}
			if (noOfAppointments > 0) {
				doctorIds = doctorIds.substring(0, doctorIds.length() - 1);
				doctorName = doctorName.substring(0, doctorName.length() - 1);
				departments = departments.substring(0, departments.length() - 1);
				fees = fees.substring(0, fees.length() - 1);
				speciality = speciality.substring(0, speciality.length() - 1);
				dates = dates.substring(0, dates.length() - 1);
				times = times.substring(0, times.length() - 1);
			}
			mv.addObject("noOfAppointments", noOfAppointments);
			mv.addObject("doctorIds", doctorIds);
			mv.addObject("doctorfees", fees);
			mv.addObject("doctorNames", doctorName);
			mv.addObject("departments", departments);
			mv.addObject("doctorspecialities", speciality);
			mv.addObject("dates", dates);
			mv.addObject("times", times);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
}
