package com.HMS.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.HMS.Services.DoctorLoginService;
import com.HMS.Services.DoctorMainService;
import com.HMS.Services.DoctorViewPatientDetailsService;

@Controller 
public class DoctorViewPatientDetailsController {
	public static String nextScreen;
	
	@RequestMapping("doctorSavePatientDetails")
	public ModelAndView savePatientDetails(@RequestParam("height") double height, 
				@RequestParam("weight") double weight, @RequestParam("bloodGroup") String bloodGroup, @RequestParam("maritalStatus") String maritalStatus, 
				@RequestParam("drugAllergies") String drugAllergies, @RequestParam("diseasesData") String diseasesData,
				@RequestParam("otherIllnesses") String otherIllnesses, @RequestParam("operations") String operations,
				@RequestParam("currentMedications") String currentMedications, @RequestParam("exercise") String exercise,
				@RequestParam("diet") String diet, @RequestParam("alcoholConsumption") String alcoholConsumption,
				@RequestParam("caffeineConsumption") String caffeineConsumption, @RequestParam("smoking") String smoking,
				@RequestParam("investigationHistory") String investigationHistory, @RequestParam("otherComments") String otherComments) {
		ModelAndView mv = new ModelAndView();
		String[] diseasesDataParts = diseasesData.split("_");
		int patientId = Integer.parseInt(diseasesDataParts[0]);
		String diseases = diseasesDataParts[1];
		DoctorViewPatientDetailsService dvpds = new DoctorViewPatientDetailsService(patientId);
		dvpds.saveDetails(patientId, bloodGroup, height, weight, maritalStatus, drugAllergies, diseases, otherIllnesses, operations, currentMedications, 
				exercise, diet, alcoholConsumption, caffeineConsumption, smoking, investigationHistory, otherComments);
		mv.addObject("doctorId", DoctorLoginController.doctorId);
		if (nextScreen.equals("DoctorMain")) {
			DoctorLoginService.fetchAppointments(mv);
		} else {
			DoctorMainService.fetchPatients(mv);
		}
		mv.setViewName("DoctorMain.jsp");
		return mv;
	}
}
