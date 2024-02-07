package com.TTSS03.Service;
 
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.TTSS03.Entity.TraineesLimit;
import com.TTSS03.Entity.VendorLimit;
import com.TTSS03.Repository.TraineesLimitRepository;
 
@Service
public class TraineesLimitServiceImpl implements TraineesLimitService {
	@Autowired
	private TraineesLimitRepository traineesLimitRepository;
 
	 public List<TraineesLimit> getAllData() {
	        return traineesLimitRepository.findAll();
	    }
	 
	 @Override
		public List<TraineesLimit> getAllTraineesLimit() {
			return traineesLimitRepository.findActiveTraineesLimit();
		}
	 
	 @Override
		public TraineesLimit saveOneTraineesLimit(TraineesLimit traineesLimit) {
			// TODO Auto-generated method stub
			return traineesLimitRepository.save(traineesLimit);
		}
	 
	 @Override
		@Transactional
		public void updateTraineesLimit(long sl, TraineesLimit traineesLimit) {
			// TODO Auto-generated method stub
			traineesLimitRepository.updateTraineesLimit(sl, traineesLimit.getBudgetedYear(),
					traineesLimit.getApprovedRate(),
					traineesLimit.getExpenseType(),
					traineesLimit.getTraineeRole(),
					traineesLimit.getUnit());
			
		} 
	 
	 @Override
		@Transactional

		public void deActivateTraineesLimit(long sl) {
			// TODO Auto-generated method stub
			traineesLimitRepository.deactivateTraineesLimit(sl);;
			
		}
	 
	 @Override
		public TraineesLimit getTraineesLimit(long sl) {
			// TODO Auto-generated method stub
			return traineesLimitRepository.findById(sl).orElse(null);
		}
 


 
}