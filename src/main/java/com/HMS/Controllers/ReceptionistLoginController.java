package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.HMS.Services.ReceptionistLoginService;

@Controller
public class ReceptionistLoginController {
	public static String receptionistUsername;
	
	@RequestMapping("receptionistLogin")
	public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password) {
		ModelAndView mv = new ModelAndView();
		ReceptionistLoginService rls = new ReceptionistLoginService(username, password);
		if(rls.isEmpty()) {
			mv.setViewName("ReceptionistLogin.jsp");
			mv.addObject("error", "Required Fields are Empty!");
		}else if(! rls.check()) {
			mv.setViewName("ReceptionistLogin.jsp");
			mv.addObject("error", "Invalid username or password!");
		}else {
			AppointmentController.module = "receptionist";
			mv.setViewName("ReceptionistMain.jsp");
			ReceptionistLoginService.fetchAppointments(mv, "", "");
			ReceptionistLoginService.fetchDoctors(mv);
		}
		return mv;
	}
	@RequestMapping("receptionistHome")
	public ModelAndView receptionistHome() {
		ModelAndView mv = new ModelAndView();
		AppointmentController.module = "receptionist";
		mv.setViewName("ReceptionistMain.jsp");
		ReceptionistLoginService.fetchAppointments(mv, "", "");
		ReceptionistLoginService.fetchDoctors(mv);
		return mv;
	}
}
