package com.TTSS03.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TraineeController {
	
	
	@RequestMapping("/trainee")
	public String traineeMenu() {
		return "mainFrameTrainee";
	}
	
	@RequestMapping("/apply")
	public String traineeSide() {
		return "TraineeNotification";
	}
	
	
	@RequestMapping("/application-form")
	public String getApplicationForm() {
		return "TraineeApply";
	}

}
