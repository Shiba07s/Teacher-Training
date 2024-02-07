package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.TraineesLimit;
import com.TTSS03.Entity.VendorLimit;

public interface TraineesLimitService {
	
	List<TraineesLimit> getAllData() ;
	
	 List<TraineesLimit> getAllTraineesLimit() ;
	 
	 TraineesLimit saveOneTraineesLimit(TraineesLimit traineesLimit);
	 
	 void updateTraineesLimit(long sl, TraineesLimit traineesLimit);
	 
	 void deActivateTraineesLimit(long sl);
	 
	 TraineesLimit getTraineesLimit(long sl);

}
