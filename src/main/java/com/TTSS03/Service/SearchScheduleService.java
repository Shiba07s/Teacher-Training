package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.SearchSchedule;


public interface SearchScheduleService {
	
	 List<SearchSchedule> findByReferencrId(String ref_planner_id);
	 
	 SearchSchedule saveone (SearchSchedule searchSchedule);
	 

}
