package com.TTSS03.Service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AppliedTrainingsFromTrainee;
import com.TTSS03.Repository.AppliedTrainingsFromTraineeRepository;

@Service
public class AppliedTrainingsFromTraineeServiceImpl implements AppliedTrainingsFromTraineeService {
	
	
	@Autowired
	AppliedTrainingsFromTraineeRepository appliedTrainingsFromTraineeRepository;

	@Override
	public AppliedTrainingsFromTrainee saveEmployeeTrainings(AppliedTrainingsFromTrainee appliedTrainingsFromTrainee) {
	    // Check if data with the same treasuryId and plannerId already exists
	    java.util.List<AppliedTrainingsFromTrainee> existingData = appliedTrainingsFromTraineeRepository
	            .findByTreasuryIdAndPlannerId(appliedTrainingsFromTrainee.getTreasuryid(), appliedTrainingsFromTrainee.getRef_planner_id());

	    if (!existingData.isEmpty()) {
	        // Data exists, update it
	        AppliedTrainingsFromTrainee existingTraining = existingData.get(0);

	        // Update existingTraining with new values from appliedTrainingsFromTrainee
	        existingTraining.setTreasuryid(appliedTrainingsFromTrainee.getTreasuryid());
	        existingTraining.setRef_planner_id(appliedTrainingsFromTrainee.getRef_planner_id());
	        existingTraining.setVenueid(appliedTrainingsFromTrainee.getVenueid());
	        // Update other fields as needed

	        // Then save the updated data
	        return appliedTrainingsFromTraineeRepository.save(existingTraining);
	    } else {
	        // Data does not exist, save it
	        return appliedTrainingsFromTraineeRepository.save(appliedTrainingsFromTrainee);
	    }
	}

}
