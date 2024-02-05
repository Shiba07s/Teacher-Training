package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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

}
