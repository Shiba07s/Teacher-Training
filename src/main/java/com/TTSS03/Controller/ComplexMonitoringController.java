/**
 * 
 */
package com.TTSS03.Controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.TTSS03.Entity.ComplexMonitoring;
import com.TTSS03.Service.ComplexMonitoringService;

/**
 * 
 */

@RestController
@RequestMapping("/api")
public class ComplexMonitoringController {
	
	@Autowired
	ComplexMonitoringService complexMonitoringService;
	
	@PostMapping("/complexmonitoring")
	public ResponseEntity<ComplexMonitoring> saveOneRecord(@ModelAttribute ComplexMonitoring complexMonitoring,
	                                                     @RequestParam("imageFile") MultipartFile imageFile) {
	    try {
	        byte[] imageData = imageFile.getBytes();
	        complexMonitoring.setUploadimage(imageData);
	    } catch (IOException e) {
	        e.printStackTrace();
	        // Handle the exception
	    }

	    ComplexMonitoring saveOne = complexMonitoringService.saveOne(complexMonitoring);

	    return ResponseEntity.ok(saveOne);
	}
	
	

}
