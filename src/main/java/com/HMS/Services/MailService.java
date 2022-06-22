package com.HMS.Services;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.HMS.Controllers.DoctorForgotPasswordController;

public class MailService {
	public static void sendEmail(String email, String newPassword) {
		try {
			final String senderEmail = "eyr_hms@hotmail.com";
			final String senderPassword = "1@2@3@4@5";
			Properties properties = new Properties();
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", "smtp.outlook.com");
			properties.put("mail.smtp.port", "587");
			Session session = Session.getInstance(properties, new Authenticator() {
				@Override
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(senderEmail, senderPassword);
				}
			});

			Message message = prepareMessage(session, senderEmail, email, newPassword);
			Transport.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	private static Message prepareMessage(Session session, String username, String recipient, String newPassword) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress((recipient)));
			message.setSubject("New Password");
			message.setText("Your password has been reset.\nThe new pasword is:         " + newPassword
					+ "\nYou can login using this password.");
			return message;
		} catch (Exception ex) {
			Logger.getLogger(DoctorForgotPasswordController.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

}
