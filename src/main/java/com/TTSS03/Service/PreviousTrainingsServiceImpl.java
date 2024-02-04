package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.PreviousTrainings;
import com.TTSS03.Repository.PreviousTrainingRepository;
@Service
public class PreviousTrainingsServiceImpl implements PreviousTrainingsService {
	
	@Autowired
	PreviousTrainingRepository PreviousTrainingRepo;

	@Override
	public PreviousTrainings saveonetraining(List<PreviousTrainings> previousTrainings) {
		
	 for (PreviousTrainings previousTrainings2 : previousTrainings) {
		 PreviousTrainingRepo.save(previousTrainings2);
	}
	return null;
	}
			 

	@Override
	public List<PreviousTrainings> getAllPreviousData(String treasuryId) {
		return PreviousTrainingRepo.findByTreasuryId(treasuryId);
	}


	 
}
