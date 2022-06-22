package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.AppointmentService;
import com.HMS.Services.PatientRegisterService;
import com.HMS.Services.ReceptionistLoginService;
import com.HMS.Services.ReceptionistMainService;
@Controller
public class ReceptionistMainController {
	
	@RequestMapping("receptionistViewProfile")
	public ModelAndView receptionistViewProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ReceptionistViewProfile.jsp");
		ReceptionistMainService.fetchProfile(mv);
		return mv;
	}
	
	@RequestMapping("receptionistBookAppointments")
	public ModelAndView doctorViewPatients() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("appointment.jsp");
		mv.addObject("module", "receptionist");
		mv.addObject("deptName",AppointmentService.getDepartments());
		return mv;
	}
	@RequestMapping("receptionistCancelAppointment")
	public ModelAndView receptionistCancelAppointment(@RequestParam("info") String info) {
		String[] infoArray = info.split(",");
		ReceptionistMainService rms = new ReceptionistMainService();
		rms.cancelAppointment(infoArray[0], infoArray[1], infoArray[2], infoArray[3]);
		ModelAndView mv = new ModelAndView();
		mv.addObject("whichAppointments", infoArray[4]);
		mv.addObject("doctorUsername", infoArray[1]);
		ReceptionistLoginService.fetchAppointments(mv, infoArray[4], infoArray[1]);
		ReceptionistLoginService.fetchDoctors(mv);
		mv.setViewName("ReceptionistMain.jsp");
		return mv;
	}

	@RequestMapping("receptionistSelectOption")
	public ModelAndView receptionistSelectOption(@RequestParam("whichAppointments") String whichAppointments, 
													@RequestParam("doctorUsername") String doctorUsername) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("whichAppointments", whichAppointments);
		mv.addObject("doctorUsername", doctorUsername);
		ReceptionistLoginService.fetchAppointments(mv, whichAppointments, doctorUsername);
		ReceptionistLoginService.fetchDoctors(mv);
		mv.setViewName("ReceptionistMain.jsp");
		return mv;
	}

	
}