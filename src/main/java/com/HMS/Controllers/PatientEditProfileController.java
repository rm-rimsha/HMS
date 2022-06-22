package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientEditProfileService;
import com.HMS.Services.PatientMainService;

@Controller
public class PatientEditProfileController {
	
	@RequestMapping("main")
	public ModelAndView redirect() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv,"");
		return mv;
	}
	
	@RequestMapping("editprofile")
	public ModelAndView edit(@RequestParam("editemail") String email,@RequestParam("editNumber") String number,@RequestParam("editaddress") String address) {
		ModelAndView mv=new ModelAndView();		
		PatientEditProfileService peps=new PatientEditProfileService(email,number,address);
		if(peps.isEmpty()) {
			mv.setViewName("EditPatientProfile.jsp");
			mv.addObject("error","Required fields are empty");
		}
		else {
			peps.editData();
			mv.setViewName("EditPatientProfile.jsp");
			mv.addObject("error","Successfully edited!");
		}
		
		return mv;
	}

}
