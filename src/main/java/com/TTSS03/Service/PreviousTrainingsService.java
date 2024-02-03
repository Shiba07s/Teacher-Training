package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.PreviousTrainings;

public interface PreviousTrainingsService {
	
	PreviousTrainings saveonetraining(List<PreviousTrainings> previousTrainings);
	
	List<PreviousTrainings> getAllPreviousData(String treasuryId);

}
