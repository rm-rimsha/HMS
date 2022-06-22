package com.HMS.Services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.web.servlet.ModelAndView;
import com.HMS.ConfigAndDB.Database;
//import com.HMS.Controllers.PatientLoginController;//////////////////////////////////////////////////////////////////////
import com.HMS.Controllers.PatientLoginController;

import java.lang.Math;

public class AppointmentService {
	private static int id=PatientLoginController.patientId;
	private  String deptName;
	private static int doctorId;
	static int consultTime;
	private static Database db=new Database();
	private static Connection connection=db.getConnection();
	
	//constructor for Department Name
	public AppointmentService(String deptName) {
		this.deptName=deptName;
	}
	public AppointmentService(int doctorId) {
		AppointmentService.doctorId=doctorId;
	}
	
	public static String getDepartments() {
		try {
			PreparedStatement pst = connection.prepareStatement("select name from department ");
			ResultSet result = pst.executeQuery();
			String deptName="";
			while (result.next()) {      
			   deptName+=result.getString("name")+",";
			}
			if(deptName.length()>0) {
				deptName=deptName.substring(0, deptName.length()-1);
			}
			
			return deptName;
		}
		
		catch (Exception e) {
            e.printStackTrace();
		
	}
		return "";
	}//end of method
	
	
	public void fetchDoctors(ModelAndView mv) {
		try {
			PreparedStatement pst = connection.prepareStatement("select id,name,speciality,qualification,"
					+ "experience,fee from Doctor where departmentName=? ");
			pst.setString(1,deptName);
			ResultSet result = pst.executeQuery();
			int noOfDoctors = 0;
			String doctorIds = "";
			String doctorName = "";
			String qualification = "";
			String experience = "";
			String speciality = "";
			String fee = "";
			while (result.next()) {
					noOfDoctors++;
					doctorIds += result.getInt("id") + ",";
					doctorName += result.getString("name") + ",";
					qualification += result.getString("qualification") + ",";
					speciality += result.getString("speciality") + ",";
					experience += result.getDouble("experience") + ",";
					fee += result.getInt("fee") + ",";
					
				
			}
			if (noOfDoctors > 0) {
				doctorIds = doctorIds.substring(0, doctorIds.length() - 1);
				doctorName = doctorName.substring(0, doctorName.length() - 1);
				qualification = qualification.substring(0, qualification.length() - 1);
				speciality = speciality.substring(0, speciality.length() - 1);
			}
			mv.addObject("noOfDoctors", noOfDoctors);
			mv.addObject("doctorIds", doctorIds);
			mv.addObject("doctorName", doctorName);
			mv.addObject("qualifications", qualification);
			mv.addObject("speciality", speciality);
			mv.addObject("experience",experience);
			mv.addObject("fee",fee);
			
		} catch (Exception e) {
			System.out.println(e);
		}

	}//end of method
	
	
	//method to get time for the appointment
	public static void setTime(ModelAndView mv, String selectedDate, String dateSelectId, String timeSelectId) {
		String availableDays="";
		String timings="";
		try {
	       PreparedStatement pst=connection.prepareStatement("select availableDays,consultationTime from doctor"
	       		+ " where id=?");
	      pst.setInt(1,doctorId);
	      ResultSet rs=pst.executeQuery();
	      
	      if(rs.next()) {
	    	  availableDays=rs.getString("availableDays");//string of days
		      consultTime=rs.getInt("consultationTime");
	      }
	      
	      PreparedStatement pst1=connection.prepareStatement("select * from Timing where doctorId=?");
	      pst1.setInt(1, doctorId);
	      ResultSet rs1=pst1.executeQuery();
	      if (rs1.next()) {
	    	  SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
	    	  int startTime = Integer.parseInt(sdf.format(rs1.getTime("startTime")));
	    	  int endTime = Integer.parseInt(sdf.format(rs1.getTime("endTime")));
	    	  int bsTime = Integer.parseInt(sdf.format(rs1.getTime("bStartTime")));
	    	  int beTime = Integer.parseInt(sdf.format(rs1.getTime("bEndTime")));
	    	  
	    	  int q =(int)(consultTime+Math.floor(consultTime/60)*40)*100;
	    	  int timing=startTime;
	    	  int a = endTime - q,b = bsTime - q, c = beTime - q;
	    	  if(a % 10000 >= 6000) {
	    		  a = (int)(a - 4000);
	    	  }
	    	  if(b % 10000 >= 6000) {
	    		  b = (int)(b - 4000);
	    	  }
	    	  String temp;
	    	  while((timing <= a) && (timing <= b )) {
	    		  	temp = String.valueOf(timing);
	    		  	while (temp.length() < 6) {
	    		  		temp = "0" + temp;
	    		  	}

	    		    SimpleDateFormat sdf1 = new SimpleDateFormat("HHmmss");
	    		    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");	    
	    		        Date d = (Date) sdf1.parse(temp);
	    		        temp = sdf2.format(d);
	    			  timings+=(temp + ",");
	    		  
	    		  timing+=q;
    			  if((timing%10000) >= 6000 ) {
    				  timing = (int)(timing+4000);
	    		  	}
	    		  
	    	  }
	    	  timing = beTime;
	    	  while((timing <= a) && (timing > startTime )) {
	    		  
	    		  temp = String.valueOf(timing);
	    		  	while (temp.length() < 6) {
	    		  		temp = "0" + temp;
	    		  	}
	    		  	SimpleDateFormat sdf1 = new SimpleDateFormat("HHmmss");
	    		    SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");	    
	    		        Date d = (Date) sdf1.parse(temp);
	    		        temp = sdf2.format(d);
	    			  timings+=(temp + ",");
    		  
    		  timing+=q;
			  if((timing%10000) >= 6000 ) {
				  timing = (int)(timing+4000);
    		  	}
    		  
    	  }
	    	  if(timings.length()>0) {
					timings=timings.substring(0, timings.length()-1);
			  }
	    	  
	    	  
	      }    	  
    	  
	      String[] output =new String[15];
	      int number;
	      String monday="";
	      String tuesday="";
	      String sunday="";
	      String wednesday="";
	      String thursday="";
	      String friday="";
	      String saturday="";
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      Calendar c = Calendar.getInstance();
	      
	      for(int i=0;i<15;i++) {
	    	  if(i == 0) {
	    		  c.add(Calendar.DATE,0);
	    	  }else {
	    	  c.add(Calendar.DATE,1);
	    	  }
	    	  output[i]=sdf.format(c.getTime());
	    	  Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(output[i]); 
	    	  number=getDayNo(date1);
	    	  if(number==1) {
	    		  sunday+=output[i]+",";
	    	  }
	    	  else if(number==2) {
	    		  monday+=output[i]+",";
	    	  }
              else if(number==3) {
	    		  tuesday+=output[i]+",";
	    	  }
              else if(number==4) {
            	  wednesday+=output[i]+",";
	  
              }
              else if(number==5) {
            	  thursday+=output[i]+",";
	  
              }
              else if(number==6) {
            	  friday+=output[i]+",";
              }
              else if(number==7) {
            	  saturday+=output[i]+",";
	    	  }
	    	 
	    	  
	      }//end of for loop
	      if(monday.length()>0) {
				monday=monday.substring(0, monday.length()-1);
			}
	      if(tuesday.length()>0) {
				tuesday=tuesday.substring(0, tuesday.length()-1);
			}
	      if(wednesday.length()>0) {
				wednesday=wednesday.substring(0, wednesday.length()-1);
			}
	      if(thursday.length()>0) {
				thursday=thursday.substring(0, thursday.length()-1);
			}
	      if(friday.length()>0) {
				friday=friday.substring(0, friday.length()-1);
			}
	      if(saturday.length()>0) {
				saturday=saturday.substring(0, saturday.length()-1);
			}
	      if(sunday.length()>0) {
				sunday=sunday.substring(0, sunday.length()-1);
			}
	      availableDays = availableDays.toLowerCase().replaceAll("\\s+", "");
	      String arr[]=availableDays.split(",");
	      
	      for(String day:arr) {
	    	  if(day.equals("monday")) {
	    		  mv.addObject("monday",monday);
	    	  }
	    	  else if(day.equals("tuesday")) {
	    		  mv.addObject("tuesday",tuesday);
	    	  }
	    	  else if(day.equals("wednesday")) {
	    		  mv.addObject("wednesday",wednesday);
	    	  }
	    	  else if(day.equals("thursday")) {
	    		  mv.addObject("thursday",thursday);
	    	  }
	    	  else if(day.equals("friday")) {
	    		  mv.addObject("friday",friday);
	    	  }
	    	  else if(day.equals("saturday")) {
	    		  mv.addObject("saturday",saturday);
	    	  }
	    	  else if(day.equals("sunday")) {
	    		  mv.addObject("sunday",sunday);
	    	  }
	      }
	      
	      mv.addObject("dateSelectId", dateSelectId);
	      mv.addObject("timeSelectId", timeSelectId);
	      mv.addObject("selectedDate", selectedDate);
	      mv.addObject("availableDays",availableDays);
	      mv.addObject("timings",timings);
	      mv.addObject("noOfAvailDays",arr.length);		
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	//method to calculate day number
	//in java 1=sunday and 7=saturday
	public static int getDayNo(Date date) {
	    Calendar cal = Calendar.getInstance();
	    cal.setTime(date);
	    return cal.get(Calendar.DAY_OF_WEEK);
	}
	
	public void getChangedTimings(ModelAndView mv, String selectedDate, String timings, int doctorId) {
		
			String changedTimings = "";
			String[] timeArray = timings.split(",");
			int q =(int)(consultTime+Math.floor(consultTime/60)*40)*100;
			String bookedTimings = getBookedTimings(selectedDate, doctorId);
			for(String time : timeArray) {
				if(isValidTime(time, bookedTimings, q)) {
					changedTimings += (time + ",");
				}
			}
			if(changedTimings.length()>0) {
				changedTimings=changedTimings.substring(0, changedTimings.length()-1);
		  }
			mv.addObject("changedTimings", changedTimings);
		
	}
	public boolean isValidTime(String time, String bookedTimings, int consultationTime) {
		try {
			if ( bookedTimings.equals("")) return true;
			String[] booked = bookedTimings.split(",");
	    	SimpleDateFormat sdf = new SimpleDateFormat("HHmmss");
	    	SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm:ss");	    
	        Date d = (Date) sdf2.parse(time);
	    	int t = Integer.parseInt(sdf.format(d));
	    	int start, end;
	    	for(String bt : booked) {
	    		 Date g = (Date) sdf2.parse(bt);
	    		int b = Integer.parseInt(sdf.format(g));
	    		start = b - consultationTime;
	    		if(start % 10000 >= 6000) {
		    		  start = (int)(start - 4000);
		    	  }
	    		end = b + consultationTime;
	    		if(end % 10000 >= 6000) {
		    		  end = (int)(end + 4000);
		    	  }
	    		if(t > start && t < end) {
	    			return false;
	    		}
	    	}
		}catch(Exception e) {
			System.out.println(e);
		}
		return true;
	}
	
	public String getBookedTimings(String date, int doctorId) {
		try {
			String bookedTimings = "";
			PreparedStatement pst = connection.prepareStatement(
					"select time from appointment where date = ? and doctorId = ?");
			pst.setString(1,  date);
			pst.setInt(2,  doctorId);
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				bookedTimings += result.getTime("time") + ",";
			}
			if(bookedTimings.length() > 0) {
				bookedTimings = bookedTimings.substring(0, bookedTimings.length() - 1);
			}
			return bookedTimings;
		}catch(Exception e) {
			System.out.println(e);
		}
		return "";
	}
	
	public static boolean isValid(int patientId, String patientName) {
		try {
			PreparedStatement pst = connection.prepareStatement("select name from patient where id = ?");
			pst.setInt(1,  patientId);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				if(result.getString("name").toLowerCase().replaceAll("\\s+", "").equals(patientName.toLowerCase().replaceAll("\\s+", ""))) {
					return true;
				}
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return false;
	}
}
