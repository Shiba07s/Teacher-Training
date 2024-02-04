package com.TTSS03.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.TTSS03.Entity.ComponentLimit;

public interface ComponentLimitRepository extends JpaRepository<ComponentLimit, Long> {
	
	 @Query("SELECT r.resources, r.approved_rate,r.unit FROM ComponentLimit r WHERE r.resources IN (:resourceNames)")
	    List<Object[]> findResourcesAndRatesByNames(@Param("resourceNames") List<String> resourceNames);

}
