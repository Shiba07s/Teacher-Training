package com.TTSS03.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
    
}


