package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.AgencyMaster;
import com.TTSS03.Service.AgencyMasterService;

@RestController
@RequestMapping("/api")
public class AgencyMasterController {
	
	@Autowired
	AgencyMasterService agencyMasterService;
	
	
	@GetMapping("/agency")
	public ResponseEntity<List<AgencyMaster>>findAllAgency(){
		List<AgencyMaster> allAgency = agencyMasterService.getAllAgency();
		return ResponseEntity.ok(allAgency);
		
	}
	@GetMapping("/agency/getbyid/{slno}")
	public ResponseEntity<AgencyMaster> findAgency(@PathVariable("slno") int slno) {
		AgencyMaster agency = agencyMasterService.findAgency(slno);
		return ResponseEntity.ok(agency);
	}

	@PostMapping("/agency/create")
	public ResponseEntity<AgencyMaster> createOneTrainingAgency(@RequestBody AgencyMaster agencyMaster) {
		AgencyMaster saveOneTrainingAgency = agencyMasterService.saveAgency(agencyMaster);
		return ResponseEntity.ok(saveOneTrainingAgency);

	}

	@PutMapping("/agency/update/{slno}")
	public ResponseEntity<String> update(@PathVariable("slno") int slno, @RequestParam("agency") String agency) {

		try {
			System.out.println(slno + " " + agency);
			agencyMasterService.updateAgency(slno, agency);
			return ResponseEntity.ok("Training category updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating training category: " + e.getMessage());
		}
	}

	@DeleteMapping("/agency/delete/{slno}")
	public ResponseEntity<String> deActivateCategory(@PathVariable("slno") int slno) {

		try {
			agencyMasterService.deActivateTrainingCategory(slno);
			return ResponseEntity.ok("Training Deleted Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deacivating training category:" + e.getMessage());
		}

	}


}
