package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientChangePasswordService;
import com.HMS.Services.PatientMainService;

@Controller
public class PatientChangePasswordController {
	
	@RequestMapping("mp")
	public ModelAndView home() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv,"");
		return mv;
	}
	
	@RequestMapping("ChangePassword")
	public ModelAndView setpass(@RequestParam("currentpass") String currentpass,
			@RequestParam ("newpass") String newpass ,@RequestParam("confirmpass") String confirmpass) {
		ModelAndView mv=new ModelAndView();
		PatientChangePasswordService pcps=new PatientChangePasswordService(currentpass,newpass,confirmpass);
		
		
		if(pcps.isEmpty()) {
			mv.setViewName("PatientChangePassword.jsp");
			mv.addObject("error","One or More Required fields are empty!");
		}
		
		else if(!pcps.Check()) {
			mv.setViewName("PatientChangePassword.jsp");
			mv.addObject("error","Current password is incorrect!");
		}
		else if(!pcps.passlength()) {
			mv.setViewName("PatientChangePassword.jsp");
			mv.addObject("error","Password must be 8 characters long!");
		}
		else if(!pcps.validatepass()) {
			mv.setViewName("PatientChangePassword.jsp");
			mv.addObject("error","Passwords doesnot match!");
		}
		else {
			pcps.changepass();
		    mv.addObject("patientId", PatientLoginController.patientId);
		    mv.setViewName("PatientMain.jsp");
		    PatientMainService.fetchAppointments(mv,"");
			
		}
			
			
		
		
		return mv;
		
	}
	
	

}
