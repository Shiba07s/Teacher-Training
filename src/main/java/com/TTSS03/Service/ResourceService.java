package com.TTSS03.Service;

import java.util.List;

import com.TTSS03.Entity.Resource;

public interface ResourceService {
	List<Resource> getAllResouceData(Resource resource);
	
	Resource saveOneSpell (Resource resource);
	
	 void updateResourceType(long resourcecode,String resourcetype);
	    
	    void deActivateResourceType(long resourcecode);

		Resource findByResourceId(long resourcecode);

}
