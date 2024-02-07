package com.TTSS03.Controller;

import java.util.List;
import java.util.Optional;

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

import com.TTSS03.Entity.ComponentLimit;
import com.TTSS03.Entity.ComponentMaster;
import com.TTSS03.Entity.HeadMaster;
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
	    
	    @PostMapping("/savecomponentlimit")
	    public ResponseEntity<ComponentLimit> create(@RequestBody ComponentLimit componentLimit) {
	        try {
	        	ComponentLimit saveComponentLimit = ComponentLimitServ.saveOne(componentLimit);
	            return ResponseEntity.ok(saveComponentLimit);
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }

	    @GetMapping("/getbycomponentid/{sl}")
	    public ResponseEntity<ComponentLimit> getById(@PathVariable("sl") long sl) {
	    	System.out.println(sl);
	        try {
	            Optional<ComponentLimit> componentLimitOptional = ComponentLimitServ.getById(sl);
	            System.out.println(componentLimitOptional.get());
	            return componentLimitOptional
	                    .map(componentLimit -> ResponseEntity.ok().body(componentLimit))
	                    .orElse(ResponseEntity.notFound().build());
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }

	    @GetMapping("/getallcomponentsbystatus")
	    public ResponseEntity<List<ComponentLimit>> getAllByStatus() {
	        try {
	            List<ComponentLimit> componentLimits = ComponentLimitServ.getAllByStatus();
	            return ResponseEntity.ok(componentLimits);
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }
	    
	    @GetMapping("/getallcomponents")
	    public ResponseEntity<List<ComponentLimit>> getAll() {
	    	System.out.println("hiiii");
	        try {
	            List<ComponentLimit> componentLimits = ComponentLimitServ.getAll();
	            return ResponseEntity.ok(componentLimits);
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }

	    @PutMapping("/updatecomponent/{sl}")
	    public ResponseEntity<String> update(@PathVariable("sl") long sl, @RequestBody ComponentLimit componentLimit) {
	        try {
	        	ComponentLimit updatedComponentLimit = ComponentLimitServ.update(sl, componentLimit);
	            return ResponseEntity.ok("ok");
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }

	    @DeleteMapping("/deletecomponent/{sl}")
	    public ResponseEntity<Void> delete(@PathVariable("sl") long sl) {
	        try {
	        	ComponentLimitServ.delete(sl);
	            return ResponseEntity.noContent().build();
	        } catch (Exception e) {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }

}
