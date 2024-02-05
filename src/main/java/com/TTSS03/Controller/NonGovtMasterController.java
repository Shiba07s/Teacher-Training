package com.TTSS03.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.NonGovtMaster;
import com.TTSS03.Service.NonGovtMasterService;

@RestController
@RequestMapping("/api")
public class NonGovtMasterController {
	
	@Autowired
	NonGovtMasterService NonGovtMasterservice;
	
	
	@GetMapping("/privateteacher")
	public ResponseEntity<NonGovtMaster>findOnePrivateTeacher(@RequestParam String cfms_id){
		
		NonGovtMaster findCfmsId = NonGovtMasterservice.findCfmsId(cfms_id);
		
	    return new ResponseEntity<>(findCfmsId, HttpStatus.OK);
		
	}

}
