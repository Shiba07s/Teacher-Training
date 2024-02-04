package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TrainingMode;

public interface TrainingModeService {
	List<TrainingMode> getAllTrainingMode();

	TrainingMode saveOneTrainingMode(TrainingMode trainingMode);

	void updateTrainingMode(long trainingModecode, String trainingMode);

	void deActivateTrainingMode(long trainingModecode);

	TrainingMode findByStatusId(long trainingModecode);
}
