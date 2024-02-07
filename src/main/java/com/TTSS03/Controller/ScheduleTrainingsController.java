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

import com.TTSS03.Entity.ScheduleTrainings;
import com.TTSS03.Service.ScheduleTrainingsService;

@RestController
@RequestMapping("/api")
public class ScheduleTrainingsController {

    @Autowired
    ScheduleTrainingsService scheduleTrainingsService;

    @PostMapping("/schedule")
    public ResponseEntity<String> scheduleOneTraining(@RequestBody ScheduleTrainings scheduleTrainings) {
        scheduleTrainingsService.saveOneTraining(scheduleTrainings);
        return ResponseEntity.ok("saved Successfully");
    }
    
    
    @GetMapping("/scheduledTrainings")
    public ResponseEntity<List<ScheduleTrainings>>getAllTrainings(ScheduleTrainings scheduleTrainings){
    	
    	List<ScheduleTrainings> trainings = scheduleTrainingsService.getAllScheduledTrainings(scheduleTrainings);
    	return ResponseEntity.ok(trainings);
    	
    }
    
    @GetMapping("/fetchScheduledTrainingById/{ref_planner_id}/{venue_id}")
    public ResponseEntity<Optional<ScheduleTrainings>>getTraining(@PathVariable("ref_planner_id") String ref_planner_id, @PathVariable("venue_id") String venue_id){
    	
    	Optional<ScheduleTrainings> training = scheduleTrainingsService.getScheduledTrainings(ref_planner_id,venue_id);
    	return ResponseEntity.ok(training);
    	
    }
    
    @GetMapping("/scheduledTraining/year/month")
    public ResponseEntity<List<ScheduleTrainings>>getAllTrainingsBetweenYearAndMonth(@RequestParam String tyear,@RequestParam String tmonth){
    	
    	List<ScheduleTrainings> training = scheduleTrainingsService.getAllTrainingsBetweenYearAndMonth(tyear, tmonth);
    	return ResponseEntity.ok(training);
    	
    }
    
    
    
    @GetMapping("/scheduledTrainings1")
    public ResponseEntity<List<ScheduleTrainings>>getAllTrainings1(ScheduleTrainings scheduleTrainings){
    	
    	List<ScheduleTrainings> trainings = scheduleTrainingsService.getAllScheduledTrainings1(scheduleTrainings);
    	return ResponseEntity.ok(trainings);
    	
    }
    
    
    @GetMapping("/scheduledTrainingsbyid")
    public ResponseEntity<List<ScheduleTrainings>>getAllTrainingsbyid(@RequestParam String ref_planner_id){
    	
    	List<ScheduleTrainings> allScheduledTrainingsbyid = scheduleTrainingsService.getAllScheduledTrainingsbyid(ref_planner_id);
    	return ResponseEntity.ok(allScheduledTrainingsbyid);
    	
    }
    
    @PutMapping("/updateScheduledTraining/{ref_planner_id}/{venue_id}")
    public ResponseEntity<String>updateTraining(@PathVariable("ref_planner_id") String ref_planner_id, @PathVariable("venue_id") String venue_id, @RequestBody ScheduleTrainings scheduleTrainings){
    	
    	try {
    		scheduleTrainingsService.updateScheduledTraining(ref_planner_id, venue_id, scheduleTrainings);
			return ResponseEntity.ok("Training updated successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error updating Venue: " + e.getMessage());
		}
    	
    }
    
    @DeleteMapping("/deleteScheduledTraining/{ref_planner_id}/{venue_id}")
    public ResponseEntity<String>deleteTraining(@PathVariable("ref_planner_id") String ref_planner_id, @PathVariable("venue_id") String venue_id){
    	
    	try {
    		scheduleTrainingsService.deleteScheduledTraining(ref_planner_id, venue_id);
			return ResponseEntity.ok("Training deleted successfully.");
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body("Error deleting Venue: " + e.getMessage());
		}
    	
    }
    
    @GetMapping("/scheduledTraining/apply_start_dt/training_end_dt")
    public ResponseEntity<List<ScheduleTrainings>>getAllTrainingsBetweenYearAndMonthIn(@RequestParam String apply_start_dt,@RequestParam String training_end_dt){
    	
    	List<ScheduleTrainings> training = scheduleTrainingsService.getAllTrainingsBetweenYearAndMonthIn(apply_start_dt, training_end_dt);
    	return ResponseEntity.ok(training);
    	
    }
    
    
}


