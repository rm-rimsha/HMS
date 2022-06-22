package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.DoctorForgotPasswordService;

@Controller
public class DoctorForgotPasswordController {
	
	@RequestMapping("doctorForgotPassword")
	public ModelAndView forgotPassword(@RequestParam("username") String username, @RequestParam("email") String email) {
		ModelAndView mv = new ModelAndView ();
		DoctorForgotPasswordService dfps = new DoctorForgotPasswordService(username, email);
		if(dfps.isEmpty()) {
			mv.addObject("error", "Required Fields are Empty!");
			mv.setViewName("DoctorForgotPassword.jsp");
		}else if(! dfps.check()) {
			mv.addObject("error", "Incorrect username or email !");
			mv.setViewName("DoctorForgotPassword.jsp");
		}else {
			dfps.changePassword();
			mv.addObject("viewName", "DoctorLogin.jsp");
			mv.setViewName("EmailAlert.jsp");
		}
		return mv;
	}
}
