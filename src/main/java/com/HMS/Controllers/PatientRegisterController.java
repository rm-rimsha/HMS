package com.HMS.Controllers;
//imports
import java.text.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.AppointmentService;
import com.HMS.Services.PatientRegisterService;

@Controller
public class PatientRegisterController {
	
	@RequestMapping(value="PatientRegister",method=RequestMethod.POST)
	
	public ModelAndView register(@RequestParam("fullname") String fullname,
			@RequestParam("gender") String gender,@RequestParam("date") String date,@RequestParam("username") String username,@RequestParam("email") String email,
			@RequestParam("password") String password ,@RequestParam("confirmpassword") String confirmpassword,
			@RequestParam("mobile") String mobile,@RequestParam("Address") String address) throws ParseException {
		
		
		ModelAndView mv=new ModelAndView();
		
		PatientRegisterService prs=new PatientRegisterService(fullname,gender,date,username,email,password,confirmpassword,mobile,address);
		
		if(prs.isEmpty()) {
			mv.setViewName("PatientRegister.jsp");
			mv.addObject("error3", "One or More required Fields are Empty!");
		}else if(prs.checkusername()) {
			mv.setViewName("PatientRegister.jsp");
			mv.addObject("error", "This username already exists!\nTry a new one!");
		}
		else if(!prs.checkpasslength()) {
			mv.setViewName("PatientRegister.jsp");
			mv.addObject("error1","Poor password.Length should be greater than 8!");
		}
		else if(!prs.checkpassword()) {
			mv.setViewName("PatientRegister.jsp");
			mv.addObject("error2", "password and confirm password should be same!");
		}else if(AppointmentController.module.equals("receptionist")) {
			prs.addData();
			mv.setViewName("appointment.jsp");
			mv.addObject("deptName",AppointmentService.getDepartments());
			mv.addObject("module", "receptionist");
			mv.addObject("patientId", PatientRegisterService.getPatientId(username));
			mv.addObject("patientName", fullname);
		}
		else {
			prs.addData();
			mv.setViewName("PatientLogin.jsp");
		}
		return mv;
	}
	

}
