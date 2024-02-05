package com.TTSS03.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.TTSS03.Entity.TrainingMode;
import com.TTSS03.Repository.TrainingModeRepository;


@Service
public class TrainingModeServiceimpl implements TrainingModeService {
	
	@Autowired
	private TrainingModeRepository trainingModeRepo;

	@Override
	public List<TrainingMode> getAllTrainingMode() {
		return trainingModeRepo.findActiveTrainingMode() ;
	}

	@Override
	public TrainingMode saveOneTrainingMode(TrainingMode trainingMode) {
		return trainingModeRepo.save(trainingMode);
	}

	@Override
	@Transactional
	public void updateTrainingMode(long trainingModecode, String trainingMode) {
		trainingModeRepo.updateTrainingMode(trainingModecode, trainingMode);
	}

	@Override
	@Transactional
	public void deActivateTrainingMode(long trainingModecode) {
		trainingModeRepo.deactivateTrainingMode(trainingModecode);
	}

	@Override
	public TrainingMode findByStatusId(long trainingModecode) {
		// TODO Auto-generated method stub
		return trainingModeRepo.findById(trainingModecode).orElse(null);
	}
	
 
}

