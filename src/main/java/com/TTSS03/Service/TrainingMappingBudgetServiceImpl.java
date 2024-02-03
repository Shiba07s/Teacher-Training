package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.SearchVenue;
import com.TTSS03.Entity.TrainingMappingBudget;
import com.TTSS03.Repository.TrainingMappingBudgetRepository;

@Service
public class TrainingMappingBudgetServiceImpl implements TrainingMappingBudgetService {
	
	@Autowired
	private TrainingMappingBudgetRepository trainingMappingRepo;

	@Override
	public List<TrainingMappingBudget> getAllMappingData() {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findAll();
	}
	
	 public List<TrainingMappingBudget> findDistinctTrainingTransactions() {
	        return trainingMappingRepo.findDistinctTrainingTransactions();
	    }

	@Override
	public List<TrainingMappingBudget> getMappingDataOnTrainingidAndVenueid(String trainingid, String venueid) {
		// TODO Auto-generated method stub
		return trainingMappingRepo.findByTrainingIdAndVenueId(trainingid, venueid);
	}
	
//	@Override
//	@Transactional
//	public void updateTrainingMappingBudget(String trainingid, String venueid, TrainingMappingBudget trainingMappingBudget) {
//	    trainingMappingRepo.updateTrainingMappingBudget(trainingid, venueid,
//	            trainingMappingBudget.getBudgetedyear(), trainingMappingBudget.getTrainingname(),
//	            trainingMappingBudget.getTccode(), trainingMappingBudget.getTcname(),
//	            trainingMappingBudget.getEstimatedbudget(), trainingMappingBudget.getSanctionedbudget(),
//	            trainingMappingBudget.getAdditionalbudget(), trainingMappingBudget.getApprovedbudget(),
//	            trainingMappingBudget.getTraineerole(), trainingMappingBudget.getFrequency(),
//	            trainingMappingBudget.getUnit(), trainingMappingBudget.getAmount());
//	}
	
	 @Transactional
	    public void approveTraining(String trainingid, String venueid ,String budgetedyear,String trainingname,String tccode,String tcname,String estimatedbudget,
	    		String sanctionedbudget,String additionalbudget,String approvedbudget,String traineerole,
	    		String frequency,String unit,String amount) {
	        try {
	            int rowsUpdated = trainingMappingRepo.updateTrainingMappingBudget(trainingid, venueid, budgetedyear, trainingname, tccode, tcname, estimatedbudget, sanctionedbudget, additionalbudget, approvedbudget, traineerole, frequency, unit, amount);
	            
	            if (rowsUpdated > 0) {
	                System.out.println("Training approved successfully!");
	            } else {
	                System.out.println("No records updated. Training approval failed.");
	            }
	        } catch (Exception e) {
	            System.err.println("Error updating training mapping budget: " + e.getMessage());
	            // Handle the exception as needed
	        }
	    }
	 
//	 @Override
//	 @Transactional
//	    public void updateAllMappings(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings) {
//	        for (TrainingMappingBudget updatedMapping : updatedMappings) {
//	            // Pass trainingId and venueId to the updateSingleMapping method
//	            updateSingleMapping(trainingid, venueid, updatedMapping);
//	        }
//	 }
	 @Override
	 @Transactional
	 public void updateSingleMapping(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings) {
	     try {
	         for (TrainingMappingBudget updatedMapping : updatedMappings) {
	             TrainingMappingBudget existingMapping = trainingMappingRepo.findById(updatedMapping.getSl()).orElse(null);

	             if (existingMapping != null) {
	                 existingMapping.setRecordstatus(updatedMapping.getRecordstatus());
	                 existingMapping.setApprovedbudget(updatedMapping.getApprovedbudget());

	                 // Update the fields you want to update
//	                 existingMapping.setBudgetedyear(updatedMapping.getBudgetedyear());
//	                 existingMapping.setTrainingname(updatedMapping.getTrainingname());
//	                 existingMapping.setTccode(updatedMapping.getTccode());
//	                 existingMapping.setAdditionalbudget(updatedMapping.getAdditionalbudget());
//	                 existingMapping.setAmount(updatedMapping.getAmount());
//	                 existingMapping.setEstimatedbudget(updatedMapping.getEstimatedbudget());
//	                 existingMapping.setFrequency(updatedMapping.getFrequency());
//	                 existingMapping.setSanctionedbudget(updatedMapping.getSanctionedbudget());
//	                 existingMapping.setRecordstatus(updatedMapping.getRecordstatus());
	                 
	                 // Set other fields as needed

	                 // Save the updated entity
	                 trainingMappingRepo.save(existingMapping);
	             } else {
	                 // Handle the case where the entity does not exist
	                 // You might want to log a message or throw an exception
	             }
	         }
	     } catch (Exception e) {
	         // Handle the exception as needed
	         e.printStackTrace(); // You might want to log the exception
	     }
	 }

	@Override
	 @Transactional
	public void updatestatus(String trainingid, String venueid) {
		// TODO Auto-generated method stub
		trainingMappingRepo.updaterecordstatus(trainingid, venueid);
		
	}
	
	@Override
	@Transactional
	public void updaterecordstatusSecondlevel(String trainingid, String venueid,TrainingMappingBudget trainingMappingBudget) {
		// TODO Auto-generated method stub
		trainingMappingRepo.updaterecordstatusSecondlevel(trainingid, venueid, trainingMappingBudget.getAdditionalbudget(), trainingMappingBudget.getApprovedbudget());
		
	}
	
	
	//second level approval proceess
	 @Override
	 @Transactional
	 public void updaterecordstatusSecondlevel(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappingss) {
	     try {
	         for (TrainingMappingBudget updatedMappingg : updatedMappingss) {
	             TrainingMappingBudget existingMappingg = trainingMappingRepo.findById(updatedMappingg.getSl()).orElse(null);

	             if (existingMappingg != null) {
	                 // Update the fields you want to update
	                 existingMappingg.setAdditionalbudget(updatedMappingg.getAdditionalbudget());
	                 existingMappingg.setApprovedbudget(updatedMappingg.getApprovedbudget());
	                 existingMappingg.setRecordstatus(updatedMappingg.getRecordstatus());

	                 // Save the updated entity
	                 trainingMappingRepo.save(existingMappingg);
	             } else {
	                 // Handle the case where the entity does not exist
	                 // You might want to log a message or throw an exception
	             }
	         }
	     } catch (Exception e) {
	         // Handle the exception as needed
	         e.printStackTrace(); // You might want to log the exception
	     }
	 }

	
	
	
	
	@Override
	public List<TrainingMappingBudget> findByMappingId(long mid) {
		  List<TrainingMappingBudget> findByMId = trainingMappingRepo.findByMId(mid);
		return findByMId;	
		}
	
//	@Override
//	@Transactional
//	public void updatevenue(long vid, SearchVenue Searchvenue) {
//		// TODO Auto-generated method stub
//		SearchVenueRepo.updateVenue(vid, Searchvenue.getVname(), Searchvenue.getVstate(), Searchvenue.getVmandal(), Searchvenue.getVdistrict(), Searchvenue.getVlocation(), Searchvenue.getVcapacity(), Searchvenue.getVaddress(), Searchvenue.getLandmark(), Searchvenue.getVtype(), Searchvenue.getVcontactname(), Searchvenue.getVcontactno(), Searchvenue.getVcontactmailid(), Searchvenue.getMaplocation());
//		
//	}
	
	@Override
	@Transactional
	public void updateTrainingMappingBudgetByid(long mid, TrainingMappingBudget trainingMappingBudget) {
	    trainingMappingRepo.updateTrainingMappingBudgetById(
	            trainingMappingBudget.getSl(),
	            trainingMappingBudget.getBudgetedyear(),
	            trainingMappingBudget.getTrainingname(),
	            trainingMappingBudget.getTccode(),
	            trainingMappingBudget.getTcname(),
	            trainingMappingBudget.getEstimatedbudget(),
	            trainingMappingBudget.getSanctionedbudget(),
	            trainingMappingBudget.getAdditionalbudget(),
	            trainingMappingBudget.getApprovedbudget(),
	            trainingMappingBudget.getTraineerole(),
	            trainingMappingBudget.getFrequency(),
	            trainingMappingBudget.getUnit(),
	            trainingMappingBudget.getAmount(),
	            mid);
	}

	@Override
	public void updateAllMappings(String trainingid, String venueid, List<TrainingMappingBudget> updatedMappings) {
		// TODO Auto-generated method stub
		
	}
	  

//	@Override
//	public void updaterecordstatusSecondlevel(String trainingid, String venueid,
//			TrainingMappingBudget trainingMappingBudget) {
//		// TODO Auto-generated method stub
//		
//	}


//	 @Override
//	    @Transactional
//	    public void updateSingleMapping(String trainingid, String venueid, TrainingMappingBudget updatedMapping) {
//	        try {
//	            // Use your existing update method or create a new one
//	            // For example:
//	            trainingMappingRepo.updateTrainingMappingBudget(
//	                trainingid,
//	                venueid,
//	                updatedMapping.getBudgetedyear(),
//	                updatedMapping.getTrainingname(),
//	                updatedMapping.getTcname(),
//	                updatedMapping.getTccode(),
//	                updatedMapping.getEstimatedbudget(),
//	                updatedMapping.getSanctionedbudget(),
//	                updatedMapping.getApprovedbudget(),
//	                updatedMapping.getAdditionalbudget(),
//	                updatedMapping.getTraineerole(),
//	                updatedMapping.getFrequency(),
//	                updatedMapping.getUnit(),
//	                updatedMapping.getAmount()
//	                // ... other parameters
//	            );
//	        } catch (Exception e) {
//	            // Handle the exception as needed
//	            e.printStackTrace(); // You might want to log the exception
//	        }
//	    }


}

//@Override
//public void updateTrainingMappingBudget(String trainingid, String venueid,
//		TrainingMappingBudget trainingMappingBudget) {
//	// TODO Auto-generated method stub
//	
//}
