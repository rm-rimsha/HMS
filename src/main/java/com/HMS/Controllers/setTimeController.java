package com.HMS.Controllers;

import java.text.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientMainService;
import com.HMS.Services.ReceptionistLoginService;
import com.HMS.Services.setTimeServices;

@Controller
public class setTimeController {
	
	@RequestMapping("MainSc")
	public ModelAndView redirect() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv,"");
		return mv;
	}
	
	@RequestMapping("bookAppointment")
	public ModelAndView bookAppointment(@RequestParam("info") String info) throws ParseException {
		String arr[] = info.split(",");
		int doctorId = Integer.parseInt(arr[0]);
		String date = arr[1];
		String time = arr[2];
		
		ModelAndView mv = new ModelAndView();
		setTimeServices sts=new setTimeServices(doctorId,date,time);
		sts.insertData();
		if(AppointmentController.module.equals("receptionist")) {
			mv.setViewName("ReceptionistMain.jsp");
			ReceptionistLoginService.fetchAppointments(mv, "", "");
			ReceptionistLoginService.fetchDoctors(mv);
		}else {
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv, "");
		}
		return mv;
	}
	
	

}
