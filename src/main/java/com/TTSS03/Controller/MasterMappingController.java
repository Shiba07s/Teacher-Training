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

import com.TTSS03.Entity.MasterMapping;
import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Service.MasterMappingService;

@RestController
@RequestMapping("/api")
public class MasterMappingController {
	
	
	@Autowired
	MasterMappingService MasterMappingServ;
	
	
	@PostMapping("/saveOrUpdate")
	public ResponseEntity<String> saveOrUpdateMasterMapping(@RequestBody MasterMapping masterMapping,
	                                                       @RequestParam String type) {
		MasterMappingServ.saveOrUpdateEntity(masterMapping, type);
	    return ResponseEntity.ok("Saved or updated successfully.");
	}
	
	@GetMapping("/training/mapped")
	public ResponseEntity<List<MasterMapping>> findMappedTrainingById(@RequestParam long trainingid,@RequestParam String venueid) {
	    List<MasterMapping> findAllMappedtrainingsBhyId = MasterMappingServ.findAllMappedtrainingsBhyId(trainingid,venueid);

	    if (findAllMappedtrainingsBhyId == null || findAllMappedtrainingsBhyId.isEmpty()) {
	        // If no mapped trainings found, return 404 Not Found
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    } else {
	        // If mapped trainings found, return 200 OK with the list of mapped trainings
	        return new ResponseEntity<>(findAllMappedtrainingsBhyId, HttpStatus.OK);
	    }
	}
	
	@GetMapping("/mappingData")
	public ResponseEntity<List<MasterMapping>> getAllMappingListOnMaster(){
		List<MasterMapping> allMappingList = MasterMappingServ.getAllMappingList();
		return new ResponseEntity<List<MasterMapping>> (allMappingList,HttpStatus.OK);
		
	}
	
	@DeleteMapping("/deleteMapping/{mappingcode}")
	public ResponseEntity<String>deActivateSpell(@PathVariable long mappingcode){
		
		try {
			MasterMappingServ.deActivateTrainingMappingData(mappingcode);
			return ResponseEntity.ok("Training mapping data De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating training mapping data:"+e.getMessage());
		}
		
	}
	
	@PutMapping("/updateMapping/{mappingcode}")
    public ResponseEntity<String> updatevenue(
            @PathVariable("mappingcode") long mappingcode,
            @RequestBody MasterMapping masterMapping) {

        try {
        	MasterMappingServ.updateMapping(mappingcode, masterMapping);
            return ResponseEntity.ok("Mapping updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error updating Mapping: " + e.getMessage());
        }
        
    }
	
	@GetMapping("/mapping/data")
	public ResponseEntity<List<MasterMapping>> getAllMappingDataUsingId(@RequestParam long mappingcode){
		List<MasterMapping> findMappingDataUsingId = MasterMappingServ.findMappingDataUsingId(mappingcode);
		return new ResponseEntity<List<MasterMapping>>(findMappingDataUsingId,HttpStatus.OK);
		
	}


}
