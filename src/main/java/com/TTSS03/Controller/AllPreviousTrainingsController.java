/**
 * 
 */
package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.AllPreviousTrainings;
import com.TTSS03.Service.AllPreviousTrainingsService;

/**
 * 
 */

@RestController
@RequestMapping("/api")
public class AllPreviousTrainingsController {
	
	@Autowired
	AllPreviousTrainingsService allPreviousTrainingsService;
	
	
	@GetMapping("/previousTrainings")
	
	public ResponseEntity<List<AllPreviousTrainings>>findAllPreviousTrainings(){
		List<AllPreviousTrainings> allPrevioustrainings = allPreviousTrainingsService.allPrevioustrainings();
		
		return ResponseEntity.ok(allPrevioustrainings);
	}

}
