/**
 * 
 */
package com.TTSS03.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.DataTracking;
import com.TTSS03.Repository.DataTrackingRepository;

/**
 * 
 */

@Service
public class DataTrackingServiceImpl implements DataTrackingService {
	
	@Autowired
	DataTrackingRepository dataTrackingRepo;

	@Override
	public DataTracking saveOne(DataTracking dataTracking) {
		return dataTrackingRepo.save(dataTracking);
	}

}
