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

import com.TTSS03.Entity.TrainingCategoryMaster;
import com.TTSS03.Service.TrainingCategoryMasterService;

@RestController
@RequestMapping("/api")
public class TrainingCategoryController {
	
	@Autowired
	TrainingCategoryMasterService trainingCategoryMasterService;
	
	
	@GetMapping("/category")
	public ResponseEntity<List<TrainingCategoryMaster>>findAllCategory(){
		List<TrainingCategoryMaster> allcategory = trainingCategoryMasterService.getAllcategory();
		return ResponseEntity.ok(allcategory);
	}
	
	@PostMapping("/addCategory")
	public ResponseEntity<TrainingCategoryMaster>addOnecategory(@RequestBody TrainingCategoryMaster TrainingCategory){
		TrainingCategoryMaster saveOneCategory = trainingCategoryMasterService.saveOneCategory(TrainingCategory);
		return ResponseEntity.ok(saveOneCategory);
	}
	
	@PutMapping("/updateTrainingCategory/{uid}")
    public ResponseEntity<String> updateTrainingCategory(
            @PathVariable("uid") long uid,
            @RequestParam("trainingcategory") String trainingcategory) {

        try {
        	trainingCategoryMasterService.updateTrainingCategory(uid, trainingcategory);
            return ResponseEntity.ok("Training category updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error updating training category: " + e.getMessage());
        }
    }
	
	@DeleteMapping("/delete/{uid}")
	public ResponseEntity<String>deActivateCategory(@PathVariable long uid){
		
		try {
			trainingCategoryMasterService.deActivateTrainingCategory(uid);
			return ResponseEntity.ok("Training De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating training category:"+e.getMessage());
		}
		
	}

}
