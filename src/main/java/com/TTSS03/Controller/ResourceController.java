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

import com.TTSS03.Entity.Resource;
import com.TTSS03.Service.ResourceService;

@RestController
@RequestMapping("/api")
public class ResourceController {
	@Autowired
	private ResourceService resourceService;
	
	@GetMapping("/search/resource")
	public ResponseEntity<List<Resource>> getResource(Resource resource){
		List<Resource> allResouceData = resourceService.getAllResouceData(resource);
		return new ResponseEntity<List<Resource>>(allResouceData,HttpStatus.OK);
	}
	
	@PostMapping("/create/resourceType")
	public ResponseEntity<Resource>createOneresourceType(@RequestBody Resource resource){
		Resource saveresource = resourceService.saveOneSpell(resource);
		return ResponseEntity.ok(saveresource);
		
	}
	
	@PutMapping("/updateResourceType/{resourcecode}")
    public ResponseEntity<String> updateResourceType(
            @PathVariable("resourcecode") long resourcecode,
            @RequestParam("resourcetype") String resourcetype) {

        try {
        	resourceService.updateResourceType(resourcecode, resourcetype);
            return ResponseEntity.ok("Training Resource Type updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error updating Resource Type: " + e.getMessage());
        }
    }
	
	@DeleteMapping("/deleteResourceType/{resourcecode}")
	public ResponseEntity<String>deActivateResourcrType(@PathVariable long resourcecode){
		
		try {
			resourceService.deActivateResourceType(resourcecode);
			return ResponseEntity.ok("Training Resource Type De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating Resource type:"+e.getMessage());
		}
		
	}

}