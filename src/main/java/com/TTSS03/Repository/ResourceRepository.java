package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.Resource;

public interface ResourceRepository extends JpaRepository<Resource, Long> {
	
	
	 @Modifying
	    @Query("UPDATE Resource t SET t.resourcetype = :resourcetype WHERE t.resourcecode = :resourcecode")
	    int updateResourceType(@Param("resourcecode") long resourcecode, @Param("resourcetype") String resourcetype);

	 
	 
	 @Modifying
	    @Query("UPDATE Resource e SET e.status = 'Inactive' WHERE e.resourcecode = :resourcecode")
	    void deactivateResourceType(@Param("resourcecode") long resourcecode);
	 
	 
	 @Query("SELECT t FROM Resource t WHERE t.status = 'Active'")
	    List<Resource> findActiveResourceType();

}
