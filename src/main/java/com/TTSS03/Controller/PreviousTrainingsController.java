package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.PreviousTrainings;
import com.TTSS03.Service.PreviousTrainingsService;

@RestController
@RequestMapping("/api")
public class PreviousTrainingsController {
	
	@Autowired
	PreviousTrainingsService previousTrainingsService;
	
	
	@PostMapping("/save/previoustrainings")
	public ResponseEntity<PreviousTrainings>savePreviousTrainings(@RequestBody List<PreviousTrainings> previousTrainings){
		PreviousTrainings saveonetraining = previousTrainingsService.saveonetraining(previousTrainings);
		return ResponseEntity.ok(saveonetraining);
	}
	
	 @GetMapping("/training/previous")
		public ResponseEntity<List<PreviousTrainings>> getPreviousTrainingDetails(@RequestParam String treasuryId){
			List<PreviousTrainings> allPreviousData = previousTrainingsService.getAllPreviousData(treasuryId);
			return new ResponseEntity<List<PreviousTrainings>>(allPreviousData,HttpStatus.OK);
			
		}
	 
	 
}
