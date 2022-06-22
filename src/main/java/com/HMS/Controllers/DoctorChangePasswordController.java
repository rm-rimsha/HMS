package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.DoctorChangePasswordService;
import com.HMS.Services.DoctorLoginService;

@Controller
public class DoctorChangePasswordController {
	@RequestMapping("doctorChange")
	public ModelAndView change(@RequestParam("currentPassword") String currentPassword, 
								@RequestParam("newPassword") String newPassword, 
								@RequestParam("confirmPassword") String confirmPassword) {
		ModelAndView mv = new ModelAndView();
		DoctorChangePasswordService dcps = new DoctorChangePasswordService(currentPassword, newPassword, confirmPassword);
		if(dcps.requiredFieldsEmpty()) {
			mv.setViewName("DoctorChangePassword.jsp");
			mv.addObject("error", "Required Fields are Empty!");
		}else if (! dcps.checkPassword()) {
			mv.setViewName("DoctorChangePassword.jsp");
			mv.addObject("error", "Incorrect Password!");
		}else if(! dcps.passwordMatch()) {
			mv.setViewName("DoctorChangePassword.jsp");
			mv.addObject("error", "Passwords do not match!");
		}else if(! dcps.checkLength()) {
			mv.setViewName("DoctorChangePassword.jsp");
			mv.addObject("error", "Password must be atleast 8 characters long!");
		}else {
			dcps.setPassword();
			mv.addObject("doctorId", DoctorLoginController.doctorId);
			DoctorLoginService.fetchAppointments(mv);
			mv.setViewName("DoctorMain.jsp");
		}
		return mv;
	}
}
