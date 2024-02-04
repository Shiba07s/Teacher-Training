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

import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Service.SearchVenueService;

@RestController
@RequestMapping("/api")
public class SearchVenueController {
	
	
	@Autowired
	private SearchVenueService searchVenueService;
	
	@GetMapping("/search/venue")
	public ResponseEntity<List<SearchVenue>>findAllVenue(SearchVenue searchVenue){
		
		List<SearchVenue> venue = searchVenueService.findAllVenue(searchVenue);
		
		return  ResponseEntity.ok(venue);
		
	}
	@GetMapping("/search/venueId")

    public ResponseEntity<List<SearchVenue>>findVenue(@RequestParam long vid){
		
		List<SearchVenue> venue = searchVenueService.findByVenueid(vid);
		
		return  ResponseEntity.ok(venue);
		
	}
	
	
	@PostMapping("/create/venue")
	public ResponseEntity<SearchVenue>createOneVenue(@RequestBody SearchVenue Searchvenue){
		SearchVenue saveOnevenue = searchVenueService.saveOnevenue(Searchvenue);
		return ResponseEntity.ok(saveOnevenue);
		
	}
	
	@PutMapping("/updateVenue/{vid}")
    public ResponseEntity<String> updatevenue(
            @PathVariable("vid") long vid,
            @RequestBody SearchVenue Searchvenue) {

        try {
        	searchVenueService.updatevenue(vid, Searchvenue);
            return ResponseEntity.ok("Venue updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error updating Venue: " + e.getMessage());
        }
    }
	
	@DeleteMapping("/deleteVenue/{vid}")
	public ResponseEntity<String>deActivateVenue(@PathVariable long vid){
		
		try {
			searchVenueService.deActivatevenue(vid);
			return ResponseEntity.ok("Venue De-Activated Successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating Venue:"+e.getMessage());
		}
		
	}
}

