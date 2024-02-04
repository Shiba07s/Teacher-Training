/**
 * 
 */
package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.DataTracking;
import com.TTSS03.Service.DataTrackingService;

/**
 * 
 */
@RestController
@RequestMapping("/api")
public class DataTrackingController {
	
	@Autowired
	DataTrackingService dataTrackingService;
	
	
	@PostMapping("/datatracking")
	public ResponseEntity<DataTracking>saveOneRecord(@RequestBody DataTracking dataTracking){
		
		DataTracking saveOne = dataTrackingService.saveOne(dataTracking);
		
		return ResponseEntity.ok(saveOne);
		
	}

}
