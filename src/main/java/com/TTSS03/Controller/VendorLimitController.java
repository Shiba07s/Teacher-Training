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

import com.TTSS03.Entity.VendorLimit;
import com.TTSS03.Service.VendorLimitService;

@RestController
@RequestMapping("/api")
public class VendorLimitController {
	
	@Autowired
	VendorLimitService VendorLimitServ;
	
	
	@GetMapping("/vendors")
	public ResponseEntity<VendorLimit>findAllVendorByName(@RequestParam String vendorName){
		VendorLimit findByvendorName = VendorLimitServ.findByvendorName(vendorName);
		
		return ResponseEntity.ok(findByvendorName);
	}
	
	
	@PostMapping("/create/vendorLimit")
	public ResponseEntity<VendorLimit>createVendorLimit(@RequestBody VendorLimit VendorLimit){
		  VendorLimit saveOneVendorLimit = VendorLimitServ.saveOneVendorLimit(VendorLimit);
		return ResponseEntity.ok(saveOneVendorLimit);
		
	}

    @PutMapping("/updateVendorLimit/{vlId}")
    public ResponseEntity<String> updateVendorLimit(@PathVariable long vlId, @RequestBody VendorLimit vendorLimit) {
        try {
            VendorLimitServ.updateVendorLimit(vlId, vendorLimit);
            return new ResponseEntity<>("VendorLimit updated successfully", HttpStatus.OK);
        } catch (Exception e) {
            // Log the exception or handle it accordingly
            return new ResponseEntity<>("Failed to update VendorLimit", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
//	@PutMapping("/updateVendorLimit/{vlId}")
//    public ResponseEntity<String> updateVendorLimit(
//            @PathVariable("spellcode") long vlId,
//            @RequestBody VendorLimit vendorLimit) {
//
//        try {
//        	VendorLimitServ.updateVendorLimit(vlId, vendorLimit);
//            return ResponseEntity.ok("Training spell updated successfully.");
//        } catch (Exception e) {
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
//                    .body("Error updating training spell: " + e.getMessage());
//        }
//    }s
	
	@DeleteMapping("/deleteVendorLimit/{vlId}")
	public ResponseEntity<String>deActivateVendorLimit(@PathVariable long vlId){
		
		try {
			VendorLimitServ.deActivateVendorLimit(vlId);
			return ResponseEntity.ok("Training spell De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating training spell:"+e.getMessage());
		}
		
	}
	@GetMapping("/getbyVendorLimitid/{vlId}")
	public ResponseEntity<VendorLimit>findVendorLimit(@PathVariable("vlId") long vlId){
		
		VendorLimit vendorLimit = VendorLimitServ.getVendorLimit(vlId);
		return ResponseEntity.ok(vendorLimit);
		
	}
	@GetMapping("/vendorslist")
	public ResponseEntity<List<VendorLimit>>findVendorLimitActive(){
		
	 List<VendorLimit> allVendorsList = VendorLimitServ.getAllVendorsList();
		return ResponseEntity.ok(allVendorsList);
		
	}
	

}
