package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.BudgetMapping;
import com.TTSS03.Service.BudgetMappingService;

@RestController
@RequestMapping("/api")
public class BudgetMappingController {
	
	@Autowired
	BudgetMappingService BudgetMappingServ;
	
	
	 @PostMapping("/save/bdgtmapping")
	    public ResponseEntity<String> saveBudgetMappings(@RequestBody List<BudgetMapping>  budgetMappingList,@RequestParam  String trainingid,@RequestParam  String budgetedyear,@RequestParam String trainingname) {
		 BudgetMappingServ.saveBudgetMappings(budgetMappingList, trainingid, budgetedyear,trainingname);
	        return new ResponseEntity<>("Budget mappings saved successfully", HttpStatus.OK);
	    }

}
