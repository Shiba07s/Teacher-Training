package com.TTSS03.Service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ScheduleTrainings;
import com.TTSS03.Repository.ScheduleTrainingsRepository;

@Service
public class ScheduleTrainingsServiceImpl implements ScheduleTrainingsService {
	
	@Autowired
	private ScheduleTrainingsRepository ScheduleTrainingsRepo;
	
	private static final Logger logger = LogManager.getLogger(ScheduleTrainingsServiceImpl.class);

	@Override
	public ScheduleTrainings saveOneTraining(ScheduleTrainings scheduleTrainings) {
		// TODO Auto-generated method stub
		return ScheduleTrainingsRepo.save(scheduleTrainings);
		
	}

	@Override
	public List<ScheduleTrainings> getAllScheduledTrainings(ScheduleTrainings scheduleTrainings) {
		// TODO Auto-generated method stub
		
		List<ScheduleTrainings> findTrainingBetweenApplyDates = ScheduleTrainingsRepo.findTrainingBetweenApplyDates();
		return findTrainingBetweenApplyDates;
	}
	
	 public List<ScheduleTrainings> getAllTrainingsBetweenYearAndMonth(String tmonth,String tyear){
			List<ScheduleTrainings> findTrainingBetweenMonthYear = ScheduleTrainingsRepo.findTrainingBetweenMonthYear(tmonth, tyear);
			
			return findTrainingBetweenMonthYear;
			
		}
	 
	 @Override
		public List<ScheduleTrainings> getAllScheduledTrainings1(ScheduleTrainings scheduleTrainings) {
			List<ScheduleTrainings> findAll = ScheduleTrainingsRepo.findTrainingBetweenApplyStartDateToTrainingStartdate();
			return findAll;
		}

		@Override
		public List<ScheduleTrainings> getAllScheduledTrainingsbyid(String ref_planner_id) {
			// TODO Auto-generated method stub
			return ScheduleTrainingsRepo.findByRefId(ref_planner_id);
		}
		
		@Override
		public Optional<ScheduleTrainings> getScheduledTrainings(String ref_planner_id, String venue_id) {
			try {
				// Call the repository method to fetch scheduled trainings
				Optional<ScheduleTrainings> scheduledTrainings = ScheduleTrainingsRepo
						.findByRefPlannerIdAndVenueId(ref_planner_id, venue_id);
	 
				// Return the fetched data
				return scheduledTrainings;
			} catch (Exception ex) {
				// Log the exception
				logger.error("An error occurred while fetching scheduled trainings: {}", ex.getMessage());
	 
				// Handle the exception (e.g., throw custom exception, return empty optional,
				// etc.)
				// Here, returning empty optional as an example
				return Optional.empty();
			}
		}
	 
		@Override
		@Transactional
		public void updateScheduledTraining(String ref_planner_id, String venue_id, ScheduleTrainings scheduleTrainings) {
			// TODO Auto-generated method stub
			System.out.println(ref_planner_id + "" + venue_id + "" + scheduleTrainings);
			ScheduleTrainingsRepo.updateTraining(ref_planner_id, venue_id, scheduleTrainings);
		}
	 
		@Override
		@Transactional
		public void deleteScheduledTraining(String ref_planner_id, String venue_id) {
			// TODO Auto-generated method stub
			ScheduleTrainingsRepo.deactivateTraining(ref_planner_id, venue_id);
	 
		}

}
