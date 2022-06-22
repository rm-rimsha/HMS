package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.DoctorLoginController;

public class DoctorPrescriptionService {
	private int doctorId = DoctorLoginController.doctorId;
	private Database db = new Database();
	private Connection connection = db.getConnection();
	private String prescription;
	private int patientId;
	
	public DoctorPrescriptionService(int patientId, String prescription) {
		this.patientId = patientId;
		this.prescription = prescription;
	}
	
	public void savePrescription() {
		try {
			PreparedStatement pst1 = connection.prepareStatement(
					"select * from prescription where patientId = ? and doctorId = ? and date = curdate()");
			pst1.setInt(1,  patientId);
			pst1.setInt(2,  doctorId);
			ResultSet result = pst1.executeQuery();
			if(result.next()) {
				PreparedStatement pst2 = connection.prepareStatement(
						"delete from prescription where patientId = ? and doctorId = ? and date = curdate()");
				pst2.setInt(1,  patientId);
				pst2.setInt(2,  doctorId);
				pst2.executeUpdate();
			}
			PreparedStatement pst3 = connection.prepareStatement("insert into prescription values(curdate(),?,?,?)");
			pst3.setString(1,  prescription);
			pst3.setInt(2,  patientId);
			pst3.setInt(3,  doctorId);
			pst3.executeUpdate();
		}catch(Exception e) {
			System.out.println();
		}
	}
}
