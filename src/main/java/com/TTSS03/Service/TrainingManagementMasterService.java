package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TrainingManagementMaster;

public interface TrainingManagementMasterService {
	List<TrainingManagementMaster> findAllManagement();

	TrainingManagementMaster saveOneManagement(TrainingManagementMaster TrainingManagement);

	void updateManagement(long management_code, String management_name);

	void deActivateManagement(long management_code);

	TrainingManagementMaster findById(long management_code);

}