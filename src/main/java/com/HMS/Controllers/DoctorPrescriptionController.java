package com.HMS.Controllers;

import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.DoctorLoginService;
import com.HMS.Services.DoctorMainService;
import com.HMS.Services.DoctorPrescriptionService;

@Controller
public class DoctorPrescriptionController {
	public static String nextScreen;

	@RequestMapping("doctorSavePrescription")
	public ModelAndView savePrescription(@RequestParam("patientId") int patientId,
			@RequestParam("prescription") String prescription) {
		ModelAndView mv = new ModelAndView();
		DoctorPrescriptionService dps = new DoctorPrescriptionService(patientId, prescription);
		dps.savePrescription();
		mv.addObject("doctorId", DoctorLoginController.doctorId);
		if (nextScreen.equals("DoctorMain")) {
			DoctorLoginService.fetchAppointments(mv);
		} else {
			DoctorMainService.fetchPatients(mv);
		}
		mv.setViewName("DoctorMain.jsp");
		return mv;
	}

	@RequestMapping("doctorPrintPrescription")
	public ModelAndView printPrescription(@RequestParam("patientId") int patientId,
			@RequestParam("prescription") String prescription) {
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		mv.addObject("date", formatter.format(date));
		mv.addObject("prescription", prescription);
		mv.addObject("patientId", patientId);
		DoctorPrescriptionService dps = new DoctorPrescriptionService(patientId, prescription);
		dps.savePrescription();
		mv.setViewName("DoctorPrescription.jsp");
		return mv;
	}
}
