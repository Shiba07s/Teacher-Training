package com.TTSS03.Service;
 
import java.util.List;
 
import javax.transaction.Transactional;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.TTSS03.Entity.TrainingManagementMaster;
import com.TTSS03.Repository.TrainingManagementMasterRepository;
 
@Service
public class TrainingManagementMasterServiceImpl implements TrainingManagementMasterService {

	@Autowired
	TrainingManagementMasterRepository TrainingManagementMasterRepo;
 
	@Override
	public List<TrainingManagementMaster> findAllManagement() {
		// TODO Auto-generated method stub
		return TrainingManagementMasterRepo.findActiveTrainingManagement();
	}
 
	@Override
	public TrainingManagementMaster saveOneManagement(TrainingManagementMaster TrainingManagement) {
		// TODO Auto-generated method stub
		return TrainingManagementMasterRepo.save(TrainingManagement);
	}
 
	@Override
	@Transactional
	public void updateManagement(long management_code, String management_name) {
		// TODO Auto-generated method stub
		TrainingManagementMasterRepo.updateTrainingManagement(management_code, management_name);
	}
 
	@Override
	@Transactional
 
	public void deActivateManagement(long management_code) {
		// TODO Auto-generated method stub
		TrainingManagementMasterRepo.deactivateTrainingManagement(management_code);
	}

	@Override
	public TrainingManagementMaster findById(long management_code) {
		// TODO Auto-generated method stub
		return TrainingManagementMasterRepo.findById(management_code).orElse(null);
	}
 
	
 
}