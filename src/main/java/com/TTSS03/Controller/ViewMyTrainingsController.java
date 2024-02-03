package com.TTSS03.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.NominateTrainings;
import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.Service.ViewMyTrainingsService;
import com.TTSS03.utill.NominateTrainingsDto;

@RestController
@RequestMapping("/api")
public class ViewMyTrainingsController {
	
	@Autowired
	ViewMyTrainingsService viewMyTrainingsService;
	
	
//	@PostMapping("/processData")
//    public ResponseEntity<List<ViewMyTrainings>> processData(@RequestParam String treasuryId) {
//		
//		List<ViewMyTrainings> savemyTrainings = viewMyTrainingsService.savemyTrainings(treasuryId);
//		
//        return ResponseEntity.ok(savemyTrainings);
//    }
	
	@GetMapping("/mytrainings")
	public ResponseEntity<List<ViewMyTrainings>> allMyTrainings(@RequestParam String treasuryId){
		List<ViewMyTrainings> mytrainings = viewMyTrainingsService.findByTreasuryId(treasuryId);
		return ResponseEntity.ok(mytrainings);
	}
	
	@GetMapping("/waiting-for-approval")
	 public ResponseEntity<List<Map<String, Object>>> getCustomData() {
	        List<Map<String, Object>> customData = viewMyTrainingsService.getCustomData();
	        return ResponseEntity.ok(customData);
	    }
	/*
	@GetMapping("/approved")
	public ResponseEntity<List<Map<String, Object>>> getApprovedDataList() {
		List<Map<String, Object>> approvedData = viewMyTrainingsService.getAppovedData();
		return ResponseEntity.ok(approvedData);
	}
	@GetMapping("/rejected")
	public ResponseEntity<List<Map<String, Object>>> getRejectedDataList() {
		List<Map<String, Object>> approvedData = viewMyTrainingsService.getRejectedData();
		return ResponseEntity.ok(approvedData);
	} */
	
	@PutMapping("/update-status")
    public ResponseEntity<String> updateStatusToApproved(@RequestParam String treasuryId,@RequestParam String refPlannerId) {
	 viewMyTrainingsService.updateStatusToApproved(treasuryId,refPlannerId);
        return new ResponseEntity<>("Status updated to 'approved' for treasuryId: " + treasuryId+','+refPlannerId, HttpStatus.OK);
    }
	@PutMapping("/reject-status")
	 public ResponseEntity<String> rejectStatusToApproved(@RequestParam String treasuryId,@RequestParam String refPlannerId) {
		 viewMyTrainingsService.rejectStatusToApproved(treasuryId,refPlannerId);
		 return new ResponseEntity<>("Status updated to 'reject' for treasuryId: " + treasuryId+','+refPlannerId, HttpStatus.OK);
	 }
	

	@GetMapping("/count-waiting-for-approval")
	public ResponseEntity<Long> countWaitingForApprovalTeachers() {
		long countWaitingForApproval = viewMyTrainingsService.countWaitingForApprovalUsersList();
		return new ResponseEntity<Long>(countWaitingForApproval, HttpStatus.OK);

	}

	@GetMapping("/count-approved")
	public ResponseEntity<Long> countApprovedTeachers() {
		long countApproved = viewMyTrainingsService.countApprovedUsersList();
		return new ResponseEntity<Long>(countApproved, HttpStatus.OK);

	}

	@GetMapping("/count-rejected")
	public ResponseEntity<Long> countRejectedTeachers() {
		long countRejected = viewMyTrainingsService.countRejectedUsersList();
		return new ResponseEntity<Long>(countRejected, HttpStatus.OK);

	}

	@PutMapping("/remarks")
	public ResponseEntity<String> updateStatusAndRemarks(@RequestParam String treasuryId, 
														@RequestParam String refPlannerIds,
														@RequestParam String remarks) {
		try {
			viewMyTrainingsService.updateStatusAndRemarks(treasuryId, refPlannerIds, remarks);
			return ResponseEntity.ok("Status and remarks updated successfully");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("Error updating status and remarks: " + e.getMessage());
		}
	}
	
	@PutMapping("/remarks-approval")
	public ResponseEntity<String> updateStatusAndRemarksForSecondLevelApproval(@RequestParam String treasuryId,
																				@RequestParam String refPlannerIds,
																				@RequestParam String secondlevelapproval) {
		try {
			viewMyTrainingsService.updateStatusAndRemarksForSecondLevelApproval(treasuryId, refPlannerIds, secondlevelapproval);
			return ResponseEntity.ok("Status and remarks updated successfully");
		} catch (Exception e) {
			return ResponseEntity.status(500).body("Error updating status and remarks: " + e.getMessage());
		}
	}
	
 
	
	@PostMapping("/localData")
    public ResponseEntity<String> storeData(@RequestBody List<NominateTrainingsDto> selectedRowsData) {
        try {
            viewMyTrainingsService.storeDataNominate(selectedRowsData);
            return ResponseEntity.ok("Data stored successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error storing data");
        }
    }
	

	@GetMapping("/self-attended")
	public ResponseEntity<List<Map<String, Object>>> getSelfAttendedTeachersList() {
		List<Map<String, Object>> selfAttended = viewMyTrainingsService.getSelfAttendedData();
		return ResponseEntity.ok(selfAttended);
	}
	
	@GetMapping("/nominated")
    public ResponseEntity<List<NominateTrainings>> getNominatedTrainings() {
          List<NominateTrainings> nominatedTrainings = viewMyTrainingsService.getNominatedTrainings();
		return new ResponseEntity<List<NominateTrainings>>(nominatedTrainings,HttpStatus.OK);
    }
	
	@GetMapping("/nominate/training")
	 public ResponseEntity<List<Map<String, Object>>> getNominateTeachersData() {
	        List<Map<String, Object>> nominateData = viewMyTrainingsService.getNominateTeacher();
	        return ResponseEntity.ok(nominateData);
	    }
	
	@GetMapping("/rejected-data")
    public ResponseEntity<List<Map<String, Object>>> getRejectedData() {
        List<Map<String, Object>> rejectedDataList = viewMyTrainingsService.findRejectedData();
        return ResponseEntity.ok(rejectedDataList);
    }
	
	@GetMapping("/approved-data")
	public ResponseEntity<List<Map<String, Object>>> getApprovedData() {
		List<Map<String, Object>> approvedDataList = viewMyTrainingsService.findApprovedDataTeacher();
		return ResponseEntity.ok(approvedDataList);
	}
	@GetMapping("/approvedData")
	public ResponseEntity<List<Map<String, Object>>> getApprovedDataTrainingVenueId(@RequestParam String trainingId,@RequestParam String venueId) {
		List<Map<String, Object>> approvedDataLists = viewMyTrainingsService.findApprovedDataTeacherTrainingVenueId(trainingId,venueId);
		return ResponseEntity.ok(approvedDataLists);
	}
	
//	@GetMapping("/approvedTeachers")
//	public ResponseEntity<List<Map<String, Object>>> getApprovedDataTrainingName(@RequestParam String tname) {
//		List<Map<String, Object>> approvedTeachers = viewMyTrainingsService.findApprovedDataTeacherTrainingName(tname);
//		return ResponseEntity.ok(approvedTeachers);
//	}
	
//	@PostMapping("/processData1234")
//	public ResponseEntity<List<ViewMyTrainings>> processData123456(@RequestParam String treasuryId, @RequestParam String ref_planner_id, @RequestParam long venueid, @RequestParam String vcapacity) {
//	    List<ViewMyTrainings> savemyTrainings1234 = viewMyTrainingsService.savemyTrainingsxyz(treasuryId, ref_planner_id, venueid, vcapacity);
//
//	    return ResponseEntity.ok(savemyTrainings1234);
//	}

	
//	@PostMapping("/processData1234")
//	public ResponseEntity<List<ViewMyTrainings>> processData123456(
//	        @RequestParam String treasuryId,
//	        @RequestParam String ref_planner_id,
//	        @RequestParam long venueid,
//	        @RequestParam String vcapacity
//	) {
//	    List<ViewMyTrainings> savedTrainings = viewMyTrainingsService.savemyTrainingsxyz(treasuryId, ref_planner_id, venueid,vcapacity);
//	    
//	    // Check if any trainings were saved
//	    if (savedTrainings.isEmpty()) {
//	        // Venue capacity exceeded, return an appropriate response
//	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
//	    }
//
//	    return ResponseEntity.ok(savedTrainings);
//	}


	@PostMapping("/processData1234")
    public ResponseEntity<List<ViewMyTrainings>> processData123456(@RequestParam String treasuryId,@RequestParam String ref_planner_id,@RequestParam long venueid) {
		List<ViewMyTrainings> savemyTrainings1234 = viewMyTrainingsService.savemyTrainingsxyz(treasuryId, ref_planner_id, venueid);
		
        return ResponseEntity.ok(savemyTrainings1234);
    }
	
	@GetMapping("/HaveAnyTrainings")
	public ResponseEntity<List<ViewMyTrainings>>CheckAppliedTrainings(@RequestParam String treasuryId,@RequestParam String ref_planner_id ){
		
		List<ViewMyTrainings> trainings = viewMyTrainingsService.checkIfAlreadyAppliedTrainings(treasuryId, ref_planner_id);
	return ResponseEntity.ok(trainings);
	}
	
//	 @GetMapping("/countVenueOnTrainings")
//	    public int countAppliedTrainings(
//	            @RequestParam String refPlannerId,
//	            @RequestParam long venueId
//	    ) {
//	        return viewMyTrainingsService.countAppliedTrainings(refPlannerId, venueId);
//	    }
	
//	@GetMapping("/HaveAnyTrainings")
//	public ResponseEntity<List<ViewMyTrainings>> checkAppliedTrainings(
//	        @RequestParam String treasuryId,
//	        @RequestParam String ref_planner_id
//	) {
//	    List<ViewMyTrainings> trainings = viewMyTrainingsService.checkIfAlreadyAppliedTrainings(treasuryId, ref_planner_id);
//	    return ResponseEntity.ok(trainings);
//	}

}


