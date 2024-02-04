package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.TrainingCategoryMaster;
import com.TTSS03.Repository.TrainingCategoryMasterRepository;

@Service
public class TrainingCategoryMasterServiceimpl implements TrainingCategoryMasterService {
	
	@Autowired
	TrainingCategoryMasterRepository TrainingCategoryMasterRepo;

	@Override
	public List<TrainingCategoryMaster> getAllcategory() {
		// TODO Auto-generated method stub
		return TrainingCategoryMasterRepo.findActiveCategiry();
	}

	@Override
	public TrainingCategoryMaster saveOneCategory(TrainingCategoryMaster TrainingCategory) {
		// TODO Auto-generated method stub
		return TrainingCategoryMasterRepo.save(TrainingCategory);
	}

	@Override
	@Transactional
	public void updateTrainingCategory(long uid,String trainingcategory) {
		// TODO Auto-generated method stub
		TrainingCategoryMasterRepo.updateTrainingCategory(uid,trainingcategory);
		
		
		  
	}

	@Override
	@Transactional
	public void deActivateTrainingCategory(long uid) {
		// TODO Auto-generated method stub
		TrainingCategoryMasterRepo.deactivateTrainingCategory(uid);
	}

	@Override
	public TrainingCategoryMaster getcategory(long uid) {
		// TODO Auto-generated method stub
		return TrainingCategoryMasterRepo.findById(uid).orElse(null);
	}

}
