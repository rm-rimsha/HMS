package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientForgotPasswordService;

@Controller
public class PatientForgotPasswordController {
	
	@RequestMapping("patientForgotPassword")
	public ModelAndView forgotPassword(@RequestParam("username") String username, @RequestParam("email") String email) {
		ModelAndView mv = new ModelAndView ();
		PatientForgotPasswordService pfps = new PatientForgotPasswordService(username, email);
		if(pfps.isEmpty()) {
			mv.addObject("error", "Required Fields are Empty!");
			mv.setViewName("PatientForgotPassword.jsp");
		}else if(! pfps.check()) {
			mv.addObject("error", "Incorrect username or email !");
			mv.setViewName("PatientForgotPassword.jsp");
		}else {
			pfps.changePassword();
			mv.setViewName("PatientMailChangePassword.jsp");
		}
		return mv;
	}
}
