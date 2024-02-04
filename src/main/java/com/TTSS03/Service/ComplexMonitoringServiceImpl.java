/**
 * 
 */
package com.TTSS03.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.ComplexMonitoring;
import com.TTSS03.Repository.ComplexMonitoringRepository;

/**
 * 
 */
@Service
public class ComplexMonitoringServiceImpl implements ComplexMonitoringService {
	
	@Autowired
	ComplexMonitoringRepository complexMonitoringRepo;

	@Override
	public ComplexMonitoring saveOne(ComplexMonitoring complexMonitoring) {
		return complexMonitoringRepo.save(complexMonitoring);
	}

}
