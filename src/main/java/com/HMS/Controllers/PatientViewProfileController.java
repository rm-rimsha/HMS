package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientMainService;
@Controller
public class PatientViewProfileController {
	@RequestMapping("home")
	public ModelAndView redirect() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv,"");
		return mv;
	}
	

}
