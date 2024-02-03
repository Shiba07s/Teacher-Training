package com.TTSS03.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Repository.ComponentLimitRepository;

@Service
public class ComponentLimitServiceImpl implements ComponentLimitService {
	
	@Autowired
	ComponentLimitRepository ComponentLimitRepo;

	@Override
	public List<Object[]> getResourcesAndRatesByNames(List<String> resourceNames) {
		// TODO Auto-generated method stub
		return ComponentLimitRepo.findResourcesAndRatesByNames(resourceNames);
	}

}
