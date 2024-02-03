package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.AgencyMaster;

public interface AgencyMasterService {
	
	List<AgencyMaster>getAllAgency();
	
	List<AgencyMaster>getAllAgencyy();

	AgencyMaster saveAgency(AgencyMaster agencyMaster);

	AgencyMaster findAgency(int slno);

	AgencyMaster updateAgency(int slno, String agency);

	void deActivateTrainingCategory(int slno);


}
