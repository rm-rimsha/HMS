package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.DoctorLoginService;

@Controller
public class DoctorLoginController {
	public static int doctorId;
	
	@RequestMapping("doctorLogin")
	public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		DoctorLoginService dls = new DoctorLoginService(username, password);
		if(dls.isEmpty()) {
			mv.setViewName("DoctorLogin.jsp");
			mv.addObject("error", "Required Fields are Empty!");
		}else if(! dls.check()) {
			mv.setViewName("DoctorLogin.jsp");
			mv.addObject("error", "Invalid username or password!");
		}else {
			mv.setViewName("DoctorMain.jsp");
			mv.addObject("doctorId",doctorId);
			DoctorLoginService.fetchAppointments(mv);
		}
		return mv;
	}
}
