package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.ReceptionistChangePasswordService;
import com.HMS.Services.ReceptionistLoginService;

@Controller
public class ReceptionistChangePasswordController {
	@RequestMapping("receptionistChange")
	public ModelAndView change(@RequestParam("currentPassword") String currentPassword, 
								@RequestParam("newPassword") String newPassword, 
								@RequestParam("confirmPassword") String confirmPassword) {
		ModelAndView mv = new ModelAndView();
		ReceptionistChangePasswordService rcps = new ReceptionistChangePasswordService(currentPassword, newPassword, confirmPassword);
		if(rcps.requiredFieldsEmpty()) {
			mv.setViewName("ReceptionistChangePassword.jsp");
			mv.addObject("error", "Required Fields are Empty!");
		}else if (! rcps.checkPassword()) {
			mv.setViewName("ReceptionistChangePassword.jsp");
			mv.addObject("error", "Incorrect Password!");
		}else if(! rcps.passwordMatch()) {
			mv.setViewName("ReceptionistChangePassword.jsp");
			mv.addObject("error", "Passwords do not match!");
		}else if(! rcps.checkLength()) {
			mv.setViewName("ReceptionistChangePassword.jsp");
			mv.addObject("error", "Password must be atleast 8 characters long!");
		}else {
			rcps.setPassword();
			mv.addObject("receptionistUsername", ReceptionistLoginController.receptionistUsername);
			mv.setViewName("ReceptionistMain.jsp");
			ReceptionistLoginService.fetchAppointments(mv, "", "");
			ReceptionistLoginService.fetchDoctors(mv);
		}
		return mv;
	}
}
