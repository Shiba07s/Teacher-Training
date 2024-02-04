package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TrainingCategoryMaster;

public interface TrainingCategoryMasterService {
	
	List<TrainingCategoryMaster>getAllcategory();
	
	TrainingCategoryMaster saveOneCategory(TrainingCategoryMaster TrainingCategory);
	
    void updateTrainingCategory(long uid,String trainingcategory);
    
    void deActivateTrainingCategory(long uid);

	TrainingCategoryMaster getcategory(long uid);

	

}
