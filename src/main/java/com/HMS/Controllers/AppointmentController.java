package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.PatientMainService;
import com.HMS.Services.AppointmentService;

@Controller
public class AppointmentController {
	public static String module = "";
	
	@RequestMapping("MainScreen")
	public ModelAndView redirect() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("PatientMain.jsp");
		PatientMainService.fetchAppointments(mv,"");
		return mv;
	}
	
	@RequestMapping("departmentName")
	public ModelAndView deptName(@RequestParam ("dptn") String deptName, @RequestParam("patientId") String pid,
			@RequestParam("patientName") String patientName) {
		ModelAndView mv=new ModelAndView();
		AppointmentService as=new AppointmentService(deptName);
		as.fetchDoctors(mv);
		mv.setViewName("appointment.jsp");
		if(AppointmentController.module.equals("receptionist")) {
			mv.addObject("module", "receptionist");
			if(!pid.equals("")) {
				mv.addObject("patientId", Integer.parseInt(pid));
			}
			mv.addObject("patientName", patientName);
		}
		mv.addObject("dname",deptName);
		mv.addObject("deptName",AppointmentService.getDepartments());
		return mv;
		
	}
	
	@RequestMapping("getappointment")
	public ModelAndView appointment(@RequestParam ("doctorId") int doctorId) {
		ModelAndView mv = new ModelAndView();
		AppointmentService as=new AppointmentService(doctorId);
		mv.setViewName("setTime.jsp");
		mv.addObject("doctorId",doctorId);
		AppointmentService.setTime(mv, "", "", "");
		return mv;
	}
	
	@RequestMapping("receptionistGetAppointment")
	public ModelAndView receptionistGetAppointment(@RequestParam("doctorId") int doctorId, @RequestParam("patientId") String pid,
													@RequestParam("patientName") String patientName) {
		ModelAndView mv = new ModelAndView();
		int patientId;
		if(pid.equals("")) { 
			patientId = 0;
		}else {
			patientId = Integer.parseInt(pid);
		}
		if(AppointmentService.isValid(patientId, patientName)) {
			PatientLoginController.patientId = patientId;
			AppointmentService as=new AppointmentService(doctorId);
			if(AppointmentController.module.equals("receptionist")) {
				mv.addObject("module", "receptionist");
			}
			mv.setViewName("setTime.jsp");
			mv.addObject("doctorId",doctorId);
			AppointmentService.setTime(mv, "", "", "");
			
			  }else {
				  mv.setViewName("appointment.jsp"); 
				  mv.addObject("module","receptionist");
				  mv.addObject("deptName",AppointmentService.getDepartments());
				  mv.addObject("error", "Invalid input!"); 
			  }
			 
		return mv;
	}
	
	@RequestMapping("dateChanged")
	public ModelAndView dateChanged(@RequestParam("selectedDate") String selectedDate, @RequestParam("dateSelectedId") String dateSelectId,
									@RequestParam("doctorId") int doctorId, @RequestParam("timings") String timings, 
									@RequestParam("timeSelectedId") String timeSelectId) {
		ModelAndView mv = new ModelAndView();
		AppointmentService as=new AppointmentService(doctorId);
		if(AppointmentController.module.equals("receptionist")) {
			mv.addObject("module", "receptionist");
		}
		mv.setViewName("setTime.jsp");
		mv.addObject("doctorId",doctorId);
		AppointmentService.setTime(mv, selectedDate, dateSelectId, timeSelectId);
		as.getChangedTimings(mv, selectedDate, timings, doctorId);
		return mv;
	}
	
	@RequestMapping("receptionistDepartmentName")
	public ModelAndView receptionistDepartmentName(@RequestParam ("dptn") String deptName, @RequestParam("patientId") int patientId) {
		ModelAndView mv=new ModelAndView();
		AppointmentService as=new AppointmentService(deptName);
		as.fetchDoctors(mv);
		mv.setViewName("appointment.jsp");
		mv.addObject("dname",deptName);
		mv.addObject("deptName",AppointmentService.getDepartments());
		PatientLoginController.patientId = patientId;
		return mv;
	}

}
