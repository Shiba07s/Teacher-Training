package com.TTSS03.Repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ScheduleTrainings;

public interface ScheduleTrainingsRepository extends JpaRepository<ScheduleTrainings, Integer> {
	

	@Query("SELECT ss FROM ScheduleTrainings ss WHERE ss.ref_planner_id = :ref_planner_id")
	List<ScheduleTrainings> findByRefId(@Param("ref_planner_id") String ref_planner_id);

//	 @Query("SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.apply_end_dt")
//	    List<ScheduleTrainings> findTrainingBetweenApplyDates();
	 
	 @Query("SELECT t FROM ScheduleTrainings t WHERE t.tyear= :tyear and t.tmonth=:tmonth")
	 List<ScheduleTrainings> findTrainingBetweenMonthYear(@Param("tyear") String year,@Param("tmonth") String tmonth);

	 @Query("SELECT t FROM ScheduleTrainings t WHERE t.ref_planner_id = ?1 AND t.venue_id = ?2")
		Optional<ScheduleTrainings> findByRefPlannerIdAndVenueId(String ref_planner_id, String venue_id);
	 
	 @Query("SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.training_start_dt")
	    List<ScheduleTrainings> findTrainingBetweenApplyStartDateToTrainingStartdate();  
  
	 @Query("SELECT t FROM ScheduleTrainings t WHERE curdate() BETWEEN t.apply_start_dt AND t.apply_end_dt AND t.record_status = 'Active'")
		List<ScheduleTrainings> findTrainingBetweenApplyDates();
		
		@Modifying
		@Transactional
		@Query("UPDATE ScheduleTrainings s SET " + "s.tmonth = :#{#scheduleTrainings.tmonth}, "
				+ "s.tyear = :#{#scheduleTrainings.tyear}, " + "s.tname = :#{#scheduleTrainings.tname}, "
				+ "s.tdescription = :#{#scheduleTrainings.tdescription}, "
				+ "s.venue_name = :#{#scheduleTrainings.venue_name}, "
				+ "s.training_start_dt = :#{#scheduleTrainings.training_start_dt}, "
				+ "s.training_end_dt = :#{#scheduleTrainings.training_end_dt}, "
				+ "s.apply_start_dt = :#{#scheduleTrainings.apply_start_dt}, "
				+ "s.apply_end_dt = :#{#scheduleTrainings.apply_end_dt}, "
				+ "s.maplocation = :#{#scheduleTrainings.maplocation}, " + "s.vaddress = :#{#scheduleTrainings.vaddress}, "
				+ "s.tmode = :#{#scheduleTrainings.tmode}, " + "s.tgrade = :#{#scheduleTrainings.tgrade}, "
				+ "s.state = :#{#scheduleTrainings.state}, " + "s.district = :#{#scheduleTrainings.district}, "
				+ "s.mandal = :#{#scheduleTrainings.mandal}, "
				+ "s.coordinatorname = :#{#scheduleTrainings.coordinatorname}, "
				+ "s.coordinatoremailid = :#{#scheduleTrainings.coordinatoremailid}, "
				+ "s.coordinatormobileno = :#{#scheduleTrainings.coordinatormobileno}, "
				+ "s.tagency = :#{#scheduleTrainings.tagency}, " + "s.tmodule = :#{#scheduleTrainings.tmodule}, "
				+ "s.resourcetype = :#{#scheduleTrainings.resourcetype} "
				+ "WHERE s.ref_planner_id = :ref_planner_id AND s.venue_id = :venue_id")
		void updateTraining(@Param("ref_planner_id") String ref_planner_id, @Param("venue_id") String venue_id,
				@Param("scheduleTrainings") ScheduleTrainings scheduleTrainings);
	 
		@Modifying
		@Query("UPDATE ScheduleTrainings t SET t.record_status = 'Inactive' WHERE t.ref_planner_id = :ref_planner_id AND t.venue_id = :venue_id")
		void deactivateTraining(@Param("ref_planner_id") String ref_planner_id, @Param("venue_id") String venue_id);
	 



}
