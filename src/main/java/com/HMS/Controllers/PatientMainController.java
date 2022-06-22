package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.AppointmentService;
import com.HMS.Services.PatientEditProfileService;
import com.HMS.Services.PatientLoginService;
import com.HMS.Services.PatientMainService;

@Controller
public class PatientMainController {
	
	@RequestMapping("Redirect")
	public ModelAndView redirect() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv,"");
		return mv;
	}
	
	@GetMapping("/PatientLoginForm")
	public String adminForm() 
	{
		return "PatientLogin.jsp";
	}
	
	
	@RequestMapping("getAppointment")
	public ModelAndView appointments() {
		ModelAndView mv=new ModelAndView();
		mv.addObject("deptName",AppointmentService.getDepartments());
		mv.setViewName("appointment.jsp");
		return mv;
	}
	
	
	
	@RequestMapping("PatientMedicalHistory")
	public ModelAndView patienthistory() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMedicalHistory.jsp");
		PatientMainService.fetchPatientHistory(mv);
		PatientMainService.fetchPrescription(mv);
		return mv;
	}
	
	
	
	@RequestMapping("PatientViewProfile")
	public ModelAndView patientViewProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("PatientViewProfile.jsp");
		PatientMainService.fetchPatientProfile(mv);
		return mv;
	}
	
	@RequestMapping("editProfile")
	public ModelAndView patientEditProfile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("EditPatientProfile.jsp");
	    mv.addObject(PatientLoginController.patientId);
	    //PatientEditProfileService.setDefaultValue(mv);
	    //mv.addObject(mv);
	    return mv;
	    
	}
	
	//cancel appointment mapping
	@RequestMapping("patientCancelAppointment")
	public ModelAndView patientCancelAppointment(@RequestParam("info") String info) {
		System.out.println("die");
		String[] infoArray = info.split(",");
		PatientMainService pms = new PatientMainService();
		pms.cancelAppointment(infoArray[0],infoArray[1], infoArray[2]);
		ModelAndView mv = new ModelAndView();
		mv.addObject("whichAppointments", infoArray[3]);
		mv.addObject("doctorId", infoArray[0]);
		PatientMainService.fetchAppointments(mv, infoArray[3]);
		//ReceptionistLoginService.fetchDoctors(mv);
		mv.setViewName("PatientMain.jsp");
		return mv;
	}
	
	@RequestMapping("patientSelectOption")
	public ModelAndView patientSelectOption(@RequestParam("whichAppointments") String whichAppointments) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("whichAppointments", whichAppointments);
		PatientMainService.fetchAppointments(mv, whichAppointments);
		mv.setViewName("PatientMain.jsp");
		return mv;
	}
}
