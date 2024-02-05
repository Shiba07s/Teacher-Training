package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.StatusMaster;

public interface StatusMasterService {
	
	 List<StatusMaster> getAllStatus();
	 
	 StatusMaster saveOneStatus(StatusMaster statusMaster) ;
	 
	 void updateTrainingStatus(long statuscode, String statusname);
	 
	 void deActivateTrainingStatus(long statuscode) ;

	StatusMaster findByStatusId(long statuscode);

}
