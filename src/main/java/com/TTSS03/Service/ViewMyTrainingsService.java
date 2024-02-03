package com.TTSS03.Service;

import java.util.List;
import java.util.Map;

import com.TTSS03.Entity.NominateTrainings;
import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.utill.NominateTrainingsDto;

public interface ViewMyTrainingsService {

	//List<ViewMyTrainings> savemyTrainings(String treasuryid);
	
	List<ViewMyTrainings> savemyTrainingsxyz(String treasuryid,String ref_planner_id,long venueid);


	List<ViewMyTrainings>findByTreasuryId(String treasuryid );

	List<Map<String, Object>> getCustomData();

	List<Map<String, Object>> getAppovedData();

	List<Map<String, Object>> getRejectedData();

	void updateStatusToApproved(String treasuryId, String refPlannerId);

	void rejectStatusToApproved(String treasuryId, String refPlannerId);

	long countWaitingForApprovalUsersList();
	
	List<Map<String, Object>> findApprovedDataTeacherTrainingVenueId(String trainingId, String venueId ) ;

	long countApprovedUsersList();

	long countRejectedUsersList();

	void updateStatusAndRemarks(String treasuryId, String refPlannerIds, String remarks);

	void updateStatusAndRemarksForSecondLevelApproval(String treasuryId, String refPlannerIds,
			String secondlevelapproval);

	void storeDataNominate(List<NominateTrainingsDto> selectedRowsData);
	
	List<Map<String, Object>> getSelfAttendedData();
	
	List<NominateTrainings> getNominatedTrainings();
	
	List<Map<String, Object>> getNominateTeacher();
	
	void updateStatusToApprovedNomonate(String treasuryId, String refPlannerId);
	
	 List<Map<String, Object>> findRejectedData();
	 
	 List<Map<String, Object>> findApprovedDataTeacher();
		List<ViewMyTrainings>checkIfAlreadyAppliedTrainings(String treasuryId, String refPlannerIds);


	/**
	 * @param treasuryid
	 * @param ref_planner_id
	 * @param vid
	 * @return
	 */

}
