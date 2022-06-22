package com.HMS.ConfigAndDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {
    private Connection connection;
    private Statement statement;

    public Database(){
    	try {
    	String url = "jdbc:mysql://localhost:3306/";
    	String user = "root";
    	String password = "";
    	String db = "hms_database";
    	Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, password);
        statement = connection.createStatement();
        statement.execute("create database if not exists " + db);
        connection = DriverManager.getConnection(url + db , user, password);
        statement = connection.createStatement();
        createTables();
        }catch(Exception e){
        	System.out.println(e);
        }
    }

    public void createTables() throws SQLException {
    	statement.execute("create table if not exists Department(name varchar(45) primary key)");
    	
    	statement.execute("create table if not exists Doctor(id int auto_increment primary key, "
    			+ "username varchar(35), password varchar(45),"
    			+ " name varchar(20), gender varchar(15), dateOfBirth DATE, email varchar(45), "
    			+ "contactNumber bigint, speciality varchar(70), "
    			+ "qualification varchar(70), experience double, consultationTime int, "
    			+ "availableDays varchar(90), fee int, departmentName varchar(45), "
    			+ "foreign key(departmentName) references Department(name))");
    	
        statement.execute("create table if not exists Receptionist(username varchar(45) primary key, "
        		+ "password varchar (45), name varchar(20), gender varchar(15), email varchar(45), "
        		+ "contactNumber bigint, departmentName varchar(45), foreign key(departmentName)"
        		+ " references Department(name))");
        
        statement.execute("create table if not exists Timing(startTime Time, endTime Time, "
        		+ "bStartTime Time, bEndTime Time, doctorId int auto_increment,"
        		+ " foreign key(doctorId) references Doctor(id))");
        
        statement.execute("create table if not exists Patient(id int auto_increment primary key, "
        		+ "username varchar(35), password varchar(45),"
        		+ " name varchar(20), gender varchar(20), dateOfBirth date, age int, "
        		+ "email varchar(45), contactNumber bigint, address varchar(70))");
        
        statement.execute("create table if not exists Appointment(date date, time time, "
        		+ "patientId int, doctorId int, foreign key(patientId)"
        		+ " references Patient(id), foreign key(doctorId) references Doctor(id))");
        
        statement.execute("create table if not exists Prescription(date date, prescription text, "
        		+ "patientId int, doctorId int, foreign key(patientId)"
        		+ " references Patient(id), foreign key(doctorId) references Doctor(id))");
        
        statement.execute("create table if not exists MedicalHistory(bloodGroup varchar(3), "
        		+ "height double, weight double, maritalStatus varchar(10),"
        		+ " drugAllergies varchar(500), diseases varchar(500), otherIllness text, "
        		+ "operations text, currentMedications text,"
        		+ " exercise varchar(30), diet varchar(30), alcoholConsumption varchar(40), "
        		+ "caffeineConsumption varchar(40), smoking varchar(40),"
        		+ " investigationHistory text, otherComments text, patientId int, "
        		+ "foreign key(patientId) references Patient(id))");
        
        statement.execute("create table if not exists Admin(username varchar(45) primary key, "
        		+ "password varchar(45), email varchar(45), contactNumber bigint)");
    }
    public Connection getConnection() {
        return connection;
    }

    public Statement getStatement() {
        return statement;
    }
}
