package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.HMS.Services.ReceptionistForgotPasswordService;

@Controller
public class ReceptionistForgotPasswordController {
	
	@RequestMapping("receptionistForgotPassword")
	public ModelAndView forgotPassword(@RequestParam("username") String username, @RequestParam("email") String email) {
		ModelAndView mv = new ModelAndView ();
		ReceptionistForgotPasswordService rfps = new ReceptionistForgotPasswordService(username, email);
		if(rfps.isEmpty()) {
			mv.addObject("error", "Required Fields are Empty!");
			mv.setViewName("ReceptionistForgotPassword.jsp");
		}else if(! rfps.check()) {
			mv.addObject("error", "Incorrect username or email !");
			mv.setViewName("ReceptionistForgotPassword.jsp");
		}else {
			rfps.changePassword();
			mv.addObject("viewName", "ReceptionistLogin.jsp");
			mv.setViewName("EmailAlert.jsp");
		}
		return mv;
	}
}
