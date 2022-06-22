package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.HMS.ConfigAndDB.Database;

public class DoctorViewPatientDetailsService {
	private int id;
	private Database db = new Database();
	private Connection connection = db.getConnection();
	
	public DoctorViewPatientDetailsService(int patientId) {
		id = patientId;
	}
	public void saveDetails(int patientId, String bloodGroup, double height, double weight, String maritalStatus, String drugAllergies, String diseases, 
			String otherIllnesses, String operations, String currentMedications, String exercise, String diet, String alcoholConsumption, 
			String caffeineConsumption, String smoking, String investigationHistory, String otherComments) {
		try {
			PreparedStatement pst1 = connection.prepareStatement(
					"select * from medicalHistory where patientId = ?");
			pst1.setInt(1,  patientId);
			ResultSet result = pst1.executeQuery();
			if(result.next()) {
				PreparedStatement pst2 = connection.prepareStatement("delete from medicalHistory where patientId = ?");
				pst2.setInt(1,  patientId);
				pst2.executeUpdate();
			}
			PreparedStatement pst3 = connection.prepareStatement(
					"insert into medicalHistory values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pst3.setString(1,  bloodGroup);
			pst3.setDouble(2,  height);
			pst3.setDouble(3,  weight);
			pst3.setString(4,  maritalStatus);
			pst3.setString(5,  drugAllergies);
			pst3.setString(6,  diseases);
			pst3.setString(7,  otherIllnesses);
			pst3.setString(8,  operations);
			pst3.setString(9,  currentMedications);
			pst3.setString(10,  exercise);
			pst3.setString(11,  diet);
			pst3.setString(12,  alcoholConsumption);
			pst3.setString(13,  caffeineConsumption);
			pst3.setString(14,  smoking);
			pst3.setString(15,  investigationHistory);
			pst3.setString(16,  otherComments);
			pst3.setInt(17,  patientId);
			pst3.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
