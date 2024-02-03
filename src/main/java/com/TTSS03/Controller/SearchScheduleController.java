package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.SearchSchedule;
import com.TTSS03.Service.SearchScheduleService;

@RestController
@RequestMapping("/api")
public class SearchScheduleController {
	@Autowired
	SearchScheduleService searchScheduleService;
	
	
	@GetMapping("/search/schedule")
	public ResponseEntity<List<SearchSchedule>>getTrainingByRefId(@RequestParam String ref_planner_id){
		
		List<SearchSchedule> result = searchScheduleService.findByReferencrId(ref_planner_id);
		
		return ResponseEntity.ok(result);
	}
	
	@PostMapping("/saveT")
	public ResponseEntity<SearchSchedule>saveSchedule(@RequestBody SearchSchedule SearchSchedule){
		com.TTSS03.Entity.SearchSchedule saveone = searchScheduleService.saveone(SearchSchedule);
		return ResponseEntity.ok(saveone);
	}

}
