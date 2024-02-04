package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Service.ComponentLimitService;

@RestController
@RequestMapping("/api")
public class ComponentLimitController {
	
	@Autowired
	ComponentLimitService ComponentLimitServ;
	
	
	 @GetMapping("/resources-and-rates")
	    public List<Object[]> getResourcesAndRates(@RequestParam List<String> resourceNames) {
	        return ComponentLimitServ.getResourcesAndRatesByNames(resourceNames);
	    }

}
