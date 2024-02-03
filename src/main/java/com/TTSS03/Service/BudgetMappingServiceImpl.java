package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.BudgetMapping;
import com.TTSS03.Repository.BudgetMappingRepository;

@Service
public class BudgetMappingServiceImpl implements BudgetMappingService {
	
	@Autowired
	BudgetMappingRepository BudgetMappingRepo;

	 @Override
	    public void saveBudgetMappings(List<BudgetMapping> budgetMappings, String trainingId, String budgetedYear,String trainingname) {
	        for (BudgetMapping budgetMapping : budgetMappings) {
	            // Set trainingId and budgetedYear for each entry
	            budgetMapping.setTrainingid(trainingId);
	            budgetMapping.setBudgetedyear(budgetedYear);
	            budgetMapping.setTrainingname(trainingname);;
	            
	            
	         
	        }

	        // Save the list of budgetMappings
	        BudgetMappingRepo.saveAll(budgetMappings);
	    }

}
