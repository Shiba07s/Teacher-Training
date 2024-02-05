package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TargetGroupMaster;

public interface TargetGroupMasterService {

	List<TargetGroupMaster> getAllGroup();

	TargetGroupMaster createNewGroup(TargetGroupMaster targetGroupMaster);
	// void deactivateGroup(long groupId);

	void updateTrainingGroup(long groupId, String targetgroup);

	void deActivateTrainingGroup(long groupId);

	TargetGroupMaster getGroup(long group_id);

}
