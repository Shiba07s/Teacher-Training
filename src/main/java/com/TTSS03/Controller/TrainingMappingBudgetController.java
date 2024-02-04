package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Entity.TrainingMappingBudget;
import com.TTSS03.Service.TrainingMappingBudgetService;

@RestController
@RequestMapping("/api/mapping")
public class TrainingMappingBudgetController {
	
	@Autowired
	private TrainingMappingBudgetService trainingMappingBudgetService;
	
	@GetMapping("/budget")
	public ResponseEntity<List<TrainingMappingBudget>> getAllMappingDataList(){
		List<TrainingMappingBudget> allMappingData = trainingMappingBudgetService.getAllMappingData();
		return new ResponseEntity<List<TrainingMappingBudget>>(allMappingData,HttpStatus.OK);
	}
	 @GetMapping("/distinct")
	    public List<TrainingMappingBudget> getDistinctTrainingTransactions() {
	        return trainingMappingBudgetService.findDistinctTrainingTransactions();
	    }
	 @GetMapping("/getdata")
	    public ResponseEntity<List<TrainingMappingBudget>> getMappingData(
	            @RequestParam("trainingid") String trainingid,
	            @RequestParam("venueid") String venueid) {
	        List<TrainingMappingBudget> result = trainingMappingBudgetService.getMappingDataOnTrainingidAndVenueid(trainingid, venueid);
	        return new ResponseEntity<>(result, HttpStatus.OK);
	    }
	 

	     

	 @PostMapping("/updateMapping/{trainingId}/{venueId}")
	    public ResponseEntity<String> updateTrainingMapping(
	            @PathVariable String trainingId,
	            @PathVariable String venueId,
	            @RequestBody List<TrainingMappingBudget> updatedMappings) {

	        try {
	            trainingMappingBudgetService.updateSingleMapping(trainingId, venueId, updatedMappings);
	            return new ResponseEntity<>("Training mappings updated successfully!", HttpStatus.OK);
	        } catch (Exception e) {
	            return new ResponseEntity<>("Failed to update training mappings: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	 
	 @PostMapping("/status/{trainingId}/{venueId}")
	 public ResponseEntity<String> updateTrainingstatus(
	            @PathVariable String trainingId,
	            @PathVariable String venueId){
					
		 try {
	            trainingMappingBudgetService.updatestatus(trainingId, venueId);
	            return new ResponseEntity<>("Training status updated successfully!", HttpStatus.OK);
	        } catch (Exception e) {
	            return new ResponseEntity<>("Failed to update training status: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	        }

	 }
	 
	 @GetMapping("/search/data")
	    public ResponseEntity<List<TrainingMappingBudget>>findMappingData(@RequestParam long mid){
			List<TrainingMappingBudget> venue = trainingMappingBudgetService.findByMappingId(mid);
			return  ResponseEntity.ok(venue);
			
		}
	 
//	 @PostMapping("/approve/{trainingId}/{venueId}")
//	    public ResponseEntity<String> approveTraining(
//	            @PathVariable String trainingId,
//	            @PathVariable String venueId,
//	            @RequestBody TrainingMappingBudget trainingMappingBudget) {
//
//	        try {
//	            trainingMappingBudgetService.updaterecordstatusSecondlevel(trainingId, venueId, trainingMappingBudget);
//	            return ResponseEntity.ok("Training record status updated successfully!");
//	        } catch (Exception e) {
//	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update training record status");
//	        }
//	    }
//	 
	 
	 @PostMapping("/approve/{trainingId}/{venueId}")
	    public ResponseEntity<String> approveTraining(
	            @PathVariable String trainingId,
	            @PathVariable String venueId,
	            @RequestBody List<TrainingMappingBudget> updatedMappingss) {

	        try {
	            trainingMappingBudgetService.updaterecordstatusSecondlevel(trainingId, venueId, updatedMappingss);
	            return ResponseEntity.ok("Training record status updated successfully!");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update training record status");
	        }
	    }
	 
	 @PutMapping("/updatebyid/{mid}")
	 public ResponseEntity<String> updateBudgetMapping(
	         @PathVariable("mid") long mid,
	         @RequestBody TrainingMappingBudget trainingMappingBudget) {
	     try {
	         trainingMappingBudgetService.updateTrainingMappingBudgetByid(mid, trainingMappingBudget);
	         return ResponseEntity.ok("Budget Mapping updated successfully.");
	     } catch (Exception e) {
	         return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
	                 .body("Error updating Budget Mapping: " + e.getMessage());
	     }
	    }
		
	 
		
}
