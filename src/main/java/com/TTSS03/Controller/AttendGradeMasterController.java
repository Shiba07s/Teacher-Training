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

import com.TTSS03.Entity.AttendGradeMaster;
import com.TTSS03.Service.AttendGradeService;

@RestController
@RequestMapping("/api")
public class AttendGradeMasterController {
	
	@Autowired
	AttendGradeService attendGradeService;
	
	
	@GetMapping("/attendGrade")
	public ResponseEntity<List<AttendGradeMaster>>findAllGrade(){
		List<AttendGradeMaster> allGrade = attendGradeService.getAllGrade();
		return ResponseEntity.ok(allGrade);
		
	}
	
	@PostMapping("/grade/create")
	public ResponseEntity<AttendGradeMaster> createNewMasterGrade(@RequestBody AttendGradeMaster attendGradeMaster){
		AttendGradeMaster createNewGrade = attendGradeService.createNewGrade(attendGradeMaster);
		return new ResponseEntity<AttendGradeMaster>(createNewGrade,HttpStatus.OK);
		
	}
//	  @PostMapping("/deactivateGrade/{id}")
//	    public ResponseEntity<String> deactivateGrade(@PathVariable long id) {
//	        attendGradeService.deactivateGrade(id);
//	        return ResponseEntity.ok("Grade deactivated successfully");
//	    }
	  
	  @PutMapping("/updateTrainingGrade/{gradeId}")
	    public ResponseEntity<String> updateTrainingSpell(
	            @PathVariable("gradeId") long gradeId,
	            @RequestParam("attendgrade") String attendgrade) {
	 
	        try {
	        	attendGradeService.updateTrainingGrade(gradeId, attendgrade);
	            return ResponseEntity.ok("Training Grade updated successfully.");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                    .body("Error updating training Grade: " + e.getMessage());
	        }
	    }
		
		@DeleteMapping("/deleteGrade/{gradeId}")
		public ResponseEntity<String>deActivateSpell(@PathVariable long gradeId){
			
			try {
				attendGradeService.deActivateTrainingGrade(gradeId);
				return ResponseEntity.ok("Training Grade De-Activated Successfully.");
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating training Grade:"+e.getMessage());
			}
			
		}



}
