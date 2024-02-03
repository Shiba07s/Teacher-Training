 package com.TTSS03.Service;


import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.NominateTrainings;
import com.TTSS03.Entity.ViewMyTrainings;
import com.TTSS03.Repository.AppliedTrainingsFromTraineeRepository;
import com.TTSS03.Repository.NominateTrainingsRepository;
import com.TTSS03.Repository.ScheduleTrainingsRepository;
import com.TTSS03.Repository.SearchVenueRepository;
import com.TTSS03.Repository.ViewMyTrainingsRepository;
import com.TTSS03.utill.NominateTrainingsDto;


@Service
public class ViewMyTrainingsServiceImpl implements ViewMyTrainingsService {
	
	@Autowired
	private NominateTrainingsRepository nominateTrainingsRepository;

    @Autowired
    ViewMyTrainingsRepository ViewMyTrainingsRepo;

    @Autowired
    AppliedTrainingsFromTraineeRepository appliedTrainingsFromTraineeRepo;

    @Autowired
    ScheduleTrainingsRepository ScheduleTrainingsRepo;

    @Autowired
    SearchVenueRepository SearchVenueRepo;

    
    @Override
	public List<ViewMyTrainings> findByTreasuryId(String treasuryid) {
	    return ViewMyTrainingsRepo.findByTreasuryId(treasuryid);
	}
//    @Override
//	public List<ViewMyTrainings> savemyTrainings(String treasuryid) {
//	    List<Object[]> findTrainingDetailsByTreasuryId = ViewMyTrainingsRepo.findTrainingDetailsByTreasuryId(treasuryid);
// 
//	    // Process and save the results to your target table (ViewMyTrainings)
//	    Set<ViewMyTrainings> uniqueTrainings = new HashSet<>();
// 
//	    for (Object[] result : findTrainingDetailsByTreasuryId) {
//	        // Print the values at each index of the result array
//	        for (int i = 0; i < result.length; i++) {
//	            System.out.println("Index " + i + ": " + result[i]);
//	        }
// 
//	        ViewMyTrainings viewMyTrainings = createViewMyTrainingsFromResultArray(result);
// 
//	        // Check if the combination of treasuryid and tname already exists
//	        List<ViewMyTrainings> existingData = ViewMyTrainingsRepo.findByTreasuryIdAndTname(viewMyTrainings.getTreasuryid(), viewMyTrainings.getTname());
// 
//	        if (!existingData.isEmpty()) {
//	            // Data exists, update it
//	            ViewMyTrainings existingRecord = existingData.get(0); // Assuming there's only one record, adjust if needed
// 
//	            // Update existingRecord with new values from viewMyTrainings
//	            // You may need to implement the update logic based on your requirements
//	            existingRecord.setTname(viewMyTrainings.getTname());
//	            existingRecord.setTmode(viewMyTrainings.getTmode());
//	            existingRecord.setTdescription(viewMyTrainings.getTdescription());
//	            existingRecord.setMaplocation(viewMyTrainings.getMaplocation());
//	            existingRecord.setEnddate(viewMyTrainings.getEnddate());
//	            existingRecord.setResourcetype(viewMyTrainings.getResourcetype());
//	            existingRecord.setStartdate(viewMyTrainings.getStartdate());
//	            existingRecord.setTagency(viewMyTrainings.getTagency());
//	            existingRecord.setTrainername(viewMyTrainings.getTrainername());
//	            existingRecord.setTreasuryid(viewMyTrainings.getTreasuryid());
//	            existingRecord.setVaddress(viewMyTrainings.getVaddress());
//	            existingRecord.setVcontact(viewMyTrainings.getVcontact());
//	            existingRecord.setVname(viewMyTrainings.getVname());
//	            // Update other fields as needed
// 
//	            // Then save the updated data
//	            ViewMyTrainingsRepo.save(existingRecord);
//	        } else {
//	            // Data does not exist, add it to the set
//	            uniqueTrainings.add(viewMyTrainings);
//	        }
//	    }
// 
//	    // Save all unique records in the set
//	    return ViewMyTrainingsRepo.saveAll(uniqueTrainings);
//	}
//
//	private ViewMyTrainings createViewMyTrainingsFromResultArray(Object[] result) {
//	    ViewMyTrainings viewMyTrainings = new ViewMyTrainings();
//	    
//	    viewMyTrainings.setTreasuryid(result[0].toString()); 
//	    viewMyTrainings.setTname(result[1].toString());
//	    viewMyTrainings.setVname(result[2].toString());
//	    viewMyTrainings.setTmode(result[3].toString());
//	    viewMyTrainings.setTdescription(result[4].toString());
//	    viewMyTrainings.setStartdate(result[5].toString());
//	    viewMyTrainings.setEnddate(result[6].toString());
//	    viewMyTrainings.setVaddress(result[7].toString());
//	    viewMyTrainings.setMaplocation(result[10].toString());
//	    viewMyTrainings.setVcontact(result[8].toString()+" "+result[9].toString());
//	    viewMyTrainings.setResourcetype(result[11].toString());
//
//	    return viewMyTrainings;
//	}
//	
	//get waiting for waiting-for-approval list
	
	public List<Map<String, Object>> getCustomData() {
		List<Object[]> result = ViewMyTrainingsRepo.findCustomData();
 
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("MobileNumber", row[5]);
			rowData.put("Designation", row[6]);
			rowData.put("DOB", row[7]);
			rowData.put("FullName", row[8]);
			rowData.put("SchoolUdiseCode", row[9]);
			rowData.put("District", row[10]);
			rowData.put("Applydate", row[11]);
			rowData.put("ResourceType", row[12]);
			rowData.put("RefPlannerId", row[13]);
			return rowData;
		}).collect(Collectors.toList());
	}
	
	//get waiting for approved list
	@Override
	public List<Map<String, Object>> getAppovedData() {
		List<Object[]> result = ViewMyTrainingsRepo.findApprovedData();
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("secondlevelapproval", row[5]);
			rowData.put("MobileNumber", row[6]);
			rowData.put("Designation", row[7]);
			rowData.put("DOB", row[8]);
			rowData.put("FullName", row[9]);
			rowData.put("SchoolUdiseCode", row[10]);
			rowData.put("District", row[11]);
			rowData.put("Applydate", row[12]);
			rowData.put("ResourceType", row[13]);
			rowData.put("RefPlannerId", row[14]);
			return rowData;
		}).collect(Collectors.toList());

	}
	
	//get waiting for rejected list
	@Override
	public List<Map<String, Object>> getRejectedData() {
		List<Object[]> result = ViewMyTrainingsRepo.findRejectedData();
		return result.stream().map(row -> {
			Map<String, Object> rowData = new HashMap<>();
			rowData.put("TrainingName", row[0]);
			rowData.put("TrainingMode", row[1]);
			rowData.put("TreasuryId", row[2]);
			rowData.put("Description", row[3]);
			rowData.put("vaddress", row[4]);
			rowData.put("Remarks", row[5]);
			rowData.put("MobileNumber", row[6]);
			rowData.put("Designation", row[7]);
			rowData.put("DOB", row[8]);
			rowData.put("FullName", row[9]);
			rowData.put("SchoolUdiseCode", row[10]);
			rowData.put("District", row[11]);
			rowData.put("Applydate", row[12]);
			rowData.put("ResourceType", row[13]);
			rowData.put("RefPlannerId", row[14]);
			return rowData;
		}).collect(Collectors.toList());
		
	}
	
	@Override
	@Transactional
	public void updateStatusToApproved(String treasuryId, String refPlannerId) {
			ViewMyTrainingsRepo.updateStatusByTreasuryId(treasuryId,refPlannerId);
	}
	
	@Override
	@Transactional
	public void rejectStatusToApproved(String treasuryId,String refPlannerId) {
		ViewMyTrainingsRepo.rejectStatusByTreasuryId(treasuryId,refPlannerId);
	}
	
	
	//count waiting for approval list teachers
	@Override
	public long countWaitingForApprovalUsersList() {
		return ViewMyTrainingsRepo.countByStatusWaitingForApproval();
	}
	
	//count for approved list teachers
	@Override
	public long countApprovedUsersList() {
		return ViewMyTrainingsRepo.countByStatusAppoved();
	}
	@Override
	public long countRejectedUsersList() {
		return ViewMyTrainingsRepo.countByStatusRejected();
	}
	
	 public void updateStatusAndRemarks(String treasuryId, String refPlannerIds, String remarks) {
	          ViewMyTrainingsRepo.updateStatusAndRemarks(treasuryId, refPlannerIds, remarks);
	    }
	 
	 public void updateStatusAndRemarksForSecondLevelApproval(String treasuryId, String refPlannerIds, String secondlevelapproval) {
		 ViewMyTrainingsRepo.updateStatusAndRemarksForSecondLevelApproval(treasuryId, refPlannerIds, secondlevelapproval);
	 }
	 public void storeDataNominate(List<NominateTrainingsDto> selectedRowsData) {
	        for (NominateTrainingsDto rowData : selectedRowsData) {
	            NominateTrainings entity = new NominateTrainings();
	            entity.setTreasuryid(rowData.getTreasuryid());
	            entity.setRef_planner_id(rowData.getRef_planner_id());
	            entity.setVenue_id(rowData.getVenue_id());
	            entity.setMobilenumberteacher(rowData.getMobilenumberteacher());
	            entity.setTeacher_name(rowData.getTeacher_name());
	            entity.setDob(rowData.getDob());
	            entity.setDistrict_name(rowData.getDistrict_name());
	            entity.setSchool_name(rowData.getSchool_name());
	            entity.setSchool_code(rowData.getSchool_code());
	            entity.setDesignation(rowData.getDesignation());
	            entity.setAppliedtype(rowData.getAppliedtype());
	            
	            entity.setTname(rowData.getTname());
	            entity.setVenue_name(rowData.getVenue_name());
	            entity.setVaddress(rowData.getVaddress());
	            entity.setTmode(rowData.getTmode());
	            entity.setTraining_start_dt(rowData.getTraining_start_dt());
	            entity.setTraining_end_dt(rowData.getTraining_end_dt());
	            entity.setTstarttime(rowData.getTstarttime());
	            entity.setTendtime(rowData.getTendtime());
	            entity.setCoordinatormobileno(rowData.getCoordinatormobileno());
	            
	            entity.setMaplocation(rowData.getMaplocation());
	            entity.setTdescription(rowData.getTdescription());
	            entity.setTagency(rowData.getTagency());
	            entity.setResourcetype(rowData.getResourcetype());
	            

	            // Save to the database
	            nominateTrainingsRepository.save(entity);
	        }
	    } 
		
	
	//get self attended teachers list
//		@Override
//		public List<Map<String, Object>> getSelfAttendedData() {
//			List<Object[]> result = ViewMyTrainingsRepo.findSelfAttendedTeachersData();
//			return result.stream().map(row -> {
//				Map<String, Object> rowData = new HashMap<>();
//				rowData.put("TrainingName", row[0]);
//				rowData.put("TrainingMode", row[1]);
//				rowData.put("TreasuryId", row[2]);
//				rowData.put("Description", row[3]);
//				rowData.put("VenueName", row[3]);
//				rowData.put("vaddress", row[4]);
//				rowData.put("secondlevelapproval", row[5]);
//				rowData.put("MobileNumber", row[6]);
//				rowData.put("Designation", row[7]);
//				rowData.put("DOB", row[8]);
//				rowData.put("FullName", row[9]);
//				rowData.put("SchoolUdiseCode", row[10]);
//				rowData.put("District", row[11]);
//				rowData.put("Applydate", row[12]);
//				rowData.put("ResourceType", row[13]);
//				rowData.put("RefPlannerId", row[14]);
//				return rowData;
//			}).collect(Collectors.toList());
//
//		}
		
		public List<Map<String, Object>> getSelfAttendedData() {
			 return ViewMyTrainingsRepo.findSelfAttendedTeachersData();
		 }
		
		 public List<NominateTrainings> getNominatedTrainings() {
		        return nominateTrainingsRepository.findByAppliedtype("nominated");
		    }
		 public List<Map<String, Object>> getNominateTeacher() {
			 return ViewMyTrainingsRepo.findNominatedTrainings();
		 }
		 
//		 public List<Map<String, Object>> getNominateTeacher() {
//				List<Object[]> resultNominate = ViewMyTrainingsRepo.findNominatedTrainings();
//		 
//				return resultNominate.stream().map(row -> {
//					Map<String, Object> rowData = new HashMap<>();
//					rowData.put("TreasuryId", row[0]);
//					rowData.put("Description", row[1]);
//					rowData.put("RefPlannerId", row[2]);
//					rowData.put("MobileNumber", row[3]);
//					rowData.put("Designation", row[4]);
//					rowData.put("DOB", row[5]);
//					rowData.put("TrainingName", row[6]);
//					rowData.put("TrainingMode", row[7]);
//					rowData.put("VenueName", row[8]);
//					rowData.put("vaddress", row[9]);
//					rowData.put("ResourceType", row[10]);
//					rowData.put("FullName", row[11]);
//					rowData.put("SchoolUdiseCode", row[12]);
//					rowData.put("District", row[13]);
//					rowData.put("Applydate", row[14]);
//
//					
//					return rowData;
//				}).collect(Collectors.toList());
//			}
		 
		 @Override
			@Transactional
			public void updateStatusToApprovedNomonate(String treasuryId, String refPlannerId) {
					nominateTrainingsRepository.updateStatusByTreasuryId(treasuryId,refPlannerId);
					
			}
			
		 public List<Map<String, Object>> findRejectedData() {
		        return ViewMyTrainingsRepo.findRejectedDataList();
		    }
		 
		 public List<Map<String, Object>> findApprovedDataTeacher() {
			 return ViewMyTrainingsRepo.findApprovedDataList();
		 }
		 public List<Map<String, Object>> findApprovedDataTeacherTrainingVenueId(String trainingId, String venueId ) {
			 return ViewMyTrainingsRepo.findApprovedDataListTrainingVenueId(trainingId,venueId);
		 }
			
		
			
		
		 
		 
		 @Override
			public List<ViewMyTrainings> savemyTrainingsxyz(String treasuryid, String ref_planner_id, long venueid) {
				// TODO Auto-generated method stub
				List<Object[]> findTrainingDetails = ViewMyTrainingsRepo.findTrainingDetails(ref_planner_id, venueid, treasuryid);
				
				
				
				for (Object[] row : findTrainingDetails) {
				    for (int i = 0; i < row.length; i++) {
				        System.out.println("Index " + i + ": " + row[i]);
				    }
				    System.out.println(); // Add a newline to separate rows
				}
				
		        List<ViewMyTrainings> viewMyTrainingsList = new ArrayList<>();
		        for (Object[] row : findTrainingDetails) {
		            ViewMyTrainings viewMyTrainings = new ViewMyTrainings();
		            viewMyTrainings.setVid((long) row[11]);
		            viewMyTrainings.setRef_planner_id((String) row[0]);
		            viewMyTrainings.setTreasuryid((String) row[17]);
		            viewMyTrainings.setTname((String) row[1]);
		            viewMyTrainings.setVname((String) row[15]);
		            viewMyTrainings.setTmode((String) row[4]);
		            viewMyTrainings.setTdescription((String) row[2]);
		            viewMyTrainings.setStartdate((String) row[5]);
		            viewMyTrainings.setEnddate((String) row[6]);
		            viewMyTrainings.setVaddress((String) row[10]);
		            viewMyTrainings.setVcontact((String) row[14]+ " "+(String) row[13]);
		            //viewMyTrainings.setVcontact((String) row[11]);
		            viewMyTrainings.setMaplocation((String) row[16]);
		            viewMyTrainings.setResourcetype((String) row[7]);
		            viewMyTrainings.setTagency((String) row[3]);
		            viewMyTrainings.setTstarttime((String) row[8]);
		            viewMyTrainings.setTendtime((String) row[9]);
		            
		            
		            // Set other fields based on your query

		            viewMyTrainingsList.add(viewMyTrainings);
		            
		            System.out.println("list count: "+viewMyTrainingsList.size());
		        }
		        
		      

		        return ViewMyTrainingsRepo.saveAll(viewMyTrainingsList);
			}
			
		 
		 @Override
			public List<ViewMyTrainings> checkIfAlreadyAppliedTrainings(String treasuryId, String refPlannerIds) {
				List<ViewMyTrainings> trainings = ViewMyTrainingsRepo.findByTreasuryIdAndRefPlannerId(treasuryId, refPlannerIds);
				return trainings;
			}
				
			
}


	


	






	
	

	



