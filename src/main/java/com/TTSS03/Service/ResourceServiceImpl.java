package com.TTSS03.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.TTSS03.Entity.Resource;
import com.TTSS03.Repository.ResourceRepository;

@Service
public class ResourceServiceImpl implements ResourceService {
	
	@Autowired
	private ResourceRepository resourceRepo;
 
	@Override
	public List<Resource> getAllResouceData(Resource resource) {
		return resourceRepo.findActiveResourceType();
	}

	@Override
	public Resource saveOneSpell(Resource resource) {
		// TODO Auto-generated method stub
		return resourceRepo.save(resource);
	}

	@Override
	@Transactional
	public void updateResourceType(long resourcecode, String resourcetype) {
		// TODO Auto-generated method stub
		resourceRepo.updateResourceType(resourcecode, resourcetype);
		
	}

	@Override
	@Transactional
	public void deActivateResourceType(long resourcecode) {
		// TODO Auto-generated method stub
		resourceRepo.deactivateResourceType(resourcecode);
		
	}

	@Override
	public Resource findByResourceId(long resourcecode) {
		// TODO Auto-generated method stub
		return resourceRepo.findById(resourcecode).orElse(null);
	}
 
}
