package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.AttendGradeMaster;
import com.TTSS03.Entity.TargetGroupMaster;
import com.TTSS03.Repository.TargetGroupMasterRepository;


@Service
public class TargetGroupMasterServiceimpl implements TargetGroupMasterService {

	
	@Autowired
	TargetGroupMasterRepository targetGroupMasterRepo; 
	
	@Override
	public List<TargetGroupMaster> getAllGroup() {
		return targetGroupMasterRepo.findActiveGroup();
	}
	
	@Override
	public TargetGroupMaster createNewGroup(TargetGroupMaster targetGroupMaster) {
		return targetGroupMasterRepo.save(targetGroupMaster);
	}
	
	@Override
	@Transactional
	public void updateTrainingGroup(long groupId , String targetgroup) {
		targetGroupMasterRepo.updateTrainingGroup(groupId, targetgroup);
		
	}
 
	@Override
	@Transactional
	public void deActivateTrainingGroup(long groupId) {
		targetGroupMasterRepo.deactivateTrainingGroup(groupId);
		
	}

	@Override
	public TargetGroupMaster getGroup(long group_id) {
		// TODO Auto-generated method stub
		return targetGroupMasterRepo.findById(group_id).orElse(null);
	}

}
