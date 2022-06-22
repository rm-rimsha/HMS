package com.HMS.Controllers;

//IMPORTS
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;

import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


import com.HMS.ConfigAndDB.Database;
import com.HMS.model.Doctor;

@Controller
public class DocController {
	

	// RETURNS ADMIN MENU
	@GetMapping("/AdminMenu")
	public String returnToMenu() {
		return "AdminMenu.jsp";
	}


	                                         // <<<<ADD DOCTOR>>>> //

	// CREATE NEW DOCTOR USER
	@ModelAttribute("docUser")
	public Doctor setUpDoc() {
		return new Doctor();
	}

	// GO TO DOCTOR REGISTRATION PAGE
	@GetMapping("/showAddDoc")
	public String addDocForm() {
		return "AddDoc.jsp";
	}

	// SAVE THE DOCTOR USER.
	// INSERT DATA INTO DATABASE
	// CHECK FOR ANY ERRORS
	@PostMapping("/saveDoc")
	public String saveDoc(@Valid @ModelAttribute("docUser") Doctor docUser, BindingResult b) {
		
		String username = docUser.getUsername();
		String password = docUser.getPassword();
		String name = docUser.getName();
		String gender = docUser.getGender();
		String email = docUser.getEmail();
		long contactNum = docUser.getContactNumber();
		String speciality = docUser.getSpeciality();
		String qualification = docUser.getQualification();
		double experience = docUser.getExperience();
		int consultationTime = docUser.getConsultationTime();
		String availableDays = docUser.getAvailableDays();
		double fee = docUser.getFee();
		String department = docUser.getDepartment();
		Date dob = docUser.getDob();
	
		String startT = docUser.getStartT();
		Time sT = Time.valueOf(startT);
		
		String endT = docUser.getEndT();
		Time eT = Time.valueOf(endT);
		
		String sB = docUser.getStartB();
		Time startB = Time.valueOf(sB);
		
		String eB = docUser.getEndB();
		Time endB = Time.valueOf(eB);

		

		// DATABASE CLASS OBJECT
		// CONNECTION, STATEMENT OBJECT
		Database db = new Database();
		Connection c = db.getConnection();
		Statement s = db.getStatement();

		// SQL QUERY FOR INSERTING DATA INTO THE TABLE
		String sql = "Insert into Doctor(username,password,name,gender,email,"
				+ "contactNumber,speciality,qualification,experience,"
				+ "consultationTime,availableDays, fee,departmentName, dateOfBirth)" 
				+ "Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		// USER-ENTERED DATA HAS NO ERROR
		if (!b.hasErrors()) {
			try {
				PreparedStatement p = c.prepareStatement(sql);
				p.setString(1, username);
				p.setString(2, password);
				p.setString(3, name);
				p.setString(4, gender);
				p.setString(5, email);
				p.setLong(6, contactNum);
				p.setString(7, speciality);
				p.setString(8, qualification);
				p.setDouble(9, experience);
				p.setInt(10, consultationTime);
				p.setString(11, availableDays);
				p.setDouble(12, fee);
				p.setString(13, department);
				p.setDate(14,dob);

				p.execute();
				
				String sql2 = "Insert into Timing(startTime, endTime, bStartTime, bEndTime)" + "Values(?,?,?,?)";
				
				PreparedStatement p2 = c.prepareStatement(sql2);
				p2.setTime(1, sT);
				p2.setTime(2, eT);
				p2.setTime(3, startB);
				p2.setTime(4, endB);
				p2.execute();

			} catch (SQLException e) {

				e.printStackTrace();
			}

			return "AdminMenu.jsp";
		}
		// USER-ENTERED DATA HAS ANY ERROR
		// RETURN TO SAME PAGE AND TRY AGAIN
		else
			return "AddDoc.jsp";

	}
	// ADD-DOCTOR-COMPLETE

                               	           // <<PAGE-MAPPING>> //

	@GetMapping("/showDoctors")
	public String showDoctors() {
		return "ShowDoctors.jsp";
	}

	@GetMapping("/editDoctors")
	public String getEditPage() {
		return "editDoc.jsp";
	}
	
	@GetMapping("/DoctorLoginForm")
	public String adminForm() 
	{
		return "DoctorLogin.jsp";
	}

	                                      // <<EDIT-DOCTOR>> //

	// create-new-doctor-object
	@ModelAttribute("editDoc")
	public Doctor editDoc() {
		return new Doctor();
	}

	// RETURNS UPDATEDOC PAGE
	@GetMapping("/updateDoc")
	public String getUpdatePage() {
		return "updateDoc.jsp";
	}

	// UPDATES THE DOCTOR-DATA IN DATABASE
	@PostMapping("/updateDoctor")
	public String updateDoctor(@Valid @ModelAttribute("editDoc") Doctor editDoc, BindingResult b) 
	{
		int id = editDoc.getId();
		String u = editDoc.getUsername();
		String n = editDoc.getName();
		String g = editDoc.getGender();
		String email = editDoc.getEmail();
		long num = editDoc.getContactNumber();
		Date dob = editDoc.getDob();
		String spec = editDoc.getSpeciality();
		String qual = editDoc.getQualification();
		Double exp = editDoc.getExperience();
		int consulT = editDoc.getConsultationTime();
		String availDays = editDoc.getAvailableDays();
		int fee = editDoc.getFee();
		String dep = editDoc.getDepartment();
		String password = editDoc.getPassword();
		
		String sT = editDoc.getStartT();
		Time startT = Time.valueOf(sT);
		String eT = editDoc.getEndT();
		Time endT = Time.valueOf(eT);
		String sB = editDoc.getStartB();
		Time startB = Time.valueOf(sB);
		String eB = editDoc.getEndB();
		Time endB = Time.valueOf(eB);
		 
		
		Database db = new Database();
		Connection c = db.getConnection();
		
		if(!b.hasErrors()) 
		{
			String sql = "Update Doctor Set username = ?, name = ?, gender = ?, email = ?, "
					+ "contactNumber = ?, dateOfBirth = ?,"+
	                 " speciality = ?, experience = ?, qualification = ?, availableDays = ?, "
	                 + "fee = ?, departmentName = ? , consultationTime = ? "+
				     " Where id = "+ id;
			
			PreparedStatement ps;
			try {
		
				ps = c.prepareStatement(sql);
				ps.setString(1, u);
				ps.setString(2, n);
				ps.setString(3, g);
				ps.setString(4, email);
				ps.setLong(5, num);
				ps.setDate(6, dob);
				
				ps.setString(7, spec);
				ps.setDouble(8, exp);
				ps.setString(9, qual);
				ps.setString(10, availDays);
				ps.setInt(11, fee);
				ps.setString(12, dep);
				ps.setInt(13, consulT);
				
				ps.executeUpdate();
				
				String sql1 = "Update Timing Set startTime = ?, endTime = ?, "
						+ "bStartTime = ?, bEndTime = ? Where doctorId = "+id;
				
				PreparedStatement ps1 = c.prepareStatement(sql1);
				ps1.setTime(1, startT);
				ps1.setTime(2, endT);
				ps1.setTime(3, startB);
				ps1.setTime(4, endB);
				
				ps1.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "AdminMenu.jsp";
			
		}
		else
		    return "updateDoc.jsp";
		
	}

	
	@GetMapping("/DeleteDoc")
	public String returnDelPage() 
	{
		return "DeleteDoc.jsp";
	}
	
	@GetMapping("/DeleteDocComplete")
	public String DelConfirmPage() 
	{
		return "DeleteDocComplete.jsp";
	}
}
//EDIT-DOC-COMPLETE

