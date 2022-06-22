package com.HMS.Controllers;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.DoctorLoginService;
import com.HMS.Services.DoctorMainService;

@Controller
public class DoctorMainController {
	@RequestMapping("doctorPrescribe")
	public ModelAndView consult(@RequestParam("patientId") int patientId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("DoctorPrescription.jsp");
		mv.addObject("patientId", patientId);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
	    Date date = new Date();  
	    mv.addObject("date", formatter.format(date));
		DoctorMainService.fetchPrescription(mv, patientId);
		return mv;
	}

	@RequestMapping("doctorViewPatientDetails")
	public ModelAndView viewPatientHistory(@RequestParam("patientId") int patientId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("DoctorViewPatientDetails.jsp");
		mv.addObject("patientId", patientId);
		DoctorMainService.fetchPatientDetails(mv, patientId);
		return mv;
	}
	
	@RequestMapping("doctorViewProfile")
	public ModelAndView doctorViewProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("DoctorViewProfile.jsp");
		DoctorMainService.fetchProfile(mv);
		return mv;
	}
	
	@RequestMapping("doctorViewPatients")
	public ModelAndView doctorViewPatients() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("DoctorMain.jsp");
		DoctorMainService.fetchPatients(mv);
		return mv;
	}
	
	@RequestMapping("doctorHome")
	public ModelAndView doctorHome(){
		ModelAndView mv = new ModelAndView();
		mv.addObject("doctorId", DoctorLoginController.doctorId);
		DoctorLoginService.fetchAppointments(mv);
		mv.setViewName("DoctorMain.jsp");
		return mv;
	}
}