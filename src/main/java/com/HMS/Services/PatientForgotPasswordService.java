package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.HMS.ConfigAndDB.Database;
import com.HMS.Controllers.PatientForgotPasswordController;

public class PatientForgotPasswordService {
	private String username;
	private String email;
	private String newPassword;
	private Database db;
	private Connection connection;

	public PatientForgotPasswordService(String username, String email) {
		this.username = username;
		this.email = email;
		db = new Database();
		connection = db.getConnection();
	}

	public boolean check() {
		try {
			PreparedStatement pst = connection
					.prepareStatement("select * from patient where username = ? and email = ?");
			pst.setString(1, username);
			pst.setString(2, email);
			ResultSet result = pst.executeQuery();
			if (!result.next()) {
				return false;
			}

		} catch (Exception e) {
			System.out.print(e);
		}
		return true;
	}

	public void changePassword() {
		try {
			Random random = new Random();
			newPassword = "";
			for (int i = 0; i < 8; i++) {
				newPassword += (char) (random.nextInt(26) + 'a');
			}
			PreparedStatement pst = connection.prepareStatement("update patient set password = ? where username = ?");
			pst.setString(1, newPassword);
			pst.setString(2, username);
			pst.executeUpdate();
			MailService.sendEmail(email, newPassword);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public boolean isEmpty() {
		return (username.replaceAll("\\s+", "").equals("") || email.replaceAll("\\s+", "").equals(""));
	}
}
