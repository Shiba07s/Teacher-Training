package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import com.TTSS03.Entity.ScheduleTrainings;

public interface ScheduleTrainingsService {
	
	
	ScheduleTrainings saveOneTraining (ScheduleTrainings scheduleTrainings);
	
	List<ScheduleTrainings>getAllScheduledTrainings(ScheduleTrainings scheduleTrainings);
	
	List<ScheduleTrainings> getAllTrainingsBetweenYearAndMonth(String tmonth,String tyear);
	
	List<ScheduleTrainings> getAllScheduledTrainings1(ScheduleTrainings scheduleTrainings) ;
	
	List<ScheduleTrainings> getAllScheduledTrainingsbyid(String ref_planner_id);
	
	Optional<ScheduleTrainings> getScheduledTrainings(String ref_planner_id, String venue_id);
	 
	void updateScheduledTraining(String ref_planner_id, String venue_id, ScheduleTrainings scheduleTrainings);
 
	void deleteScheduledTraining(String ref_planner_id, String venue_id);

}
