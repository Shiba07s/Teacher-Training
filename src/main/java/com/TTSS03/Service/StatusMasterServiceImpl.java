package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.StatusMaster;
import com.TTSS03.Repository.StatusMasterRepository;


@Service
public class StatusMasterServiceImpl implements StatusMasterService {
	
	@Autowired
	private StatusMasterRepository statusRepo;

	@Override
	public List<StatusMaster> getAllStatus() {
		return statusRepo.findActiveStatusName();
	}
 
	@Override
	public StatusMaster saveOneStatus(StatusMaster statusMaster) {
		return statusRepo.save(statusMaster);
	}
 
	@Override
	@Transactional
	public void updateTrainingStatus(long statuscode, String statusname) {
		statusRepo.updateTrainingSpell(statuscode, statusname);
		
	}
 
	@Override
	@Transactional
	public void deActivateTrainingStatus(long statuscode) {
		statusRepo.deactivateTrainingSpell(statuscode);
		
	}

	@Override
	public StatusMaster findByStatusId(long statuscode) {
		// TODO Auto-generated method stub
		return statusRepo.findById(statuscode).orElse(null);
	}
	
 
}