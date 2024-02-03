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
import org.springframework.web.bind.annotation.RestController;

import com.TTSS03.Entity.SessionMaster;
import com.TTSS03.Service.SessionMasterService;

@RestController
@RequestMapping("/api/session")
public class SessionMasterController {
	
	@Autowired
	private SessionMasterService sessionMasterService;
//	
//	@PostMapping("/create")
//	public ResponseEntity<SessionMaster> createNewSession(@RequestBody SessionMaster sessionMaster){
//		SessionMaster createSession = sessionMasterService.createSession(sessionMaster);
//		return new ResponseEntity<SessionMaster>(createSession,HttpStatus.OK);
//		
//	}
	
	

	@PostMapping("/create")
	public ResponseEntity<SessionMaster> createNewSession(@RequestBody SessionMaster sessionMaster) {

		if (sessionMaster.getStatus().equals("Current")) {
			List<SessionMaster> existingCurrentSession = sessionMasterService.getSessionsWithStatusCurrent();
			if (!existingCurrentSession.isEmpty()) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
		}

		SessionMaster createSession = sessionMasterService.createSession(sessionMaster);
		return ResponseEntity.ok(createSession);
	}

	@GetMapping("/get")
	public ResponseEntity<List<SessionMaster>> getAllSessionsList(){
		List<SessionMaster> allSession = sessionMasterService.getAllSession();
		return new ResponseEntity<List<SessionMaster>>(allSession,HttpStatus.OK);
		
	}
	
	@GetMapping("/getbysessionid/{id}")
	public ResponseEntity<SessionMaster> findbysessionid(@PathVariable("id") long id) {

		SessionMaster smaster = sessionMasterService.findByid(id);

		return ResponseEntity.ok(smaster);

	}
	
	@PutMapping("/updateSession/{id}")
    public ResponseEntity<String> updateSession(
            @PathVariable("id") long id,
            @RequestBody SessionMaster sessionMaster) {

        try {
        	sessionMasterService.updateSession(id, sessionMaster);
            return ResponseEntity.ok("Session updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error updating Session: " + e.getMessage());
        }
    }
//	   @PutMapping("/update/{sessionName}")
//	    public ResponseEntity<SessionMaster> updateSessionBySessionName(
//	            @PathVariable String sessionName,
//	            @RequestBody SessionMaster sessionMaster) {
//	        SessionMaster updatedSession = sessionMasterService.updateSessionBySessionName(sessionName, sessionMaster);
//
//	        if (updatedSession != null) {
//	            return ResponseEntity.ok(updatedSession);
//	        } else {
//	            // Handle the case where the session with the specified sessionName is not found
//	            return ResponseEntity.notFound().build();
//	        }
//	    }
//	   
//	   @PutMapping("/updateTrainingSession/{id}")
//	    public ResponseEntity<String> updateTrainingSession(
//	            @PathVariable("id") long id,
//	            @RequestParam("sessionName") String sessionName,
//	            @RequestParam("fromDate") String fromDate,
//	            @RequestParam("toDate") String toDate,
//	            @RequestParam("status") String status,
//	            @RequestParam("sessionCode") String sessionCode
//	            
//	    		) {
//	 
//	        try {
//	        	sessionMasterService.updateTrainingSession(id, sessionName,fromDate,toDate,status,sessionCode);
//	            return ResponseEntity.ok("Training Session updated successfully.");
//	        } catch (Exception e) {
//	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
//	                    .body("Error updating training Session: " + e.getMessage());
//	        }
//	    }
		
		@DeleteMapping("/deleteSession/{id}")
		public ResponseEntity<String>deActivateSession(@PathVariable long id){
			
			try {
				sessionMasterService.deActivateTrainingSession(id);
				return ResponseEntity.ok("Training Session De-Activated Successfully.");
			} catch (Exception e) {
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deacivating training Session:"+e.getMessage());
			}
			
		}
}
