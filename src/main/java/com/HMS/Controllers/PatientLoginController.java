package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientLoginService;
import com.HMS.Services.PatientMainService;

@Controller
public class PatientLoginController {
	public static int patientId = 0;
	
	@RequestMapping("Patientlogin" )
	public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		PatientLoginService pls = new PatientLoginService(username, password);
		if(pls.isEmpty()) {
			mv.setViewName("PatientLogin.jsp");
			mv.addObject("error", "Required Fields are Empty!");
		}else if(! pls.check()) {
			mv.setViewName("PatientLogin.jsp");
			mv.addObject("error", "Invalid username or password!");
		}else {
			mv.setViewName("PatientMain.jsp");
			mv.addObject("patientId",patientId);
			AppointmentController.module = "patient";
			PatientMainService.fetchAppointments(mv,"");
		}
		return mv;
	}
}